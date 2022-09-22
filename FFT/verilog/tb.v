`timescale 1 ns/10 ps

`define CYCLE 10
`define END_CYCLE 1000

// define different test case
`ifdef point8
  `define PAT_PATH "./dat/dat8.txt"
  `define GOLD_REAL_PATH "./dat/gold8_real.txt"
  `define GOLD_IMAG_PATH "./dat/gold8_imag.txt"
  `define MODE 1
  `define FFT_POINT 8
`endif // point8
`ifdef point4
  `define PAT_PATH "./dat/dat4.txt"
  `define GOLD_REAL_PATH "./dat/gold4_real.txt"
  `define GOLD_IMAG_PATH "./dat/gold4_imag.txt"
  `define MODE 0
  `define FFT_POINT 4
`endif // point4

module tb;
  initial begin
    `ifdef SDF
      $sdf_annotate("FFT_syn.sdf", fft_proc);
    `endif // SDF
  end
  parameter DECIMAL_WIDTH = 8;
  parameter WHOLE_WIDTH = 5;
  parameter DATA_WIDTH = DECIMAL_WIDTH+WHOLE_WIDTH;

  reg clk;
  reg rst_n;
  reg [DATA_WIDTH-1:0] pats_mem [0:`FFT_POINT-1];
  reg [DATA_WIDTH+2:0] gold_real_mem [0:`FFT_POINT-1];
  reg [DATA_WIDTH+2:0] gold_imag_mem [0:`FFT_POINT-1];
  reg [5:0] out_counter_r, out_counter_w;
  reg [5:0] err_counter_r, err_counter_w;

  // fft_proc in/out
  reg mode_en;
  reg [2:0] mode;
  reg valid_in;
  reg [DATA_WIDTH-1:0] data_in_real, data_in_imag;
  wire valid_out;
  wire [DATA_WIDTH+2:0] data_out_real, data_out_imag;
  integer i;

  FFT_PROC fft_proc(
    .clk(clk),
    .rst_n(rst_n),
    .mode_en(mode_en),
    .mode(mode),
    .valid_in(valid_in),
    .data_in_real(data_in_real),
    .data_in_imag(data_in_imag),
    .valid_out(valid_out),
    .data_out_real(data_out_real),
    .data_out_imag(data_out_imag)
  );

  // clk & rst_n 
  initial clk = 1'b0;
  always begin #(`CYCLE*0.5) clk = ~clk; end

  initial begin
    #0 rst_n = 1'b1;
    #`CYCLE rst_n = 1'b0;
    #(`CYCLE*2) rst_n = 1'b1;
  end

  // waveform dump
  // read pattern & golden
  initial begin
    // waveform dump
    $fsdbDumpfile("tb.fsdb");			
		$fsdbDumpvars(0,tb,"+mda");
		$fsdbDumpvars;
    $readmemh(`PAT_PATH, pats_mem);
    $readmemh(`GOLD_REAL_PATH, gold_real_mem);
    $readmemh(`GOLD_IMAG_PATH, gold_imag_mem);
  end


  // data input
  initial begin
    out_counter_w = 0;
    err_counter_w = 0;
    valid_in = 0;
    mode_en = 0;
		$display("-----------------------------------------------------\n");
	 	$display("START!!! Simulation Start .....\n");
	 	$display("-----------------------------------------------------\n");

    #(`CYCLE*10);
    mode_en = 1;
    mode = `MODE;
    #`CYCLE
    mode_en = 0;

    for (i = 0; i < `FFT_POINT; i=i+1) begin
      @(negedge clk) begin
        valid_in = 1;
        data_in_real = pats_mem[i] << DECIMAL_WIDTH;
        data_in_imag = 0;
      end
    end

    @(negedge clk) valid_in = 0;
    data_in_real = 0;
    data_in_imag = 0;
	end

  // check output
  always@ (negedge clk) begin
    out_counter_w = out_counter_r;
    err_counter_w = err_counter_r;
    if (valid_out) begin
      out_counter_w = out_counter_r+1;
      if (gold_real_mem[out_counter_r] !== data_out_real) begin
        $display("Error! %d real output should be %b, your answer %b", out_counter_r, gold_real_mem[out_counter_r], data_out_real);
        err_counter_w = err_counter_r+1;
      end
      if (gold_imag_mem[out_counter_r] !== data_out_imag) begin
        $display("Error! %d imag output should be %b, your answer %b", out_counter_r, gold_imag_mem[out_counter_r], data_out_imag);
        err_counter_w = err_counter_r+1;
      end
    end
  end


  // end of simulation
  initial begin
    #(`CYCLE*`END_CYCLE) // calculate clock cycles for all operation (you can modify it)
		$display("============================================================================");
		$display("\n           Error!!! There is something wrong with your code ...!          ");
		$display("\n                       The test result is .....FAIL                     \n");
		$display("============================================================================");
		// if (testbed.curstate == 2'b0)
		// 	$display("Possible solution: The first answer may not be correct.\n");
		// if (testbed.curstate == 2'b1)
		// 	$display("Possible solution: The clock cycles may be too small. Please modify it.\n");
	 	$finish;
  end
  always @(*) begin
    if (out_counter_r == `FFT_POINT) begin
      if (err_counter_r == 0) begin
        $display("=======================The test result is ..... PASS=========================");
        $display("\n");
        $display("        *************************************************              ");
        $display("        **                                             **      /|__/|");
        $display("        **             Congratulations !!              **     / O,O  \\");
        $display("        **                                             **    /_____   \\");
        $display("        **  All data have been generated successfully! **   /^ ^ ^ \\  |");
        $display("        **                                             **  |^ ^ ^ ^ |w|");
        $display("        *************************************************   \\m___m__|_|");
        $display("\n");
        $display("============================================================================");
        $finish;
      end
      else begin
        $display("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n");
        $display("---------- The test result is ..... FAIL -------------------\n");
        $display("            %d errors was found QQ.\n", err_counter_r);
        $display("---------------- End of this test --------------------------\n");
        $display("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n");
        $finish;
      end
    end
  end

  always@ (posedge clk) begin
    out_counter_r <= out_counter_w;
    err_counter_r <= err_counter_w;
  end
endmodule