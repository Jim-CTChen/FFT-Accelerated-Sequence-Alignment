// 8 point FFT module
// DIF, radix-2
module FFT_PROC #(
  parameter WHOLE_WIDTH=5,
  parameter DECIMAL_WIDTH=8,
  parameter DATA_WIDTH=WHOLE_WIDTH+DECIMAL_WIDTH
) (
  input clk,
  input rst_n,
  input valid_in,
  input [DATA_WIDTH-1:0] data_in_real,
  input [DATA_WIDTH-1:0] data_in_imag,
  input [2:0] mode,
  input mode_en,
  output ready,
  output valid_out,
  output [DATA_WIDTH+2:0] data_out_real,
  output [DATA_WIDTH+2:0] data_out_imag
);
  parameter MAX_FFT_POINT = 8;
  // state
  parameter IDLE_S = 0;
  parameter INPUT_S = 1;
  parameter CALC_S = 2;
  parameter END_S = 3;
  // FFT point (mode)
  parameter POINT_4 = 0;
  parameter POINT_8 = 1;
  parameter POINT_16 = 2;
  parameter POINT_32 = 3;
  integer i;

  reg  valid_in_r, valid_in_w;
  reg  signed [DATA_WIDTH-1:0] data_in_real_r, data_in_real_w;
  reg  signed [DATA_WIDTH-1:0] data_in_imag_r, data_in_imag_w;
  reg  signed [DATA_WIDTH-1:0] s_1_in_real;
  reg  signed [DATA_WIDTH-1:0] s_1_in_imag;
  wire signed [DATA_WIDTH  :0] s_1_out_real;
  wire signed [DATA_WIDTH  :0] s_1_out_imag;
  wire signed [DATA_WIDTH+1:0] s_2_out_real;
  wire signed [DATA_WIDTH+1:0] s_2_out_imag;
  wire signed [DATA_WIDTH+2:0] s_3_out_real;
  wire signed [DATA_WIDTH+2:0] s_3_out_imag;
  reg  s_1_valid_in;
  wire s_1_valid_out;
  wire s_2_valid_out;
  wire s_3_valid_out;

  reg valid_out_r, valid_out_w;
  reg signed [DATA_WIDTH+2:0] data_out_real_r, data_out_real_w;
  reg signed [DATA_WIDTH+2:0] data_out_imag_r, data_out_imag_w;

  reg [2:0] state_r, state_w;
  reg [5:0] counter_r, counter_w;
  reg [9:0] fft_point;
  reg [2:0] mode_r, mode_w;
  reg signed [DATA_WIDTH+2:0] output_buf_real_r [MAX_FFT_POINT-1:0], output_buf_real_w [MAX_FFT_POINT-1:0];
  reg signed [DATA_WIDTH+2:0] output_buf_imag_r [MAX_FFT_POINT-1:0], output_buf_imag_w [MAX_FFT_POINT-1:0];

  assign valid_out = valid_out_r;
  assign data_out_real = data_out_real_r;
  assign data_out_imag = data_out_imag_r;
  assign ready = (state_r == IDLE_S);

  FFT_8 #(.DATA_WIDTH(DATA_WIDTH+1)) fft8 (
    .clk(clk),
    .rst_n(rst_n),
    .valid_in(s_1_valid_in),
    .data_in_real({s_1_in_real[DATA_WIDTH-1], s_1_in_real}),
    .data_in_imag({s_1_in_imag[DATA_WIDTH-1], s_1_in_imag}),
    .valid_out(s_1_valid_out),
    .data_out_real(s_1_out_real),
    .data_out_imag(s_1_out_imag)
  );

  FFT_4 #(.DATA_WIDTH(DATA_WIDTH+2)) fft4 (
    .clk(clk),
    .rst_n(rst_n),
    .valid_in(s_1_valid_out),
    .data_in_real({s_1_out_real[DATA_WIDTH], s_1_out_real}),
    .data_in_imag({s_1_out_imag[DATA_WIDTH], s_1_out_imag}),
    .valid_out(s_2_valid_out),
    .data_out_real(s_2_out_real),
    .data_out_imag(s_2_out_imag)
  );

  FFT_2 #(.DATA_WIDTH(DATA_WIDTH+3)) fft2 (
    .clk(clk),
    .rst_n(rst_n),
    .valid_in(s_2_valid_out),
    .data_in_real({s_2_out_real[DATA_WIDTH+1], s_2_out_real}),
    .data_in_imag({s_2_out_imag[DATA_WIDTH+1], s_2_out_imag}),
    .valid_out(s_3_valid_out),
    .data_out_real(s_3_out_real),
    .data_out_imag(s_3_out_imag)
  );

  // input FF
  always @(*) begin
    valid_in_w = valid_in;
    data_in_real_w = data_in_real;
    data_in_imag_w = data_in_imag;
  end

  // mode & fft point
  always @(*) begin
    fft_point = 8;
    mode_w = mode_r;
    if (state_r == IDLE_S) begin
      if (mode_en) mode_w = mode;
    end
    case (mode_r)
      POINT_4: fft_point = 4;
      POINT_8: fft_point = 8;
      POINT_16: fft_point = 16;
    endcase
  end

  // FSM
  always @(*) begin
    state_w = state_r;
    case (state_r)
      IDLE_S: begin
        if (valid_in_r) state_w = INPUT_S;
        else state_w = IDLE_S;
      end
      INPUT_S: begin
        if (counter_r == fft_point-1) state_w = CALC_S;
        else state_w = INPUT_S;
      end
      CALC_S: begin
        if (counter_r == fft_point-1) state_w = END_S;
        else state_w = CALC_S;
      end
      END_S: begin
        if (counter_r == fft_point-1) state_w = IDLE_S;
        else state_w = END_S;
      end
    endcase
  end

  // counter 
  always @(*) begin
    counter_w = counter_r;
    case (state_r)
      IDLE_S: begin
        if (valid_in_r) counter_w = 1;
        else counter_w = 0;
      end
      INPUT_S: begin
        if (counter_r == fft_point-1) counter_w = 0;
        else counter_w = counter_r + 1;
      end
      CALC_S: begin
        if (counter_r == fft_point-1) counter_w = 0;
        else if (s_3_valid_out) counter_w = counter_r + 1;
        else counter_w = counter_r;
      end
      END_S: begin
        if (counter_r == fft_point-1) counter_w = 0;
        else counter_w = counter_r+1;
      end
    endcase
  end

  // stage 1 input
  always @(*) begin
    s_1_valid_in = 0;
    s_1_in_real = 0;
    s_1_in_imag = 0;
    if (state_r == IDLE_S) begin
      if (valid_in_r) begin
        s_1_valid_in = 1;
        s_1_in_real = data_in_real_r;
        s_1_in_imag = data_in_imag_r;
      end
    end
    else if (state_r == INPUT_S) begin
      s_1_valid_in = 1;
      s_1_in_real = data_in_real_r;
      s_1_in_imag = data_in_imag_r;
    end
  end

  // output
  always @(*) begin
    valid_out_w = 0;
    data_out_real_w = 0;
    data_out_imag_w = 0;
    if (state_r == END_S) begin
      valid_out_w = 1;
      data_out_real_w = output_buf_real_r[counter_r];
      data_out_imag_w = output_buf_imag_r[counter_r];
    end
  end

  // rearrange stage 3 output
  always @(*) begin
    for (i = 0; i < MAX_FFT_POINT; i=i+1) begin
      output_buf_real_w[i] = output_buf_real_r[i];
      output_buf_imag_w[i] = output_buf_imag_r[i];
    end
    if (state_r == CALC_S && s_3_valid_out) begin
      case (counter_r)
        0: begin
          output_buf_real_w[0] = s_3_out_real;
          output_buf_imag_w[0] = s_3_out_imag;
        end
        1: begin
          output_buf_real_w[4] = s_3_out_real;
          output_buf_imag_w[4] = s_3_out_imag;
        end
        2: begin
          output_buf_real_w[2] = s_3_out_real;
          output_buf_imag_w[2] = s_3_out_imag;
        end
        3: begin
          output_buf_real_w[6] = s_3_out_real;
          output_buf_imag_w[6] = s_3_out_imag;
        end
        4: begin
          output_buf_real_w[1] = s_3_out_real;
          output_buf_imag_w[1] = s_3_out_imag;
        end
        5: begin
          output_buf_real_w[5] = s_3_out_real;
          output_buf_imag_w[5] = s_3_out_imag;
        end
        6: begin
          output_buf_real_w[3] = s_3_out_real;
          output_buf_imag_w[3] = s_3_out_imag;
        end
        7: begin
          output_buf_real_w[7] = s_3_out_real;
          output_buf_imag_w[7] = s_3_out_imag;
        end
      endcase
    end
  end

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      state_r <= IDLE_S;
      mode_r <= POINT_8;
      counter_r <= 0;
      for (i = 0; i < MAX_FFT_POINT; i=i+1) begin
        output_buf_real_r[i] <= 0;
        output_buf_imag_r[i] <= 0;
      end
      valid_in_r <= 0;
      data_in_real_r <= 0;
      data_in_imag_r <= 0;
      valid_out_r <= valid_out_w;
      data_out_imag_r <= data_out_imag_w;
      data_out_real_r <= data_out_real_w;
    end
    else begin
      state_r <= state_w;
      mode_r <= mode_w;
      counter_r <= counter_w;
      for (i = 0; i < MAX_FFT_POINT; i=i+1) begin
        output_buf_real_r[i] <= output_buf_real_w[i];
        output_buf_imag_r[i] <= output_buf_imag_w[i];
      end
      valid_in_r <= valid_in_w;
      data_in_real_r <= data_in_real_w;
      data_in_imag_r <= data_in_imag_w;
      valid_out_r <= valid_out_w;
      data_out_imag_r <= data_out_imag_w;
      data_out_real_r <= data_out_real_w;
    end
  end
  
endmodule

// FFT 8 point
module FFT_8 #(
  parameter DATA_WIDTH=8 ,
  parameter TWIDDLE_WIDTH=8,
  parameter TWIDDLE_SHIFT=6, // TWIDDLE FACTOR << 6
  parameter TWIDDLE_NUM=4
) (
  input clk,
  input rst_n,
  input valid_in,
  input signed [DATA_WIDTH-1:0] data_in_real,
  input signed [DATA_WIDTH-1:0] data_in_imag,
  output valid_out,
  output signed [DATA_WIDTH-1:0] data_out_real,
  output signed [DATA_WIDTH-1:0] data_out_imag
);
  parameter IDLE_S = 0;
  parameter PHASE_1_S = 1;
  parameter PHASE_2_S = 2;
  parameter END_S = 3;
  parameter TWIDDLE_FACTOR_0_REAL = 8'sb01000000; // 1
  parameter TWIDDLE_FACTOR_0_IMAG = 8'sb00000000; // 0
  parameter TWIDDLE_FACTOR_1_REAL = 8'sb00101101; // 0.707
  parameter TWIDDLE_FACTOR_1_IMAG = 8'sb11010011; // -0.707
  parameter TWIDDLE_FACTOR_2_REAL = 8'sb00000000; // 0
  parameter TWIDDLE_FACTOR_2_IMAG = 8'sb11000000; // -1
  parameter TWIDDLE_FACTOR_3_REAL = 8'sb11010011; // -0.707
  parameter TWIDDLE_FACTOR_3_IMAG = 8'sb11010011; // -0.707
  parameter FIFO_len = 4;
  integer i;

  reg [2:0] state_r, state_w;
  reg [1:0] counter_r, counter_w;
  wire signed [TWIDDLE_WIDTH-1:0] twiddle_factor_real [0:TWIDDLE_NUM-1];
  wire signed [TWIDDLE_WIDTH-1:0] twiddle_factor_imag [0:TWIDDLE_NUM-1];
  reg signed [DATA_WIDTH-1:0] FIFO_real_r [0:FIFO_len-1], FIFO_real_w [0:FIFO_len-1];
  reg signed [DATA_WIDTH-1:0] FIFO_imag_r [0:FIFO_len-1], FIFO_imag_w [0:FIFO_len-1];

  // in/out FF
  reg valid_in_r, valid_in_w;
  reg signed [DATA_WIDTH-1:0] data_in_real_r, data_in_real_w;
  reg signed [DATA_WIDTH-1:0] data_in_imag_r, data_in_imag_w;
  reg valid_out_r, valid_out_w;
  reg signed [DATA_WIDTH-1:0] data_out_real_r, data_out_real_w;
  reg signed [DATA_WIDTH-1:0] data_out_imag_r, data_out_imag_w;

  // calculation usage register
  reg signed [DATA_WIDTH+TWIDDLE_WIDTH-2:0] real_temp1, real_temp2, real_temp3;
  reg signed [DATA_WIDTH+TWIDDLE_WIDTH-2:0] imag_temp1, imag_temp2, imag_temp3;

  assign valid_out = valid_out_r;
  assign data_out_real = data_out_real_r;
  assign data_out_imag = data_out_imag_r;

  task shiftFIFO;
    input [DATA_WIDTH*2-1:0] FIFO_in;
    begin
      FIFO_real_w[0] = FIFO_in[DATA_WIDTH*2-1:DATA_WIDTH];
      FIFO_imag_w[0] = FIFO_in[DATA_WIDTH-1:0];
      for (i = 1; i < 4; i=i+1) begin
        FIFO_real_w[i] = FIFO_real_r[i-1];
        FIFO_imag_w[i] = FIFO_imag_r[i-1];
      end
    end
  endtask

  // constant twiddle factor
  assign twiddle_factor_real[0] = TWIDDLE_FACTOR_0_REAL;
  assign twiddle_factor_imag[0] = TWIDDLE_FACTOR_0_IMAG;
  assign twiddle_factor_real[1] = TWIDDLE_FACTOR_1_REAL;
  assign twiddle_factor_imag[1] = TWIDDLE_FACTOR_1_IMAG;
  assign twiddle_factor_real[2] = TWIDDLE_FACTOR_2_REAL;
  assign twiddle_factor_imag[2] = TWIDDLE_FACTOR_2_IMAG;
  assign twiddle_factor_real[3] = TWIDDLE_FACTOR_3_REAL;
  assign twiddle_factor_imag[3] = TWIDDLE_FACTOR_3_IMAG;

  // FSM
  always @(*) begin
    state_w = state_r;
    case(state_r)
      IDLE_S:    state_w = valid_in ? PHASE_1_S : IDLE_S;
      PHASE_1_S: state_w = (counter_r != 3) ? PHASE_1_S : PHASE_2_S;
      PHASE_2_S: state_w = (counter_r != 3) ? PHASE_2_S : 
                           (valid_in) ? PHASE_1_S : END_S;
      END_S: state_w = (counter_r != 3) ? END_S : IDLE_S;
    endcase
  end

  // counter
  always @(*) begin
    if (state_r == IDLE_S) counter_w = 0;
    else counter_w = counter_r+1;
  end

  // input
  always @(*) begin
    valid_in_w = valid_in;
    data_in_real_w = data_in_real;
    data_in_imag_w = data_in_imag;
  end

  // wire signed [DATA_WIDTH+TWIDDLE_WIDTH-2:0] t1, t2, t3;
  // wire signed [TWIDDLE_WIDTH-1:0] twiddle_real, twiddle_imag;
  // assign twiddle_real = twiddle_factor_real[counter_r];
  // assign t1 = {{(TWIDDLE_WIDTH){FIFO_real_r[FIFO_len-1][DATA_WIDTH-1]}}, FIFO_real_r[FIFO_len-1][DATA_WIDTH-2:0]};
  // assign t2 = {{(DATA_WIDTH-1){twiddle_factor_real[counter_r][TWIDDLE_WIDTH-1]}}, twiddle_factor_real[counter_r][TWIDDLE_WIDTH-2:0]};
  // assign t3 = t1*t2;

  always @(*) begin
    for (i = 0; i < FIFO_len; i=i+1) begin
      FIFO_real_w[i] = FIFO_real_r[i];
      FIFO_imag_w[i] = FIFO_imag_r[i];
    end
    valid_out_w = 0;
    data_out_real_w = 0;
    data_out_imag_w = 0;

    case (state_r)
      PHASE_1_S: begin
        shiftFIFO({data_in_real_r, data_in_imag_r});
        valid_out_w = valid_out_r; // the very first phase 1 output is not valid (no previous data in FIFO)
        // since twiddle factor range [-1~1]
        // simply multiply and shift back the result

        // diff_real*twiddle_real
        real_temp1 = {{(TWIDDLE_WIDTH-1){FIFO_real_r[FIFO_len-1][DATA_WIDTH-1]}}, FIFO_real_r[FIFO_len-1][DATA_WIDTH-2:0]} * 
                     {{(DATA_WIDTH-1){twiddle_factor_real[counter_r][TWIDDLE_WIDTH-1]}}, twiddle_factor_real[counter_r][TWIDDLE_WIDTH-2:0]};
        // diff_imag*twiddle_imag
        real_temp2 = {{(TWIDDLE_WIDTH-1){FIFO_imag_r[FIFO_len-1][DATA_WIDTH-1]}}, FIFO_imag_r[FIFO_len-1][DATA_WIDTH-2:0]} * 
                     {{(DATA_WIDTH-1){twiddle_factor_imag[counter_r][TWIDDLE_WIDTH-1]}}, twiddle_factor_imag[counter_r][TWIDDLE_WIDTH-2:0]};
        // diff_real*twiddle_imag
        imag_temp1 = {{(TWIDDLE_WIDTH-1){FIFO_real_r[FIFO_len-1][DATA_WIDTH-1]}}, FIFO_real_r[FIFO_len-1][DATA_WIDTH-2:0]} * 
                     {{(DATA_WIDTH-1){twiddle_factor_imag[counter_r][TWIDDLE_WIDTH-1]}}, twiddle_factor_imag[counter_r][TWIDDLE_WIDTH-2:0]};
        // diff_imag*twiddle_real
        imag_temp2 = {{(TWIDDLE_WIDTH-1){FIFO_imag_r[FIFO_len-1][DATA_WIDTH-1]}}, FIFO_imag_r[FIFO_len-1][DATA_WIDTH-2:0]} * 
                     {{(DATA_WIDTH-1){twiddle_factor_real[counter_r][TWIDDLE_WIDTH-1]}}, twiddle_factor_real[counter_r][TWIDDLE_WIDTH-2:0]};
        real_temp3 = real_temp1 - real_temp2;
        data_out_real_w = real_temp3 >>> (TWIDDLE_SHIFT);
        imag_temp3 = imag_temp1 + imag_temp2;
        data_out_imag_w = imag_temp3 >>> (TWIDDLE_SHIFT);
      end
      PHASE_2_S: begin
        shiftFIFO({FIFO_real_r[FIFO_len-1]-data_in_real_r, FIFO_imag_r[FIFO_len-1]-data_in_imag_r});
        valid_out_w = 1;
        data_out_real_w = FIFO_real_r[FIFO_len-1]+data_in_real_r;
        data_out_imag_w = FIFO_imag_r[FIFO_len-1]+data_in_imag_r;
      end
      END_S: begin
        shiftFIFO(0);
        valid_out_w = 1;
        real_temp1 = {{(TWIDDLE_WIDTH-1){FIFO_real_r[FIFO_len-1][DATA_WIDTH-1]}}, FIFO_real_r[FIFO_len-1][DATA_WIDTH-2:0]} * 
                     {{(DATA_WIDTH-1){twiddle_factor_real[counter_r][TWIDDLE_WIDTH-1]}}, twiddle_factor_real[counter_r][TWIDDLE_WIDTH-2:0]};
        // diff_imag*twiddle_imag
        real_temp2 = {{(TWIDDLE_WIDTH-1){FIFO_imag_r[FIFO_len-1][DATA_WIDTH-1]}}, FIFO_imag_r[FIFO_len-1][DATA_WIDTH-2:0]} * 
                     {{(DATA_WIDTH-1){twiddle_factor_imag[counter_r][TWIDDLE_WIDTH-1]}}, twiddle_factor_imag[counter_r][TWIDDLE_WIDTH-2:0]};
        // diff_real*twiddle_imag
        imag_temp1 = {{(TWIDDLE_WIDTH-1){FIFO_real_r[FIFO_len-1][DATA_WIDTH-1]}}, FIFO_real_r[FIFO_len-1][DATA_WIDTH-2:0]} * 
                     {{(DATA_WIDTH-1){twiddle_factor_imag[counter_r][TWIDDLE_WIDTH-1]}}, twiddle_factor_imag[counter_r][TWIDDLE_WIDTH-2:0]};
        // diff_imag*twiddle_real
        imag_temp2 = {{(TWIDDLE_WIDTH-1){FIFO_imag_r[FIFO_len-1][DATA_WIDTH-1]}}, FIFO_imag_r[FIFO_len-1][DATA_WIDTH-2:0]} * 
                     {{(DATA_WIDTH-1){twiddle_factor_real[counter_r][TWIDDLE_WIDTH-1]}}, twiddle_factor_real[counter_r][TWIDDLE_WIDTH-2:0]};
        real_temp3 = real_temp1 - real_temp2;
        data_out_real_w = real_temp3 >>> (TWIDDLE_SHIFT);
        imag_temp3 = imag_temp1 + imag_temp2;
        data_out_imag_w = imag_temp3 >>> (TWIDDLE_SHIFT);
      end
    endcase
  end

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      state_r <= IDLE_S;
      for (i = 0; i < FIFO_len; i=i+1) begin
        FIFO_real_r[i] <= 0;
        FIFO_imag_r[i] <= 0;
      end
      // for (i = 0; i < TWIDDLE_NUM; i=i+1) begin
      //   twiddle_factor_real_r[i] <= 0;
      //   twiddle_factor_imag_r[i] <= 0;
      // end
      counter_r <= 0;
      valid_in_r <= 0;
      data_in_real_r <= 0;
      data_in_imag_r <= 0;
      valid_out_r <= 0;
      data_out_real_r <= 0;
      data_out_imag_r <= 0;
    end
    else begin
      state_r <= state_w;
      for (i = 0; i < FIFO_len; i=i+1) begin
        FIFO_real_r[i] <= FIFO_real_w[i];
        FIFO_imag_r[i] <= FIFO_imag_w[i];
      end
      // for (i = 0; i < TWIDDLE_NUM; i=i+1) begin
      //   twiddle_factor_real_r[i] <= twiddle_factor_real_w[i];
      //   twiddle_factor_imag_r[i] <= twiddle_factor_imag_w[i];
      // end
      counter_r <= counter_w;
      valid_in_r <= valid_in_w;
      data_in_real_r <= data_in_real_w;
      data_in_imag_r <= data_in_imag_w;
      valid_out_r <= valid_out_w;
      data_out_real_r <= data_out_real_w;
      data_out_imag_r <= data_out_imag_w;
    end
  end
  
endmodule

// FFT 4 point
module FFT_4 #(
  parameter DATA_WIDTH=8
) (
  input clk,
  input rst_n,
  input valid_in,
  input signed [DATA_WIDTH-1:0] data_in_real,
  input signed [DATA_WIDTH-1:0] data_in_imag,
  output valid_out,
  output signed [DATA_WIDTH-1:0] data_out_real,
  output signed [DATA_WIDTH-1:0] data_out_imag
);
  parameter IDLE_S = 0;
  parameter PHASE_1_S = 1;
  parameter PHASE_2_S = 2;
  parameter END_S = 3;
  parameter TWIDDLE_FACTOR_0_REAL = 1;
  parameter TWIDDLE_FACTOR_0_IMAG = 0;
  parameter TWIDDLE_FACTOR_1_REAL = 0;
  parameter TWIDDLE_FACTOR_1_IMAG = -1;

  reg [2:0] state_r, state_w;
  reg signed [DATA_WIDTH-1:0] FIFO_real_r [0:1], FIFO_real_w [0:1];
  reg signed [DATA_WIDTH-1:0] FIFO_imag_r [0:1], FIFO_imag_w [0:1];
  reg counter_r, counter_w;

  reg valid_in_r, valid_in_w;
  reg signed [DATA_WIDTH-1:0] data_in_real_r, data_in_real_w;
  reg signed [DATA_WIDTH-1:0] data_in_imag_r, data_in_imag_w;
  reg valid_out_r, valid_out_w;
  reg signed [DATA_WIDTH-1:0] data_out_real_r, data_out_real_w;
  reg signed [DATA_WIDTH-1:0] data_out_imag_r, data_out_imag_w;

  assign valid_out = valid_out_r;
  assign data_out_real = data_out_real_r;
  assign data_out_imag = data_out_imag_r;

  task shiftFIFO;
    input [DATA_WIDTH*2-1:0] FIFO_in;
    begin
      FIFO_real_w[0] = FIFO_in[DATA_WIDTH*2-1:DATA_WIDTH];
      FIFO_imag_w[0] = FIFO_in[DATA_WIDTH-1:0];
      FIFO_real_w[1] = FIFO_real_r[0];
      FIFO_imag_w[1] = FIFO_imag_r[0];
    end
  endtask

  always @(*) begin
    state_w = state_r;
    case(state_r)
      IDLE_S:    state_w = valid_in ? PHASE_1_S : IDLE_S;
      PHASE_1_S: state_w = (counter_r != 1) ? PHASE_1_S : PHASE_2_S;
      PHASE_2_S: state_w = (counter_r != 1) ? PHASE_2_S : 
                           (valid_in) ? PHASE_1_S : END_S;
      END_S: state_w = (counter_r != 1) ? END_S : IDLE_S;
    endcase
  end

  // counter
  always @(*) begin
    if (state_r == IDLE_S) counter_w = 0;
    else counter_w = ~counter_r;
  end

  // input FF
  always @(*) begin
    valid_in_w = valid_in;
    data_in_real_w = data_in_real;
    data_in_imag_w = data_in_imag;
  end

  always @(*) begin
    FIFO_real_w[0] = FIFO_real_r[0];
    FIFO_imag_w[0] = FIFO_imag_r[0];
    FIFO_real_w[1] = FIFO_real_r[1];
    FIFO_imag_w[1] = FIFO_imag_r[1];
    valid_out_w = 0;
    data_out_real_w = 0;
    data_out_imag_w = 0;
    case(state_r)
      PHASE_1_S: begin
        shiftFIFO({data_in_real_r, data_in_imag_r});
        valid_out_w = valid_out_r; // if it is the first phase 1, then output is not valid
        if (~counter_r) begin
          data_out_real_w = FIFO_real_r[1]*TWIDDLE_FACTOR_0_REAL - FIFO_imag_r[1]*TWIDDLE_FACTOR_0_IMAG;
          data_out_imag_w = FIFO_real_r[1]*TWIDDLE_FACTOR_0_IMAG + FIFO_imag_r[1]*TWIDDLE_FACTOR_0_REAL;
        end
        else begin
          data_out_real_w = FIFO_real_r[1]*TWIDDLE_FACTOR_1_REAL - FIFO_imag_r[1]*TWIDDLE_FACTOR_1_IMAG;
          data_out_imag_w = FIFO_real_r[1]*TWIDDLE_FACTOR_1_IMAG + FIFO_imag_r[1]*TWIDDLE_FACTOR_1_REAL;
        end
      end
      PHASE_2_S: begin
        shiftFIFO({FIFO_real_r[1]-data_in_real_r, FIFO_imag_r[1]-data_in_imag_r});
        valid_out_w = 1;
        data_out_real_w = FIFO_real_r[1]+data_in_real_r;
        data_out_imag_w = FIFO_imag_r[1]+data_in_imag_r;
      end
      END_S: begin
        shiftFIFO(0);
        valid_out_w = 1;
        if (~counter_r) begin
          data_out_real_w = FIFO_real_r[1]*TWIDDLE_FACTOR_0_REAL - FIFO_imag_r[1]*TWIDDLE_FACTOR_0_IMAG;
          data_out_imag_w = FIFO_real_r[1]*TWIDDLE_FACTOR_0_IMAG + FIFO_imag_r[1]*TWIDDLE_FACTOR_0_REAL;
        end
        else begin
          data_out_real_w = FIFO_real_r[1]*TWIDDLE_FACTOR_1_REAL - FIFO_imag_r[1]*TWIDDLE_FACTOR_1_IMAG;
          data_out_imag_w = FIFO_real_r[1]*TWIDDLE_FACTOR_1_IMAG + FIFO_imag_r[1]*TWIDDLE_FACTOR_1_REAL;
        end
      end
    endcase
  end

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      state_r <= IDLE_S;
      counter_r <= 0;
      FIFO_real_r[0] <= 0;
      FIFO_imag_r[0] <= 0;
      FIFO_real_r[1] <= 0;
      FIFO_imag_r[1] <= 0;
      valid_in_r <= 0;
      data_in_real_r <= 0;
      data_in_imag_r <= 0;
      valid_out_r <= 0;
      data_out_real_r <= 0;
      data_out_imag_r <= 0;
    end
    else begin
      state_r <= state_w;
      counter_r <= counter_w;
      FIFO_real_r[0] <= FIFO_real_w[0];
      FIFO_imag_r[0] <= FIFO_imag_w[0];
      FIFO_real_r[1] <= FIFO_real_w[1];
      FIFO_imag_r[1] <= FIFO_imag_w[1];
      valid_in_r <= valid_in_w;
      data_in_real_r <= data_in_real_w;
      data_in_imag_r <= data_in_imag_w;
      valid_out_r <= valid_out_w;
      data_out_real_r <= data_out_real_w;
      data_out_imag_r <= data_out_imag_w;
    end
  end
  
endmodule

// FFT 2 point
module FFT_2 #(
  parameter DATA_WIDTH=8
) (
  input clk,
  input rst_n,
  input valid_in, // data in enable
  input signed [DATA_WIDTH-1:0] data_in_real,
  input signed [DATA_WIDTH-1:0] data_in_imag,
  output valid_out,
  output signed [DATA_WIDTH-1:0] data_out_real,
  output signed [DATA_WIDTH-1:0] data_out_imag
);
  parameter IDLE_S = 0;
  parameter PHASE_1_S = 1;
  parameter PHASE_2_S = 2;
  parameter END_S = 3;
  parameter TWIDDLE_FACTOR_REAL = 1; // 1
  parameter TWIDDLE_FACTOR_IMAG = 0; // 0

  reg [2:0] state_r, state_w;
  reg signed [DATA_WIDTH-1:0] FIFO_real_r, FIFO_real_w;
  reg signed [DATA_WIDTH-1:0] FIFO_imag_r, FIFO_imag_w;

  reg valid_in_r, valid_in_w;
  reg signed [DATA_WIDTH-1:0] data_in_real_r, data_in_real_w;
  reg signed [DATA_WIDTH-1:0] data_in_imag_r, data_in_imag_w;
  reg valid_out_r, valid_out_w;
  reg signed [DATA_WIDTH-1:0] data_out_real_r, data_out_real_w;
  reg signed [DATA_WIDTH-1:0] data_out_imag_r, data_out_imag_w;

  assign data_out_real = data_out_real_r;
  assign data_out_imag = data_out_imag_r;
  assign valid_out = valid_out_r;

  // FSM
  always @(*) begin
    state_w = state_r;
    case(state_r)
      IDLE_S: state_w = (valid_in) ? PHASE_1_S : IDLE_S;
      PHASE_1_S: state_w = PHASE_2_S;
      PHASE_2_S: state_w = (valid_in) ? PHASE_1_S : END_S;
      END_S : state_w = IDLE_S;
    endcase
  end

  // input FF
  always @(*) begin
    valid_in_w = valid_in;
    data_in_real_w = data_in_real;
    data_in_imag_w = data_in_imag;
  end

  always @(*) begin
    FIFO_real_w = FIFO_real_r;
    FIFO_imag_w = FIFO_imag_r;
    valid_out_w = 0;
    data_out_real_w = data_out_real_r;
    data_out_imag_w = data_out_imag_r;
    case (state_r)
      PHASE_1_S: begin
        valid_out_w = valid_out_r; // if it is the first phase 1, then output is not valid
        FIFO_real_w = data_in_real_r;
        FIFO_imag_w = data_in_imag_r;
        data_out_real_w = FIFO_real_r*TWIDDLE_FACTOR_REAL - FIFO_imag_r*TWIDDLE_FACTOR_IMAG;
        data_out_imag_w = FIFO_real_r*TWIDDLE_FACTOR_IMAG + FIFO_imag_r*TWIDDLE_FACTOR_REAL;
      end
      PHASE_2_S: begin
        valid_out_w = 1;
        FIFO_real_w = FIFO_real_r-data_in_real_r;
        FIFO_imag_w = FIFO_imag_r-data_in_imag_r;
        data_out_real_w = FIFO_real_r+data_in_real_r;
        data_out_imag_w = FIFO_imag_r+data_in_imag_r;
      end
      END_S: begin
        valid_out_w = 1;
        data_out_real_w = FIFO_real_r*TWIDDLE_FACTOR_REAL - FIFO_imag_r*TWIDDLE_FACTOR_IMAG;
        data_out_imag_w = FIFO_real_r*TWIDDLE_FACTOR_IMAG + FIFO_imag_r*TWIDDLE_FACTOR_REAL;
      end
    endcase
  end

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      state_r <= IDLE_S;
      FIFO_real_r <= 0;
      FIFO_imag_r <= 0;
      valid_in_r <= 0;
      data_in_real_r <= 0;
      data_in_imag_r <= 0;
      data_out_real_r <= 0;
      data_out_imag_r <= 0;
      valid_out_r <= 0;
    end
    else begin
      state_r <= state_w;
      FIFO_real_r <= FIFO_real_w;
      FIFO_imag_r <= FIFO_imag_w;
      valid_in_r <= valid_in_w;
      data_in_real_r <= data_in_real_w;
      data_in_imag_r <= data_in_imag_w;
      data_out_real_r <= data_out_real_w;
      data_out_imag_r <= data_out_imag_w;
      valid_out_r <= valid_out_w;
    end
  end
  
endmodule