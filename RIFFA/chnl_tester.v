`timescale 1ns/1ns
module chnl_tester #(
	parameter C_PCI_DATA_WIDTH = 9'd32 //128
)
(
	input CLK,
	input RST,
	output CHNL_RX_CLK,
	input CHNL_RX,
	output CHNL_RX_ACK,
	input CHNL_RX_LAST,
	input [31:0] CHNL_RX_LEN,		//Used for system size*num of rows(*4), consider sequence length and the first input
	input [30:0] CHNL_RX_OFF,		//Used for nothing
	input [C_PCI_DATA_WIDTH-1:0]	CHNL_RX_DATA,
	input CHNL_RX_DATA_VALID,
	output CHNL_RX_DATA_REN,
	
	output CHNL_TX_CLK,
	output CHNL_TX,
	input CHNL_TX_ACK,
	output CHNL_TX_LAST,
	output [31:0] CHNL_TX_LEN,
	output [30:0] CHNL_TX_OFF,
	output [C_PCI_DATA_WIDTH-1:0] CHNL_TX_DATA,
	output CHNL_TX_DATA_VALID,
	input CHNL_TX_DATA_REN
);

	// ===================== MSA param / reg / wire (used in tb)=====================

	parameter M_MAX_LENGTH = 1024; // limitation
	parameter M_LENGTH_WIDTH = 11; // for 512's width
	parameter M_AMINO_ACID_WIDTH = 5; // amino acid: 26 types 
	parameter M_NUM_OF_SET = 4; // 4 best offsets 
	// parameter M_MAX_SEGMENT = 250; // not used in tb
	// parameter M_NUM_OF_SEGMENT_WIDTH = 8; // not used in tb
	parameter M_SIMILARITY_SCORE_WIDTH = 16; // for similarity score's width
	parameter M_WINDOW_SIZE_WIDTH = 5; // sliding window size's width
	parameter M_THRESHOLD_WIDTH = 6; // threshold size's width
	parameter M_WINDOW_SIZE = 17; // window size
	parameter M_THRESHOLD = 18; // threshold value


	parameter M_NUM_OF_MAX_PAIRS = 3000000; // 3 million pairs
	parameter M_CNT_PAIR_WIDTH = $clog2(M_NUM_OF_MAX_PAIRS);

	//parameter M_MAX_SEQ_LENGTH = 50157; // longest in HomFam
	parameter M_MAX_SEQ_LENGTH = 1024;
	parameter M_CNT_SEQ_WIDTH = $clog2(M_MAX_SEQ_LENGTH); 



	// performance evaluation
	// reg [31:0] operation_clk_counter_r, operation_clk_counter_w;
	// reg [31:0] fft_clk_counter_r,       fft_clk_counter_w;
	// reg [31:0] ifft_clk_counter_r,      ifft_clk_counter_w;
	// reg [31:0] reduction_clk_counter_r, reduction_clk_counter_w;
	// reg [31:0] aligner_clk_counter_r,   aligner_clk_counter_w;
	// reg [9:0]  out_counter_r,           out_counter_w;
	// reg [9:0]  test_counter_r,          test_counter_w;

	// MSA accelerator in/out
	reg 									  length_valid ;
	reg  [M_AMINO_ACID_WIDTH-1:0]             seq1_acid, seq2_acid;
	reg                                       length_valid_r,length_valid_w;
	reg                                       seq1_valid_r, seq2_valid_r,seq1_valid_w, seq2_valid_w;
	reg  [M_LENGTH_WIDTH-1:0]                 seq1_length, seq2_length;

	reg                                       window_size_valid_r,window_size_valid_w,window_size_valid;
	reg  [M_WINDOW_SIZE_WIDTH-1:0]            window_size_r, window_size_w ;
	reg                                       threshold_valid_r,threshold_valid_w,threshold_valid;
	reg  [M_THRESHOLD_WIDTH-1:0]              threshold_r, threshold_w ;
	wire                                      msa_out_valid;
	wire signed [M_SIMILARITY_SCORE_WIDTH-1:0]  msa_similarity_score;
	wire                                      msa_ready;

	reg	 [M_CNT_SEQ_WIDTH-1:0]				  num_of_seq_r, num_of_seq_w ;
	
	// ==================================================================

	// ======================== RIFFA param / reg / wire  ===============

	parameter S_IDLE 				= 3'd0;
	parameter S_PRE_RECE 			= 3'd1;
	parameter S_LOAD_BUFFER_0 		= 3'd2;
	parameter S_RECE_AND_CAL_0	    = 3'd3;
	parameter S_RECE_AND_CAL_1		= 3'd4;
	parameter S_TRAN 				= 3'd5;
	parameter S_POST_TRAN		    = 3'd6;

	reg [2:0]  	state_r, state_w ;
	// reg [31:0] 	rx_len_r, rx_len_w ;
	// reg [31:0]  rx_cnt_r, rx_cnt_w ;
	reg 	  	rx_get_next ;

	//Core input
	wire [C_PCI_DATA_WIDTH-1:0]		    data_in;
	wire		 						valid_in;
	reg [C_PCI_DATA_WIDTH-1:0]			data_out;
	wire								valid_out;
	wire		 						ready;

	reg								rInEn_r, in_en_w;
	reg [C_PCI_DATA_WIDTH-1:0]		rReciData_r,reci_data_w;
	reg 							TX_valid_r;

	assign 	valid_in = rInEn_r;
	assign  ready    = CHNL_TX_DATA_REN;

	// CHNL_RX: Goes high to signal incoming data. Will remain high until all incoming data is written to the FIFO.
	// CHNL_RX_LAST: High indicates this is the last receive transaction in a sequence.
	// [31:0] CHNL_RX_LEN: Length of receive transaction in 4 byte words. ( 4 bytes = 32 bits )
	// [30:0] CHNL_RX_OFF: Offset in 4 byte words indicating where to start storing received data (if applicable in design -> not in this).
	// [C_PCI_DATA_WIDTH-1:0]	CHNL_RX_DATA: Receive data. 
	// CHNL_RX_DATA_VALID: High if the data on CHNL_RX_DATA is valid.

	// CHNL_TX_ACK: Will be pulsed high for at least 1 cycle to acknowledge the transaction.
	// CHNL_TX_DATA_REN: When high and CHNL_TX_DATA_VALID is high, consumes the data currently available on CHNL_TX_DATA.

	// ============================output================================

	assign CHNL_RX_CLK = CLK;
	assign CHNL_RX_ACK = (state_r == S_PRE_RECE || state_r == S_LOAD_BUFFER_0 ); //Must be pulsed high for at least 1 cycle to acknowledge the incoming data transaction.
	assign CHNL_RX_DATA_REN = rx_get_next ; //When high and CHNL_RX_DATA_VALID is high, consumes the data currently available on CHNL_RX_DATA. -> high whenever at receiving state

	assign CHNL_TX_CLK = CLK;
	//assign CHNL_TX = (state_r == S_TRAN); //Set high to signal a transaction. Keep high until all outgoing data is written to the FIFO.
	assign CHNL_TX_LAST = 1'd1; //High indicates this is the last send transaction in a sequence.
	//assign CHNL_TX_LEN = num_of_seq_r; //Length of send transaction in 4 byte words.
	assign CHNL_TX_OFF = 0; //Offset in 4 byte words indicating where to start storing sent data in the PC thread's receive buffer.
	assign CHNL_TX_DATA = data_out; //Send data.
	//assign CHNL_TX_DATA_VALID = TX_valid_r; //Set high when the data on CHNL_TX_DATA valid. Update when CHNL_TX_DATA is consumed.

	////////////////test//////////////////
		assign CHNL_TX_LEN = 1000; // num of data *4
		assign CHNL_TX = ((state_r == S_TRAN));
		assign CHNL_TX_DATA_VALID = ((state_r == S_TRAN));
		//assign CHNL_TX = ((state_r == S_RECE_AND_CAL_1) );
		//assign CHNL_TX_DATA_VALID = ((state_r == S_RECE_AND_CAL_1));
	//////////////////////////////////////

	// ==================================================================


	// ===================== BRAM param / reg / wire  =====================

	parameter B_MEM_DATA_WIDTH = 128;

	parameter B_MEM_BUFFER1_OFFSET = 50160 ;
	parameter B_MEM_SCORE_OFFSET = 100320 ;

	parameter B_NUM_OF_MAX_MEM_ADDR = 3000000; // ~3 million pairs
	//parameter B_CNT_ADDR_WIDTH = $clog2(B_NUM_OF_MAX_MEM_ADDR);
	// set to 9
	parameter B_CNT_ADDR_WIDTH = 10;

	reg  buffer_ready ;
	wire buffer_loading ;
	wire buffer_calculating ; 

	assign buffer_loading	  = ( state_r == S_RECE_AND_CAL_0 ) ;
	assign buffer_calculating = ( state_r == S_RECE_AND_CAL_1 ) ;

	reg [B_CNT_ADDR_WIDTH-1:0] 	cnt_load_r, cnt_load_w, cnt_cal_r, cnt_cal_w ; // count up to max sequence length: 50157
	reg [M_CNT_SEQ_WIDTH-1:0]	seq1_buf0_length_r, seq1_buf0_length_w, seq2_buf0_length_r, seq2_buf0_length_w ;
	reg [M_CNT_SEQ_WIDTH-1:0]	seq1_buf1_length_r, seq1_buf1_length_w, seq2_buf1_length_r, seq2_buf1_length_w ;

	wire [M_CNT_SEQ_WIDTH-1:0]	max_seq_buf0_length, max_seq_buf1_length ;
	wire [M_CNT_SEQ_WIDTH-1:0]	min_seq_buf0_length, min_seq_buf1_length ;

	assign max_seq_buf0_length = ( seq1_buf0_length_r > seq2_buf0_length_r ) ? seq1_buf0_length_r : seq2_buf0_length_r ;
	assign max_seq_buf1_length = ( seq1_buf1_length_r > seq2_buf1_length_r ) ? seq1_buf1_length_r : seq2_buf1_length_r ;
	assign min_seq_buf0_length = ( seq1_buf0_length_r <= seq2_buf0_length_r ) ? seq1_buf0_length_r : seq2_buf0_length_r ;
	assign min_seq_buf1_length = ( seq1_buf1_length_r <= seq2_buf1_length_r ) ? seq1_buf1_length_r : seq2_buf1_length_r ;

	reg 						mem_w_en0, mem_w_en1, mem_w_en2 ;
	reg [B_MEM_DATA_WIDTH-1:0] 	mem_in0, mem_in1, mem_in2 ;
	reg [B_CNT_ADDR_WIDTH-1:0] 	mem_in_addr0, mem_in_addr1, mem_in_addr2 ;
	reg 						mem_r_en0, mem_r_en1, mem_r_en2 ;
	wire [B_MEM_DATA_WIDTH-1:0] mem_out0, mem_out1, mem_out2 ;
	reg [B_CNT_ADDR_WIDTH-1:0] 	mem_out_addr0, mem_out_addr1, mem_out_addr2 ;

	reg [M_CNT_SEQ_WIDTH-1:0] cnt_seq_r,cnt_seq_w; // how many seqs inputed
	reg wait_cal0_r,wait_cal0_w;
	reg wait_cal1_r,wait_cal1_w;
	reg [8:0] cnt_output_r,cnt_output_w;
	reg [8:0] cnt_offset_r,cnt_offset_w;
	
	// test
	reg [C_PCI_DATA_WIDTH-1:0] test_r [0:99];
	reg [C_PCI_DATA_WIDTH-1:0] test_w [0:99];
	integer i;
	reg [C_PCI_DATA_WIDTH-1:0]		reci_data,reci_data_nxt;
	reg								in_en, in_en_nxt;

	true_dual_port_ram_single_clock #(B_MEM_DATA_WIDTH, B_CNT_ADDR_WIDTH) data_mem_0 ( //buffer 0
		.CLK		( CLK ),
		.w_en       ( mem_w_en0 ),
		.mem_in     ( mem_in0 ),
		.mem_addr_i ( mem_in_addr0 ),
		.r_en       ( mem_r_en0 ),
		.mem_out    ( mem_out0 ),
		.mem_addr_o ( mem_out_addr0 )
	);

	true_dual_port_ram_single_clock #(B_MEM_DATA_WIDTH, B_CNT_ADDR_WIDTH) data_mem_1 ( //buffer 1
		.CLK		( CLK ),
		.w_en       ( mem_w_en1 ),
		.mem_in     ( mem_in1 ),
		.mem_addr_i ( mem_in_addr1 ),
		.r_en       ( mem_r_en1 ),
		.mem_out    ( mem_out1 ),
		.mem_addr_o ( mem_out_addr1 )
	);

	true_dual_port_ram_single_clock #(B_MEM_DATA_WIDTH, B_CNT_ADDR_WIDTH) data_mem_score ( //Mem for output score
		.CLK		( CLK ),
		.w_en       ( mem_w_en2 ),
		.mem_in     ( mem_in2 ),
		.mem_addr_i ( mem_in_addr2 ),
		.r_en       ( mem_r_en2 ),
		.mem_out    ( mem_out2 ),
		.mem_addr_o ( mem_out_addr2 )
	);

	MSA_Accelerator MSA(
		.clk                 (CLK),
		.rst                 (RST),
		.length_valid_i      (length_valid),
		.ref_length_i        (seq1_length),             		//[10:0]        
		.qry_length_i        (seq2_length),             		//[10:0]
		.ref_valid_i         (seq1_valid_r),
		.qry_valid_i         (seq2_valid_r),
		.ref_amino_acid_i    ((!seq1_valid_r) ? 0: seq1_acid),                    	//[4:0]
		.qry_amino_acid_i    ((!seq2_valid_r) ? 0: seq2_acid),                    	//[4:0]
		.window_size_valid_i (window_size_valid),
		.window_size_i       (window_size_r),          			//[4:0]
		.threshold_valid_i   (threshold_valid),
		.threshold_i         (threshold_r),            			//[5:0]
		.valid_o             (msa_out_valid),
		.similarity_score_o  (msa_similarity_score),        	//[15:0]
		.ready_o             (msa_ready)
	);
	// ====================================================================

	always @(*) begin
		// riffa 
		state_w = state_r;
		
		rx_get_next = 0 ;

		// msa
		window_size_w 	= window_size_r ;
		threshold_w 	= threshold_r ;
		num_of_seq_w	= num_of_seq_r ;

		length_valid_w	= 0;
		seq1_valid_w	= 0;
		seq2_valid_w	= 0;
		window_size_valid_w = 0;
		threshold_valid_w	= 0;

		cnt_load_w 		= cnt_load_r ;
		cnt_cal_w 		= cnt_cal_r ;

		seq1_buf0_length_w = seq1_buf0_length_r ;
		seq2_buf0_length_w = seq2_buf0_length_r ;
		seq1_buf1_length_w = seq1_buf1_length_r ;
		seq2_buf1_length_w = seq2_buf1_length_r ;

		mem_w_en0 		= 0 ;
		mem_in0 		= 0 ;
		mem_in_addr0 	= 0 ;
		mem_r_en0 		= 1 ; 
		mem_out_addr0 	= 0 ;

		mem_w_en1 		= 0 ;
		mem_in1 		= 0 ;
		mem_in_addr1 	= 0 ;
		mem_r_en1 		= 1 ; 
		mem_out_addr1 	= 0 ;

		mem_w_en2 		= 0 ;
		mem_in2 		= 0 ;
		mem_in_addr2 	= 0 ;
		mem_r_en2 		= 1 ; 
		mem_out_addr2 	= 0 ;

		length_valid 	= 0 ;

		seq1_valid_w		= 0 ;
		seq2_valid_w		= 0 ;
		seq1_acid	 	= 0 ;
		seq2_acid		= 0 ;
		seq1_length		= 0 ;
		seq2_length		= 0 ;

		cnt_seq_w		= cnt_seq_r;
		wait_cal0_w		= wait_cal0_r;
		wait_cal1_w		= wait_cal1_r;
		cnt_output_w	= cnt_output_r;
		cnt_offset_w	= cnt_offset_r;
		

		

		for (i=0 ; i<100 ; i=i+1) begin
			test_w[i] = test_r[i];
		end

		if (msa_out_valid) begin
			mem_w_en2	= 1;
			mem_in2[15:0] 	= msa_similarity_score ;
			mem_in_addr2 	= cnt_output_r;
			cnt_output_w = cnt_output_r + 1;
		end

		case(state_r)
			S_IDLE: begin
				if(CHNL_RX) begin
					// do nothing but change state to receive parameters for MSA module from CHNL_RX_DATA
					state_w = S_PRE_RECE ;
					// rx_len_w = CHNL_RX_LEN ;
				end
			end

			S_PRE_RECE: begin
				// receive parameters for MSA module from CHNL_RX_DATA
				// (1)window_size_valid, (5)window_size, (1)threshold_valid, (6)threshold, (1)num_of_seq_valid,(18)num_of_seq}
    			// (1)seq1_length_valid, (9)seq2_length, (1)seq2_length_valid (9)seq2_length, (1)seq1_valid, {5}seq1_acid, (1)seq2_valid, {5}seq2_acid}
				rx_get_next 	= 1 ;
				
				if( CHNL_RX_DATA_VALID ) begin
					state_w 		= S_LOAD_BUFFER_0 ;
					cnt_load_w 		= 0 ;
					cnt_cal_w 		= 0 ;

					window_size_w 	=  CHNL_RX_DATA[30:26];
					threshold_w 	=  CHNL_RX_DATA[24:19];
					num_of_seq_w 	=  CHNL_RX_DATA[17:0];

				end
			end

			S_LOAD_BUFFER_0: begin
				// load buffer 0 
				mem_in0[127:10]	= 0;
				mem_in0[9:5] 	= CHNL_RX_DATA[10:6]; // seq1 acid
				mem_in0[4:0] 	= CHNL_RX_DATA[4:0]; // seq2 acid
				mem_in_addr0 	= cnt_load_r ;
				rx_get_next = 1 ;
				reci_data_nxt = CHNL_RX_DATA;

				if( CHNL_RX_DATA_VALID ) begin
					
					if (msa_ready) begin // load threshold
						window_size_valid = 1 ;
						threshold_valid = 1 ;
					end

					if( cnt_load_r == 0 ) begin //First : parameter + first acid
						
						
						seq1_buf0_length_w = CHNL_RX_DATA[30:22];
						seq2_buf0_length_w = CHNL_RX_DATA[20:12];
						
						mem_w_en0 		= 1 ;
						cnt_load_w = cnt_load_r + 1 ; 
						
					end
					else if( {CHNL_RX_DATA[10:6],CHNL_RX_DATA[4:0]} == 10'b1111111111 ) begin
						
						// end case

						// deal with the situation of waiting for msa_ready
						/*
						if( msa_ready ) begin
							// wait till this moment to write the last addr of the buffer
							state_w 		= S_RECE_AND_CAL_0 ;
							mem_w_en0 		= 1 ;
							cnt_load_w 		= 0 ; //counter reset
							cnt_cal_w		= 0;

						end
						else begin
							// counter don't move
							rx_get_next = 0 ;
						end
						*/
						
						
						state_w 		= S_RECE_AND_CAL_0 ;
						mem_w_en0 		= 1 ;
						cnt_load_w 		= 0 ; //counter reset
						cnt_cal_w		= 0;
						

					end
					else begin
						// normal case
						mem_w_en0 		= 1 ;
						cnt_load_w 		= cnt_load_r + 1 ;
					end
				end
			end

			S_RECE_AND_CAL_0: begin
				//test
				//test_w[mem_out_addr0] = mem_out0;

				// calculate buffer0
				mem_out_addr0 	= cnt_cal_r ;
				//mem_out_addr0 	= cnt_offset_r ; // test
				seq1_length 	= seq1_buf0_length_r ;
				seq2_length 	= seq2_buf0_length_r ;
				seq1_acid 	= mem_out0[9:5] ; 
				seq2_acid 	= mem_out0[4:0] ; 

				
				//if (ready) begin ///// test /////
					if( cnt_cal_r == max_seq_buf0_length ) begin

					end
					else if( cnt_cal_r >=  min_seq_buf0_length ) begin
						// reach the shorter sequence's length -> send only the longer one
						if( seq1_buf0_length_r >= seq2_buf0_length_r )begin // send seq1
							seq1_valid_w 	= 1 ;
							seq2_valid_w 	= 0 ; 
						end
						else begin // send seq2
							seq2_valid_w 	= 1 ; 
							seq1_valid_w 	= 0 ;
						end
						cnt_cal_w = cnt_cal_r + 1 ; 

					end
					else begin
						// normal case
						if( cnt_cal_r == 0 )begin // first cycle also send old param to core
							length_valid 	= 1 ;
						end
						
						seq1_valid_w 	= 1 ;
						seq2_valid_w 	= 1 ; 
						cnt_cal_w 	= cnt_cal_r + 1 ; 
						
					end
				//end

				// load buffer1, handle the offset

				mem_in1[127:10] 		= 0;
				mem_in1[9:5] 		= CHNL_RX_DATA[10:6]; // seq1 acid
				mem_in1[4:0] 		= CHNL_RX_DATA[4:0]; 
				mem_in_addr1 		= cnt_load_r;// + B_MEM_BUFFER1_OFFSET;

				if (cnt_seq_r == num_of_seq_r - 1) begin // last seq:no load
					if( msa_ready && cnt_cal_r > 10) begin
						state_w	= S_RECE_AND_CAL_0 ;
						cnt_load_w 		= 0 ;
						cnt_cal_w 		= 0 ;
						cnt_seq_w		= cnt_seq_r;
					end else if (cnt_output_r == num_of_seq_r) begin
						state_w = S_TRAN;
					end

				end else if( CHNL_RX_DATA_VALID ) begin
					if( cnt_load_r == 0 ) begin
						// save new length information
						seq1_buf1_length_w = CHNL_RX_DATA[30:22];
						seq2_buf1_length_w = CHNL_RX_DATA[20:12];
						
						mem_w_en1 			= 1 ;
						cnt_load_w 			= cnt_load_r + 1 ; 
						
					end
					else if( cnt_load_r == max_seq_buf1_length ) begin
						// end case
						// waiting for msa_ready (cal end)
						if( msa_ready) begin
							state_w	= S_RECE_AND_CAL_1 ;

							cnt_load_w 		= 0 ;
							cnt_cal_w 		= 0 ;
							cnt_seq_w		= cnt_seq_r+ 1;

						end
						else begin
							// don't read new data
							cnt_load_w = cnt_load_r;
						end
						
					end
					else begin
						// normal case
						mem_w_en1 		= 1 ;
						cnt_load_w 		= cnt_load_r + 1 ;
					end
					
				end

				if (cnt_load_r == max_seq_buf1_length) begin
					if (msa_ready) rx_get_next = 1;
					else rx_get_next = 0;
				end else begin
					rx_get_next = 1;
				end


				
			end


			S_RECE_AND_CAL_1: begin
				// calculate buffer1
				mem_out_addr1 = cnt_cal_r ; 
				seq1_length 	= seq1_buf1_length_r ;
				seq2_length 	= seq2_buf1_length_r ;
				seq1_acid 	= mem_out1[9:5] ; 
				seq2_acid	= mem_out1[4:0] ;

				//if (ready) begin //test
					if( cnt_cal_r == max_seq_buf1_length ) begin
						// reach the longer sequence's length -> stop sending			
						
					end
					else if( cnt_cal_r >=  min_seq_buf1_length ) begin
						// reach the shorter sequence's length -> send only the longer one
						if( seq1_buf1_length_r >= seq2_buf1_length_r )begin
							seq1_valid_w 	= 1 ;
							seq2_valid_w 	= 0 ; 
						end
						else begin
							seq2_valid_w 	= 1 ; 
							seq1_valid_w 	= 0 ; 
						end
						cnt_cal_w = cnt_cal_r + 1 ; 

					end else begin
						// normal case
						if( cnt_cal_r == 0 )begin // give param at first cycle
							length_valid 	= 1 ;
						end
						
						seq1_valid_w 	= 1 ;
						seq2_valid_w 	= 1 ; 
						cnt_cal_w 	= cnt_cal_r + 1 ; 
						
					end
				//end
				
				
				// load buffer0
				mem_in0[127:10] 	= 0;
				mem_in0[9:5] 	= CHNL_RX_DATA[10:6]; // seq1 acid
				mem_in0[4:0] 	= CHNL_RX_DATA[4:0]; // seq2 acid
				mem_in_addr0 	= cnt_load_r;
				
				if (cnt_seq_r == num_of_seq_r - 1)  begin   // last seq
					if( msa_ready && cnt_cal_r > 10) begin
						state_w	= S_RECE_AND_CAL_1 ;
						cnt_load_w 		= 0 ;
						cnt_cal_w 		= 0 ;
						cnt_seq_w		= cnt_seq_r;
					end else if (cnt_output_r == num_of_seq_r) begin
						state_w = S_TRAN;
					end
				end
				else if( CHNL_RX_DATA_VALID ) begin

					if( cnt_load_r == 0 ) begin
						seq1_buf0_length_w = CHNL_RX_DATA[30:22];
						seq2_buf0_length_w = CHNL_RX_DATA[20:12];
						
						mem_w_en0 		= 1 ;
						cnt_load_w 		= cnt_load_r + 1 ; 
						
					end
					else if( cnt_load_r == max_seq_buf0_length  ) begin
						// end case
						// waiting for msa_ready (cal end)
						if( msa_ready) begin
							// wait till this moment to write the last addr of the buffer
							// only change state under this condition	  
							state_w	= S_RECE_AND_CAL_0 ;
							mem_w_en0 	= 1 ;
							cnt_seq_w		= cnt_seq_r + 1;
							cnt_load_w 		= 0 ;
							cnt_cal_w		= 0;

						end
						else begin
							// do not write data into mem
							cnt_load_w = cnt_load_r;
						end
						
					end
					else begin
						// normal case
						mem_w_en0 		= 1 ;
						cnt_load_w 		= cnt_load_r + 1;
					end
				end 

				if (cnt_load_r == max_seq_buf0_length) begin
					if (msa_ready) rx_get_next = 1;
					else rx_get_next = 0;
				end else begin
					rx_get_next = 1;
				end
			end

			S_TRAN: begin
				// purely transmit the similarity score to PC
				//test
				mem_out_addr0 	= cnt_load_r ;
				//
				
				mem_out_addr2 = cnt_load_r; 

				if( ready == 1 )begin
					if( cnt_load_r >= num_of_seq_r ) begin
						//state_w = S_IDLE ; 
					end
					cnt_load_w = cnt_load_r + 1 ; 
				end
				
			end

		endcase

		data_out 		= mem_out2 ;
		//data_out 		= {window_size_r,threshold_r,num_of_seq_r} ; // test [5;6;10]
		//data_out 		= {seq1_buf0_length_r,seq2_buf0_length_r} ;
		//data_out 		= {seq1_acid,seq2_acid} ;
		//data_out 		= msa_ready ;
		//data_out = CHNL_RX_DATA;
		//data_out = {msa_ready,cnt_seq_r,window_size_r,threshold_r,num_of_seq_r,  length_valid,11'd0,seq1_length,seq2_length,  12'd0,cnt_cal_r,cnt_load_r,  20'd0,seq1_valid_r,seq1_acid,seq2_valid_r,seq2_acid};
	
	end




	always @(posedge CLK or posedge RST) begin
		if (RST) begin
			// riffa 
			state_r 		<= 0 ;
			// rx_len_r <= 0 ;
			// rx_cnt_r <= 0 ;

			// msa
			window_size_r 		<= 0 ;
			threshold_r 		<= 0 ;

			length_valid_r		<= 0;
			seq1_valid_r		<= 0;
			seq2_valid_r		<= 0;
			window_size_valid_r <= 0;
			threshold_valid_r	<= 0;

			// buffer
			seq1_buf0_length_r 	<= 0;
			seq1_buf1_length_r 	<= 0;
			seq2_buf0_length_r 	<= 0;
			seq2_buf1_length_r 	<= 0;

			cnt_seq_r			<= 0;
			num_of_seq_r		<= 0;

			TX_valid_r			<= 0;
			wait_cal0_r			<= 0;
			wait_cal1_r			<= 0;

			cnt_cal_r			<= 0;
			cnt_load_r			<= 0;
			cnt_output_r		<= 0;
			cnt_offset_r		<= 0;

			reci_data	<= 0;
			in_en		<= 0;

			for (i=0 ; i<100 ; i=i+1) begin
				test_r[i] <= 0;
			end


		end
		else begin
			// riffa
			state_r 		<= state_w ;
			// rx_len_r <= rx_len_w ;
			// rx_cnt_r <= rx_cnt_w ;

			// msa
			window_size_r 		<= window_size_w ;
			threshold_r 		<= threshold_w ;

			length_valid_r		<= length_valid_w;
			seq1_valid_r		<= seq1_valid_w;
			seq2_valid_r		<= seq2_valid_w;
			window_size_valid_r <= window_size_valid_w;
			threshold_valid_r	<= threshold_valid_w;

			// buffer
			seq1_buf0_length_r 	<= seq1_buf0_length_w;
			seq1_buf1_length_r 	<= seq1_buf1_length_w;
			seq2_buf0_length_r 	<= seq2_buf0_length_w;
			seq2_buf1_length_r 	<= seq2_buf1_length_w;

			cnt_seq_r			<= cnt_seq_w;
			num_of_seq_r		<= num_of_seq_w;

			TX_valid_r			<= (state_r == S_TRAN);
			wait_cal0_r			<= wait_cal0_w;
			wait_cal1_r			<= wait_cal1_w;

			cnt_cal_r			<= cnt_cal_w;
			cnt_load_r			<= cnt_load_w;
			cnt_output_r		<= cnt_output_w;
			cnt_offset_r		<= cnt_offset_w;

			reci_data	<= reci_data_nxt;
			in_en		<= in_en_nxt;

			for (i=0 ; i<100 ; i=i+1) begin
				test_r[i] <= test_w[i];
			end

		end
	end

endmodule


module true_dual_port_ram_single_clock
#(parameter DATA_WIDTH=128, parameter ADDR_WIDTH=7)
(
	input [(DATA_WIDTH-1):0] mem_in,
	input [(ADDR_WIDTH-1):0] mem_addr_i, mem_addr_o,
	input w_en, r_en, CLK,
	output reg [(DATA_WIDTH-1):0] mem_out
);
	
	// Declare the RAM variable
	reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];
	
	// Port A 
	always @ (posedge CLK)
	begin
		if (w_en) begin
			ram[mem_addr_i] <= mem_in;
		end
	end
	
	// Port B 
	always @ (posedge CLK)
	begin
		if (r_en) begin
			mem_out <= ram[mem_addr_o];
		end
	end
	
endmodule