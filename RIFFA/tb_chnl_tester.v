`timescale 1 ns/10 ps
`include "chnl_tester.v"
`define CYCLE 7.7
`define END_CYCLE 100000



// define different test case
`define TEST_CASE_NUM 9
`define REF0_PATH "./data/test0/ref.txt"
`define QRY0_PATH "./data/test0/qry.txt"
`define GOLDEN0_PATH "./data/test0/golden.txt"
`define REF1_PATH "./data/test1/ref.txt"
`define QRY1_PATH "./data/test1/qry.txt"
`define GOLDEN1_PATH "./data/test1/golden.txt"
`define REF2_PATH "./data/test2/ref.txt"
`define QRY2_PATH "./data/test2/qry.txt"
`define GOLDEN2_PATH "./data/test2/golden.txt"
`define REF3_PATH "./data/test3/ref.txt"
`define QRY3_PATH "./data/test3/qry.txt"
`define GOLDEN3_PATH "./data/test3/golden.txt"
`define REF4_PATH "./data/test4/ref.txt"
`define QRY4_PATH "./data/test4/qry.txt"
`define GOLDEN4_PATH "./data/test4/golden.txt"
`define REF5_PATH "./data/test5/ref.txt"
`define QRY5_PATH "./data/test5/qry.txt"
`define GOLDEN5_PATH "./data/test5/golden.txt"
`define REF6_PATH "./data/test6/ref.txt"
`define QRY6_PATH "./data/test6/qry.txt"
`define GOLDEN6_PATH "./data/test6/golden.txt"
`define REF7_PATH "./data/test7/ref.txt"
`define QRY7_PATH "./data/test7/qry.txt"
`define GOLDEN7_PATH "./data/test7/golden.txt"
`define REF8_PATH "./data/test8/ref.txt"
`define QRY8_PATH "./data/test8/qry.txt"
`define GOLDEN8_PATH "./data/test8/golden.txt"


module tb;
  parameter MAX_LENGTH = 512;
  parameter AMINO_ACID_WIDTH=5;
  parameter LENGTH_WIDTH = 11;
  parameter NUM_OF_SET=4;
  parameter MAX_SEGMENT = 250;
  parameter NUM_OF_SEGMENT_WIDTH = 8;
  parameter SIMILARITY_SCORE_WIDTH = 16;
  parameter WINDOW_SIZE_WIDTH = 5;
  parameter THRESHOLD_WIDTH = 6;

  parameter WINDOW_SIZE = 17;
  parameter THRESHOLD = 18;
  wire [17:0] test_num;
  wire [31:0] SPEC;
  assign test_num = `TEST_CASE_NUM;
  assign SPEC = {1'b0,5'd17,1'b0,6'd18,1'b0,test_num};
  integer cur_output_idx;
  reg	[15:0] golden;

  integer i;
  reg             clk;
    reg             rst;

	reg 			CHNL_RX;
	wire 			CHNL_RX_ACK;
	reg [31:0] 		CHNL_RX_LEN;
	reg [30:0] 		CHNL_RX_OFF;
	reg [127:0]		CHNL_RX_DATA;
	reg 			CHNL_RX_DATA_VALID;
	wire 			CHNL_RX_DATA_REN;
	
	wire 			CHNL_TX;
	reg 			CHNL_TX_ACK;
	wire 			CHNL_TX_LAST;
	wire [31:0] 	CHNL_TX_LEN;
	wire [30:0] 	CHNL_TX_OFF;
	wire [127:0] 	CHNL_TX_DATA;
	wire 			CHNL_TX_DATA_VALID;
	reg 			CHNL_TX_DATA_REN;
	
	reg  [31:0]		in_index;

  reg signed [LENGTH_WIDTH-1:0]    ref_mem0    [0:MAX_LENGTH];
  reg signed [LENGTH_WIDTH-1:0]    qry_mem0    [0:MAX_LENGTH];
  reg [SIMILARITY_SCORE_WIDTH-1:0] golden_mem0 [0:1];
  reg signed [LENGTH_WIDTH-1:0]    ref_mem1    [0:MAX_LENGTH];
  reg signed [LENGTH_WIDTH-1:0]    qry_mem1    [0:MAX_LENGTH];
  reg [SIMILARITY_SCORE_WIDTH-1:0] golden_mem1 [0:1];
  reg signed [LENGTH_WIDTH-1:0]    ref_mem2    [0:MAX_LENGTH];
  reg signed [LENGTH_WIDTH-1:0]    qry_mem2    [0:MAX_LENGTH];
  reg [SIMILARITY_SCORE_WIDTH-1:0] golden_mem2 [0:1];
  reg signed [LENGTH_WIDTH-1:0]    ref_mem3    [0:MAX_LENGTH];
  reg signed [LENGTH_WIDTH-1:0]    qry_mem3    [0:MAX_LENGTH];
  reg [SIMILARITY_SCORE_WIDTH-1:0] golden_mem3 [0:1];
  reg signed [LENGTH_WIDTH-1:0]    ref_mem4    [0:MAX_LENGTH];
  reg signed [LENGTH_WIDTH-1:0]    qry_mem4    [0:MAX_LENGTH];
  reg [SIMILARITY_SCORE_WIDTH-1:0] golden_mem4 [0:1];
  reg signed [LENGTH_WIDTH-1:0]    ref_mem5    [0:MAX_LENGTH];
  reg signed [LENGTH_WIDTH-1:0]    qry_mem5    [0:MAX_LENGTH];
  reg [SIMILARITY_SCORE_WIDTH-1:0] golden_mem5 [0:1];
  reg signed [LENGTH_WIDTH-1:0]    ref_mem6    [0:MAX_LENGTH];
  reg signed [LENGTH_WIDTH-1:0]    qry_mem6    [0:MAX_LENGTH];
  reg [SIMILARITY_SCORE_WIDTH-1:0] golden_mem6 [0:1];
  reg signed [LENGTH_WIDTH-1:0]    ref_mem7    [0:MAX_LENGTH];
  reg signed [LENGTH_WIDTH-1:0]    qry_mem7    [0:MAX_LENGTH];
  reg [SIMILARITY_SCORE_WIDTH-1:0] golden_mem7 [0:1];
  reg signed [LENGTH_WIDTH-1:0]    ref_mem8    [0:MAX_LENGTH];
  reg signed [LENGTH_WIDTH-1:0]    qry_mem8    [0:MAX_LENGTH];
  reg [SIMILARITY_SCORE_WIDTH-1:0] golden_mem8 [0:1];

  reg [31:0] operation_clk_counter_r, operation_clk_counter_w;
  reg [31:0] fft_clk_counter_r,       fft_clk_counter_w;
  reg [31:0] ifft_clk_counter_r,      ifft_clk_counter_w;
  reg [31:0] reduction_clk_counter_r, reduction_clk_counter_w;
  reg [31:0] aligner_clk_counter_r,   aligner_clk_counter_w;
  reg [9:0]  out_counter_r,           out_counter_w;
  reg [9:0]  test_counter_r,          test_counter_w;
 integer idx_test;



  // MSA_0 accelerator in/out
  reg  [AMINO_ACID_WIDTH-1:0]               seq1, seq2;
  reg                                       length_valid_in;
  reg                                       seq1_valid_in, seq2_valid_in;
  reg  [LENGTH_WIDTH-1:0]                   seq1_length, seq2_length;
  reg                                       window_size_valid_in;
  reg  [WINDOW_SIZE_WIDTH-1:0]              window_size_in;
  reg                                       threshold_valid_in;
  reg  [THRESHOLD_WIDTH-1:0]                threshold_in;
  wire                                      valid_out;
  wire signed [SIMILARITY_SCORE_WIDTH-1:0]  similarity_score;
  wire                                      ready;
/*
  MSA_Accelerator MSA_0(
    .clk                 (clk),
    .rst                 (rst),
    .length_valid_i      (length_valid_in),
    .ref_length_i        (seq1_length),
    .qry_length_i        (seq2_length),
    .ref_valid_i         (seq1_valid_in),
    .qry_valid_i         (seq2_valid_in),
    .ref_amino_acid_i    (seq1),
    .qry_amino_acid_i    (seq2),
    .window_size_valid_i (window_size_valid_in),
    .window_size_i       (window_size_in),
    .threshold_valid_i   (threshold_valid_in),
    .threshold_i         (threshold_in),
    .valid_o             (valid_out),
    .similarity_score_o  (similarity_score),
    .ready_o             (ready)
  );
*/
  chnl_tester dut(
        .CLK(clk),
        .RST(rst),
        .CHNL_RX_CLK(),
        .CHNL_RX(CHNL_RX),
        .CHNL_RX_ACK(CHNL_RX_ACK),
        .CHNL_RX_LAST(),
        .CHNL_RX_LEN(CHNL_RX_LEN),
        .CHNL_RX_OFF(CHNL_RX_OFF),
        .CHNL_RX_DATA(CHNL_RX_DATA),
        .CHNL_RX_DATA_VALID(CHNL_RX_DATA_VALID),
        .CHNL_RX_DATA_REN(CHNL_RX_DATA_REN),
        .CHNL_TX_CLK(),
        .CHNL_TX(CHNL_TX),
        .CHNL_TX_ACK(CHNL_TX_ACK),
        .CHNL_TX_LAST(),
        .CHNL_TX_LEN(CHNL_TX_LEN),
        .CHNL_TX_OFF(CHNL_TX_OFF),
        .CHNL_TX_DATA(CHNL_TX_DATA),
        .CHNL_TX_DATA_VALID(CHNL_TX_DATA_VALID),
        .CHNL_TX_DATA_REN(CHNL_TX_DATA_REN)
    );

  // clk & rst 
  initial clk = 1'b0;
  always begin #(`CYCLE*0.5) clk = ~clk; end

	initial begin
		rst = 1'b0;
		#(`CYCLE)
		@(posedge clk); 
		#(1.0) rst = 1'b1;
		#(2*`CYCLE) rst = 1'b0;
	end

  // waveform dump
  // read pattern & golden
  initial begin
    // waveform dump
    `ifdef SDF
      $fsdbDumpfile("tb_syn.fsdb");
      $fsdbDumpvars(0,tb,"+mda");
      $fsdbDumpvars;
    `endif 
    `ifndef SDF
      $fsdbDumpfile("chnl_tester.fsdb");
      $fsdbDumpvars(0,tb,"+mda");
      $fsdbDumpvars;
    `endif
    $readmemb(`REF0_PATH,    ref_mem0);
    $readmemb(`QRY0_PATH,    qry_mem0);
    $readmemb(`GOLDEN0_PATH, golden_mem0);
    $readmemb(`REF1_PATH,    ref_mem1);
    $readmemb(`QRY1_PATH,    qry_mem1);
    $readmemb(`GOLDEN1_PATH, golden_mem1);
    $readmemb(`REF2_PATH,    ref_mem2);
    $readmemb(`QRY2_PATH,    qry_mem2);
    $readmemb(`GOLDEN2_PATH, golden_mem2);
    $readmemb(`REF3_PATH,    ref_mem3);
    $readmemb(`QRY3_PATH,    qry_mem3);
    $readmemb(`GOLDEN3_PATH, golden_mem3);
    $readmemb(`REF4_PATH,    ref_mem4);
    $readmemb(`QRY4_PATH,    qry_mem4);
    $readmemb(`GOLDEN4_PATH, golden_mem4);
    $readmemb(`REF5_PATH,    ref_mem5);
    $readmemb(`QRY5_PATH,    qry_mem5);
    $readmemb(`GOLDEN5_PATH, golden_mem5);
    $readmemb(`REF6_PATH,    ref_mem6);
    $readmemb(`QRY6_PATH,    qry_mem6);
    $readmemb(`GOLDEN6_PATH, golden_mem6);
    $readmemb(`REF7_PATH,    ref_mem7);
    $readmemb(`QRY7_PATH,    qry_mem7);
    $readmemb(`GOLDEN7_PATH, golden_mem7);
    $readmemb(`REF8_PATH,    ref_mem8);
    $readmemb(`QRY8_PATH,    qry_mem8);
    $readmemb(`GOLDEN8_PATH, golden_mem8);
  end

  // data input
  reg [LENGTH_WIDTH-1:0] pat1_length, pat2_length;
  reg [LENGTH_WIDTH-1:0] max_length;
  initial begin
    test_counter_w          = 0;
    out_counter_w           = 0;
    fft_clk_counter_w       = 0;
    ifft_clk_counter_w      = 0;
    reduction_clk_counter_w = 0;
    aligner_clk_counter_w   = 0;
    operation_clk_counter_w = 0;

    length_valid_in = 0;
    seq1_length     = 0;
    seq2_length     = 0;
    seq1_valid_in   = 0;
    seq2_valid_in   = 0;
    seq1            = 0;
    seq2            = 0;

    window_size_valid_in = 0;
    window_size_in       = 0;
    threshold_valid_in   = 0;
    threshold_in         = 0;
    
		$display("-----------------------------------------------------\n");
	 	$display("START!!! Simulation Start .....\n");
	 	$display("-----------------------------------------------------\n");

    #(`CYCLE*10);
    window_size_valid_in  = 1;
    window_size_in        = WINDOW_SIZE;
    threshold_valid_in    = 1;
    threshold_in          = THRESHOLD;
    #(`CYCLE*10)
    window_size_valid_in = 0;
    window_size_in       = 0;
    threshold_valid_in   = 0;
    threshold_in         = 0;
	end

integer cur_input_idx, k, iters;

always @(*) begin
	if (cur_input_idx <= pat1_length) begin
		case (idx_test)
		0: seq1 = ref_mem0[cur_input_idx  ];
		1: seq1 = ref_mem1[cur_input_idx  ];
		2: seq1 = ref_mem2[cur_input_idx  ];
		3: seq1 = ref_mem3[cur_input_idx  ];
		4: seq1 = ref_mem4[cur_input_idx  ];
		5: seq1 = ref_mem5[cur_input_idx  ];
		6: seq1 = ref_mem6[cur_input_idx  ];
		7: seq1 = ref_mem7[cur_input_idx  ];
		8: seq1 = ref_mem8[cur_input_idx  ];
		default: seq1 = ref_mem3[cur_input_idx  ];
		endcase
          
		seq1_valid_in = 1;
	end
	else begin
		seq1 = 0;
		seq1_valid_in = 0;
	end

	if (cur_input_idx <= pat2_length) begin
		case (idx_test)
		0: seq2 = qry_mem0[cur_input_idx  ];
		1: seq2 = qry_mem1[cur_input_idx  ];
		2: seq2 = qry_mem2[cur_input_idx  ];
		3: seq2 = qry_mem3[cur_input_idx  ];
		4: seq2 = qry_mem4[cur_input_idx  ];
		5: seq2 = qry_mem5[cur_input_idx  ];
		6: seq2 = qry_mem6[cur_input_idx  ];
		7: seq2 = qry_mem7[cur_input_idx  ];
		8: seq2 = qry_mem8[cur_input_idx  ];
		default: seq2 = qry_mem3[cur_input_idx  ];
		endcase
		seq2_valid_in = 1;
	end
	else begin
		seq2 = 0;
		seq2_valid_in = 0;
	end
	case (cur_output_idx)
      1: golden = golden_mem0[0];
      2: golden = golden_mem1[0];
      3: golden = golden_mem2[0];
      4: golden = golden_mem3[0];
      5: golden = golden_mem4[0];
      6: golden = golden_mem5[0];
      7: golden = golden_mem6[0];
      8: golden = golden_mem7[0];
      9: golden = golden_mem8[0];
      default: golden = golden_mem3[0];
    endcase
  end
  always @(posedge clk) begin
    test_counter_r <= test_counter_w;
  end


initial begin
	// start RX
	CHNL_RX = 0;
	CHNL_RX_LEN = 0;
	CHNL_RX_OFF = 0;
	CHNL_RX_DATA = 0;
	CHNL_RX_DATA_VALID = 0;
	cur_input_idx = 0;
	idx_test = 0;
	#(5*`CYCLE);
	@(posedge clk);
	#1;
	CHNL_RX = 1;
	CHNL_RX_LEN = 0;//(NUM_OF_QRY_PAT + NUM_OF_REF_PAT + 2) << 2;
	CHNL_RX_OFF = 0;
	wait(CHNL_RX_ACK);
	
	while (idx_test < `TEST_CASE_NUM) begin
		case(idx_test)
		0: begin
			pat1_length = ref_mem0[0];
			pat2_length = qry_mem0[0];
		end
		1: begin
			pat1_length = ref_mem1[0];
			pat2_length = qry_mem1[0];
		end
		2: begin
			pat1_length = ref_mem2[0];
			pat2_length = qry_mem2[0];
		end
		3: begin
			pat1_length = ref_mem3[0];
			pat2_length = qry_mem3[0];
		end
		4: begin
			pat1_length = ref_mem4[0];
			pat2_length = qry_mem4[0];
		end
		5: begin
			pat1_length = ref_mem5[0];
			pat2_length = qry_mem5[0];
		end
		6: begin
			pat1_length = ref_mem6[0];
			pat2_length = qry_mem6[0];
		end
		7: begin
			pat1_length = ref_mem7[0];
			pat2_length = qry_mem7[0];
		end
		8: begin
			pat1_length = ref_mem8[0];
			pat2_length = qry_mem8[0];
		end
		default: begin
			pat1_length = ref_mem3[0];
			pat2_length = qry_mem3[0];
		end
		endcase
		max_length  = (pat1_length > pat2_length) ? pat1_length : pat2_length;
		//#(`CYCLE*3);

		

		// $display("@%0t ns",$time/100);
		// $display("Inputting Pattern %d: %h", in_index, data_i);
		while (cur_input_idx <= max_length + 1) begin
			@(posedge clk);
			#(0.3*`CYCLE);
			
			
			CHNL_RX_DATA_VALID = (k < 10 & $signed(k) > -10);
			if (cur_input_idx >= 2) begin
				CHNL_RX_DATA = {1'b0,seq1,1'b0,seq2};
				if (cur_input_idx == max_length + 1) begin
					CHNL_RX_DATA = {1'b0,5'b11111,1'b0,5'b11111};
				end
			end
			else if (cur_input_idx >= 1) begin
					CHNL_RX_DATA = {1'b0,pat1_length[8:0],1'b0,pat2_length[8:0],1'b0,seq1,1'b0,seq2};
				end
			else begin
				CHNL_RX_DATA = SPEC;
			end
			if (CHNL_RX_DATA_REN) begin
				cur_input_idx = (CHNL_RX_DATA_VALID)? cur_input_idx + 1: cur_input_idx;
			end
			if (~CHNL_RX_DATA_VALID) CHNL_RX_DATA = 0;
		end
		idx_test = idx_test + 1;
		cur_input_idx = 1;
		$display("data %d done.",idx_test);

    end
	@(posedge clk);
	#(0.3*`CYCLE);
	CHNL_RX_DATA_VALID = 0;
	CHNL_RX_DATA = 0;
	CHNL_RX = 0;
end
initial begin
	iters = 0;
	k = 0;
end
always @(posedge clk) begin
	iters = iters + 1;
	k = $random($stime) % 20;
end


initial begin
	cur_output_idx = 0;
	CHNL_TX_ACK = 0;
	CHNL_TX_DATA_REN = 0;
	wait(CHNL_TX);
	#(1.5*`CYCLE);
	@(posedge clk);
	CHNL_TX_ACK = 1;
	#(`CYCLE);
	CHNL_TX_ACK = 0;
	while (cur_output_idx < (CHNL_TX_LEN >> 2)) begin
		@(posedge clk);
		#(0.3*`CYCLE);
		CHNL_TX_DATA_REN = 1;
		if (CHNL_TX_DATA_VALID & CHNL_TX_DATA_REN) begin
			$display("recv: %b", CHNL_TX_DATA[15:0]);
			if (cur_output_idx <= `TEST_CASE_NUM) begin
				$display("golden: %b", golden);
				if (CHNL_TX_DATA[15:0] != golden) begin
					$display("Wrong: %d ----------------------------X", cur_output_idx - 1);
				end else begin
					$display("Right: %d ----------------------------O", cur_output_idx - 1);
				end
				$display("_________________________________________________________");
			end
			
			cur_output_idx = cur_output_idx + 1;
			
		end
	end
	@(posedge clk);
	#(0.3*`CYCLE);
	CHNL_TX_DATA_REN = 0;
			
	#(`CYCLE*2); 
	$display("--------------------------- Simulation Stops !!---------------------------");
	$display("============================================================================");
	$display("\n");
	$display("        ****************************              ");
	$display("        **                        **        /|__/|");
	$display("        **  Congratulations !!    **      / O,O  |");
	$display("        **                        **    /_____   |");
	$display("        **  Simulation Complete!! **   /^ ^ ^ \\  |");
	$display("        **                        **  |^ ^ ^ ^ |w|");
	$display("        *************** ************   \\m___m__|_|");
	$display("\n");
	$display("============================================================================");
	$finish;
end
	
  

  // end of simulation
  initial begin
    #(`CYCLE*`END_CYCLE) // calculate clock cycles for all operation (you can modify it)
		$display("============================================================================");
		$display("\n           Error!!! There is something wrong with your code ...!          ");
		$display("\n                       The test result is .....FAIL                     \n");
		$display("============================================================================");
	 	$finish;
  end
endmodule