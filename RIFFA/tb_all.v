`timescale 1 ns/10 ps

`define CYCLE 7.7
`define END_CYCLE 100000



// define different test case
`define TEST_CASE_NUM 20
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
`define REF9_PATH "./data/test9/ref.txt"
`define QRY9_PATH "./data/test9/qry.txt"
`define GOLDEN9_PATH "./data/test9/golden.txt"
`define REF10_PATH "./data/test10/ref.txt"
`define QRY10_PATH "./data/test10/qry.txt"
`define GOLDEN10_PATH "./data/test10/golden.txt"
`define REF11_PATH "./data/test11/ref.txt"
`define QRY11_PATH "./data/test11/qry.txt"
`define GOLDEN11_PATH "./data/test11/golden.txt"
`define REF12_PATH "./data/test12/ref.txt"
`define QRY12_PATH "./data/test12/qry.txt"
`define GOLDEN12_PATH "./data/test12/golden.txt"
`define REF13_PATH "./data/test13/ref.txt"
`define QRY13_PATH "./data/test13/qry.txt"
`define GOLDEN13_PATH "./data/test13/golden.txt"
`define REF14_PATH "./data/test14/ref.txt"
`define QRY14_PATH "./data/test14/qry.txt"
`define GOLDEN14_PATH "./data/test14/golden.txt"
`define REF15_PATH "./data/test15/ref.txt"
`define QRY15_PATH "./data/test15/qry.txt"
`define GOLDEN15_PATH "./data/test15/golden.txt"
`define REF16_PATH "./data/test16/ref.txt"
`define QRY16_PATH "./data/test16/qry.txt"
`define GOLDEN16_PATH "./data/test16/golden.txt"
`define REF17_PATH "./data/test17/ref.txt"
`define QRY17_PATH "./data/test17/qry.txt"
`define GOLDEN17_PATH "./data/test17/golden.txt"
`define REF18_PATH "./data/test18/ref.txt"
`define QRY18_PATH "./data/test18/qry.txt"
`define GOLDEN18_PATH "./data/test18/golden.txt"
`define REF19_PATH "./data/test19/ref.txt"
`define QRY19_PATH "./data/test19/qry.txt"
`define GOLDEN19_PATH "./data/test19/golden.txt"



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

  integer i;

  reg clk;
  reg rst;
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
  reg signed [LENGTH_WIDTH-1:0]    ref_mem9    [0:MAX_LENGTH];
  reg signed [LENGTH_WIDTH-1:0]    qry_mem9    [0:MAX_LENGTH];
  reg [SIMILARITY_SCORE_WIDTH-1:0] golden_mem9 [0:1];
  reg signed [LENGTH_WIDTH-1:0]    ref_mem10    [0:MAX_LENGTH];
  reg signed [LENGTH_WIDTH-1:0]    qry_mem10    [0:MAX_LENGTH];
  reg [SIMILARITY_SCORE_WIDTH-1:0] golden_mem10 [0:1];
  reg signed [LENGTH_WIDTH-1:0]    ref_mem11    [0:MAX_LENGTH];
  reg signed [LENGTH_WIDTH-1:0]    qry_mem11    [0:MAX_LENGTH];
  reg [SIMILARITY_SCORE_WIDTH-1:0] golden_mem11 [0:1];
  reg signed [LENGTH_WIDTH-1:0]    ref_mem12    [0:MAX_LENGTH];
  reg signed [LENGTH_WIDTH-1:0]    qry_mem12    [0:MAX_LENGTH];
  reg [SIMILARITY_SCORE_WIDTH-1:0] golden_mem12 [0:1];
  reg signed [LENGTH_WIDTH-1:0]    ref_mem13    [0:MAX_LENGTH];
  reg signed [LENGTH_WIDTH-1:0]    qry_mem13    [0:MAX_LENGTH];
  reg [SIMILARITY_SCORE_WIDTH-1:0] golden_mem13 [0:1];
  reg signed [LENGTH_WIDTH-1:0]    ref_mem14    [0:MAX_LENGTH];
  reg signed [LENGTH_WIDTH-1:0]    qry_mem14    [0:MAX_LENGTH];
  reg [SIMILARITY_SCORE_WIDTH-1:0] golden_mem14 [0:1];
  reg signed [LENGTH_WIDTH-1:0]    ref_mem15    [0:MAX_LENGTH];
  reg signed [LENGTH_WIDTH-1:0]    qry_mem15    [0:MAX_LENGTH];
  reg [SIMILARITY_SCORE_WIDTH-1:0] golden_mem15 [0:1];
  reg signed [LENGTH_WIDTH-1:0]    ref_mem16    [0:MAX_LENGTH];
  reg signed [LENGTH_WIDTH-1:0]    qry_mem16    [0:MAX_LENGTH];
  reg [SIMILARITY_SCORE_WIDTH-1:0] golden_mem16 [0:1];
  reg signed [LENGTH_WIDTH-1:0]    ref_mem17    [0:MAX_LENGTH];
  reg signed [LENGTH_WIDTH-1:0]    qry_mem17    [0:MAX_LENGTH];
  reg [SIMILARITY_SCORE_WIDTH-1:0] golden_mem17 [0:1];
  reg signed [LENGTH_WIDTH-1:0]    ref_mem18    [0:MAX_LENGTH];
  reg signed [LENGTH_WIDTH-1:0]    qry_mem18    [0:MAX_LENGTH];
  reg [SIMILARITY_SCORE_WIDTH-1:0] golden_mem18 [0:1];
  reg signed [LENGTH_WIDTH-1:0]    ref_mem19    [0:MAX_LENGTH];
  reg signed [LENGTH_WIDTH-1:0]    qry_mem19    [0:MAX_LENGTH];
  reg [SIMILARITY_SCORE_WIDTH-1:0] golden_mem19 [0:1];


  reg [31:0] operation_clk_counter_r, operation_clk_counter_w;
  reg [31:0] fft_clk_counter_r,       fft_clk_counter_w;
  reg [31:0] ifft_clk_counter_r,      ifft_clk_counter_w;
  reg [31:0] reduction_clk_counter_r, reduction_clk_counter_w;
  reg [31:0] aligner_clk_counter_r,   aligner_clk_counter_w;
  reg [9:0]  out_counter_r,           out_counter_w;
  reg [9:0]  test_counter_r,          test_counter_w;



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

  // `ifdef SDF
  //   MSA_Accelerator MSA_0(
  //     .clk                 (clk),
  //     .rst                 (rst),
  //     .length_valid_i      (length_valid_in),
  //     .ref_length_i        (seq1_length),
  //     .qry_length_i        (seq2_length),
  //     .ref_valid_i         (seq1_valid_in),
  //     .qry_valid_i         (seq2_valid_in),
  //     .ref_amino_acid_i    (seq1),
  //     .qry_amino_acid_i    (seq2),
  //     .window_size_valid_i (window_size_valid_in),
  //     .window_size_i       (window_size_in),
  //     .threshold_valid_i   (threshold_valid_in),
  //     .threshold_i         (threshold_in),
  //     .valid_o             (valid_out),
  //     .similarity_score_o  (similarity_score),
  //     .ready_o             (ready)
  //   );
  // `endif
  // `ifndef SDF
  //   MSA_Accelerator MSA_0(
  //     .clk                 (clk),
  //     .rst               (rst),
  //     .length_valid_i      (length_valid_in),
  //     .ref_length_i        (seq1_length),
  //     .qry_length_i        (seq2_length),
  //     .ref_valid_i         (seq1_valid_in),
  //     .qry_valid_i         (seq2_valid_in),
  //     .ref_amino_acid_i    (seq1),
  //     .qry_amino_acid_i    (seq2),
  //     .window_size_valid_i (window_size_valid_in),
  //     .window_size_i       (window_size_in),
  //     .threshold_valid_i   (threshold_valid_in),
  //     .threshold_i         (threshold_in),
  //     .valid_o             (valid_out),
  //     .similarity_score_o  (similarity_score),
  //     .ready_o             (ready)
  //   );
    // MSA_Accelerator #(
    //   .MAX_SEQUENCE_LENGTH(MAX_LENGTH),
    //   .AMINO_ACID_WIDTH(AMINO_ACID_WIDTH),
    //   .LENGTH_WIDTH(LENGTH_WIDTH),
    //   .NUM_OF_SET(NUM_OF_SET),
    //   .SIMILARITY_SCORE_WIDTH(SIMILARITY_SCORE_WIDTH),
    //   .WINDOW_SIZE_WIDTH(WINDOW_SIZE_WIDTH),
    //   .THRESHOLD_WIDTH(THRESHOLD_WIDTH)
    // ) MSA_0 (
    //   .clk                 (clk),
    //   .rst               (rst),
    //   .length_valid_i      (length_valid_in),
    //   .ref_length_i        (seq1_length),
    //   .qry_length_i        (seq2_length),
    //   .ref_valid_i         (seq1_valid_in),
    //   .qry_valid_i         (seq2_valid_in),
    //   .ref_amino_acid_i    (seq1),
    //   .qry_amino_acid_i    (seq2),
    //   .window_size_valid_i (window_size_valid_in),
    //   .window_size_i       (window_size_in),
    //   .threshold_valid_i   (threshold_valid_in),
    //   .threshold_i         (threshold_in),
    //   .valid_o             (valid_out),
    //   .similarity_score_o  (similarity_score),
    //   .ready_o             (ready)
    // );
  // `endif

  `ifdef SDF
    initial $sdf_annotate("./MSA_accelerator_syn.sdf", MSA_0);
  `endif // SDF

  // clk & rst 
  initial clk = 1'b0;
  always begin #(`CYCLE*0.5) clk = ~clk; end

  initial begin
    #0 rst = 1'b0;
    #`CYCLE rst = 1'b1;
    #(`CYCLE*2) rst = 1'b0;
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
      $fsdbDumpfile("tb.fsdb");
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
    $readmemb(`REF9_PATH,    ref_mem9);
    $readmemb(`QRY9_PATH,    qry_mem9);
    $readmemb(`GOLDEN9_PATH, golden_mem9);
    $readmemb(`REF10_PATH,    ref_mem10);
    $readmemb(`QRY10_PATH,    qry_mem10);
    $readmemb(`GOLDEN10_PATH, golden_mem10);
    $readmemb(`REF11_PATH,    ref_mem11);
    $readmemb(`QRY11_PATH,    qry_mem11);
    $readmemb(`GOLDEN11_PATH, golden_mem11);
    $readmemb(`REF12_PATH,    ref_mem12);
    $readmemb(`QRY12_PATH,    qry_mem12);
    $readmemb(`GOLDEN12_PATH, golden_mem12);
    $readmemb(`REF13_PATH,    ref_mem13);
    $readmemb(`QRY13_PATH,    qry_mem13);
    $readmemb(`GOLDEN13_PATH, golden_mem13);
    $readmemb(`REF14_PATH,    ref_mem14);
    $readmemb(`QRY14_PATH,    qry_mem14);
    $readmemb(`GOLDEN14_PATH, golden_mem14);
    $readmemb(`REF15_PATH,    ref_mem15);
    $readmemb(`QRY15_PATH,    qry_mem15);
    $readmemb(`GOLDEN15_PATH, golden_mem15);
    $readmemb(`REF16_PATH,    ref_mem16);
    $readmemb(`QRY16_PATH,    qry_mem16);
    $readmemb(`GOLDEN16_PATH, golden_mem16);
    $readmemb(`REF17_PATH,    ref_mem17);
    $readmemb(`QRY17_PATH,    qry_mem17);
    $readmemb(`GOLDEN17_PATH, golden_mem17);
    $readmemb(`REF18_PATH,    ref_mem18);
    $readmemb(`QRY18_PATH,    qry_mem18);
    $readmemb(`GOLDEN18_PATH, golden_mem18);
    $readmemb(`REF19_PATH,    ref_mem19);
    $readmemb(`QRY19_PATH,    qry_mem19);
    $readmemb(`GOLDEN19_PATH, golden_mem19);


    

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

  always @(posedge ready) begin
    #(0.01);
    if (test_counter_r <= `TEST_CASE_NUM) begin // case num + 1
      case(test_counter_r)
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
        9: begin
          pat1_length = ref_mem9[0];
          pat2_length = qry_mem9[0];
        end
        10: begin
          pat1_length = ref_mem10[0];
          pat2_length = qry_mem10[0];
        end
        11: begin
          pat1_length = ref_mem11[0];
          pat2_length = qry_mem11[0];
        end
        12: begin
          pat1_length = ref_mem12[0];
          pat2_length = qry_mem12[0];
        end
        13: begin
          pat1_length = ref_mem13[0];
          pat2_length = qry_mem13[0];
        end
        14: begin
          pat1_length = ref_mem14[0];
          pat2_length = qry_mem14[0];
        end
        15: begin
          pat1_length = ref_mem15[0];
          pat2_length = qry_mem15[0];
        end
        16: begin
          pat1_length = ref_mem16[0];
          pat2_length = qry_mem16[0];
        end
        17: begin
          pat1_length = ref_mem17[0];
          pat2_length = qry_mem17[0];
        end
        18: begin
          pat1_length = ref_mem18[0];
          pat2_length = qry_mem18[0];
        end
        19: begin
          pat1_length = ref_mem19[0];
          pat2_length = qry_mem19[0];
        end
        default: begin
          pat1_length = ref_mem3[0];
          pat2_length = qry_mem3[0];
        end
      endcase
      max_length  = (pat1_length > pat2_length) ? pat1_length : pat2_length;
      #(`CYCLE*20);
      length_valid_in = 1;
      seq1_length = pat1_length;
      seq2_length = pat2_length;
      #(`CYCLE*1);
      length_valid_in = 0;

      //#(`CYCLE*3);

      for (i = 1; i <= max_length; i=i+1) begin
        @(posedge clk) begin
          if (i <= pat1_length) begin
            case (test_counter_r)
              0: seq1 = ref_mem0[i];
              1: seq1 = ref_mem1[i];
              2: seq1 = ref_mem2[i];
              3: seq1 = ref_mem3[i];
              4: seq1 = ref_mem4[i];
              5: seq1 = ref_mem5[i];
              6: seq1 = ref_mem6[i];
              7: seq1 = ref_mem7[i];
              8: seq1 = ref_mem8[i];
              9: seq1 = ref_mem9[i];
              10: seq1 = ref_mem10[i];
              11: seq1 = ref_mem11[i];
              12: seq1 = ref_mem12[i];
              13: seq1 = ref_mem13[i];
              14: seq1 = ref_mem14[i];
              15: seq1 = ref_mem15[i];
              16: seq1 = ref_mem16[i];
              17: seq1 = ref_mem17[i];
              18: seq1 = ref_mem18[i];
              19: seq1 = ref_mem19[i];
              default: seq1 = ref_mem3[i];
            endcase
            
            seq1_valid_in = 1;
          end
          else begin
            seq1 = 0;
            seq1_valid_in = 0;
          end

          if (i <= pat2_length) begin
            case (test_counter_r)
              0: seq2 = qry_mem0[i];
              1: seq2 = qry_mem1[i];
              2: seq2 = qry_mem2[i];
              3: seq2 = qry_mem3[i];
              4: seq2 = qry_mem4[i];
              5: seq2 = qry_mem5[i];
              6: seq2 = qry_mem6[i];
              7: seq2 = qry_mem7[i];
              8: seq2 = qry_mem8[i];
              9: seq2 = qry_mem9[i];
              10: seq2 = qry_mem10[i];
              11: seq2 = qry_mem11[i];
              12: seq2 = qry_mem12[i];
              13: seq2 = qry_mem13[i];
              14: seq2 = qry_mem14[i];
              15: seq2 = qry_mem15[i];
              16: seq2 = qry_mem16[i];
              17: seq2 = qry_mem17[i];
              18: seq2 = qry_mem18[i];
              19: seq2 = qry_mem19[i];
              default: seq2 = qry_mem3[i];
            endcase
            seq2_valid_in = 1;
          end
          else begin
            seq2 = 0;
            seq2_valid_in = 0;
          end
        end
      end
      /////////////test
      /*
      #(`CYCLE*1);
      seq1 = 31;
      seq2 = 31;
      seq1_valid_in = 1;
      seq2_valid_in = 1;
      */
      ////////////
      #(`CYCLE*1);
      seq1 = 0;
      seq2 = 0;
      seq1_valid_in = 0;
      seq2_valid_in = 0;
      test_counter_w = test_counter_r+1;
    end
  end
  always @(posedge clk) begin
    test_counter_r <= test_counter_w;
  end
  
  `ifndef SDF
    always @(*) begin
      // if (length_valid_in) operation_clk_counter_w = 0;
      // else operation_clk_counter_w = operation_clk_counter_r+1;
/*
      fft_clk_counter_w       = fft_clk_counter_r;
      ifft_clk_counter_w      = ifft_clk_counter_r;
      reduction_clk_counter_w = reduction_clk_counter_r;
      aligner_clk_counter_w   = aligner_clk_counter_r;

      if (MSA_0.stage1_state_r == MSA_0.FFT_IDLE_S) begin
        fft_clk_counter_w = 0;
      end
      else begin
        fft_clk_counter_w = fft_clk_counter_r+1;
        if (MSA_0.stage1_finish) $display("fft counter: %d: ", fft_clk_counter_r);
      end

      if (MSA_0.stage2_state_r == MSA_0.IFFT_IDLE_S) begin
        ifft_clk_counter_w = 0;
      end
      else begin
        ifft_clk_counter_w = ifft_clk_counter_r+1;
        if (MSA_0.stage2_finish) $display("ifft counter: %d: ", ifft_clk_counter_r);
      end

      if (MSA_0.stage3_state_r == MSA_0.REDUCTION_IDLE_S) begin
        reduction_clk_counter_w = 0;
      end
      else begin
        reduction_clk_counter_w = reduction_clk_counter_r+1;
        if (MSA_0.stage3_finish) $display("reduction counter: %d: ", reduction_clk_counter_r);
      end

      if (MSA_0.stage4_state_r == MSA_0.ALIGNER_IDLE_S) begin
        aligner_clk_counter_w = 0;
      end
      else begin
        aligner_clk_counter_w = aligner_clk_counter_r+1;
        if (MSA_0.stage4_finish) $display("aligner counter: %d: ", aligner_clk_counter_r);
      end
      */
    end
    always @(posedge clk or posedge rst) begin
      if (rst) begin 
        operation_clk_counter_r <= 0;
        fft_clk_counter_r       <= 0;
        ifft_clk_counter_r      <= 0;
        reduction_clk_counter_r <= 0;
        aligner_clk_counter_r   <= 0;
      end
      else begin
        operation_clk_counter_r <= operation_clk_counter_w;
        fft_clk_counter_r       <= fft_clk_counter_w;
        ifft_clk_counter_r      <= ifft_clk_counter_w;
        reduction_clk_counter_r <= reduction_clk_counter_w;
        aligner_clk_counter_r   <= aligner_clk_counter_w;
      end
    end
  `endif

  // check output
  reg signed [SIMILARITY_SCORE_WIDTH-1:0] golden;
  always@ (negedge clk) begin
    case (out_counter_r)
      0: golden = golden_mem0[0];
      1: golden = golden_mem1[0];
      2: golden = golden_mem2[0];
      3: golden = golden_mem3[0];
      4: golden = golden_mem4[0];
      5: golden = golden_mem5[0];
      6: golden = golden_mem6[0];
      7: golden = golden_mem7[0];
      8: golden = golden_mem8[0];
      9: golden = golden_mem9[0];
      10: golden = golden_mem10[0];
      11: golden = golden_mem11[0];
      12: golden = golden_mem12[0];
      13: golden = golden_mem13[0];
      14: golden = golden_mem14[0];
      15: golden = golden_mem15[0];
      16: golden = golden_mem16[0];
      17: golden = golden_mem17[0];
      18: golden = golden_mem18[0];
      19: golden = golden_mem19[0];
      default: golden = golden_mem3[0];
    endcase
    if (valid_out) begin
      $display("Output %d: Golden: %d", similarity_score, golden);
      $display("Test case %d ------- ref length:  %d,qry length:  %d",out_counter_r, pat1_length, pat2_length);
      if (similarity_score == golden) begin
        $display("=======================PASS=========================");
        /*
        $display("\n");
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
        */
        // $finish;
      end
      else begin
        //$display("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n");
        $display("-----------------------FAIL -------------------");
        //$display("---------------- End of this test --------------------------\n");
        //$display("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n");
        //$finish;
      end
      if (out_counter_r == `TEST_CASE_NUM-1) $finish;
      out_counter_w = out_counter_r+1;
    end
  end
  always @(posedge clk) begin
    out_counter_r <= out_counter_w;
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