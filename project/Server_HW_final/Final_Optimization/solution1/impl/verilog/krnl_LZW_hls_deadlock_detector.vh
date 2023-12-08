
    wire reset;
    wire clock;
    assign reset = ap_rst_n;
    assign clock = ap_clk;
    wire [3:0] proc_0_data_FIFO_blk;
    wire [3:0] proc_0_data_PIPO_blk;
    wire [3:0] proc_0_start_FIFO_blk;
    wire [3:0] proc_0_TLF_FIFO_blk;
    wire [3:0] proc_0_input_sync_blk;
    wire [3:0] proc_0_output_sync_blk;
    wire [3:0] proc_dep_vld_vec_0;
    reg [3:0] proc_dep_vld_vec_0_reg;
    wire [3:0] in_chan_dep_vld_vec_0;
    wire [23:0] in_chan_dep_data_vec_0;
    wire [3:0] token_in_vec_0;
    wire [3:0] out_chan_dep_vld_vec_0;
    wire [5:0] out_chan_dep_data_0;
    wire [3:0] token_out_vec_0;
    wire dl_detect_out_0;
    wire dep_chan_vld_1_0;
    wire [5:0] dep_chan_data_1_0;
    wire token_1_0;
    wire dep_chan_vld_2_0;
    wire [5:0] dep_chan_data_2_0;
    wire token_2_0;
    wire dep_chan_vld_3_0;
    wire [5:0] dep_chan_data_3_0;
    wire token_3_0;
    wire dep_chan_vld_5_0;
    wire [5:0] dep_chan_data_5_0;
    wire token_5_0;
    wire [2:0] proc_1_data_FIFO_blk;
    wire [2:0] proc_1_data_PIPO_blk;
    wire [2:0] proc_1_start_FIFO_blk;
    wire [2:0] proc_1_TLF_FIFO_blk;
    wire [2:0] proc_1_input_sync_blk;
    wire [2:0] proc_1_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_1;
    reg [2:0] proc_dep_vld_vec_1_reg;
    wire [2:0] in_chan_dep_vld_vec_1;
    wire [17:0] in_chan_dep_data_vec_1;
    wire [2:0] token_in_vec_1;
    wire [2:0] out_chan_dep_vld_vec_1;
    wire [5:0] out_chan_dep_data_1;
    wire [2:0] token_out_vec_1;
    wire dl_detect_out_1;
    wire dep_chan_vld_0_1;
    wire [5:0] dep_chan_data_0_1;
    wire token_0_1;
    wire dep_chan_vld_3_1;
    wire [5:0] dep_chan_data_3_1;
    wire token_3_1;
    wire dep_chan_vld_5_1;
    wire [5:0] dep_chan_data_5_1;
    wire token_5_1;
    wire [2:0] proc_2_data_FIFO_blk;
    wire [2:0] proc_2_data_PIPO_blk;
    wire [2:0] proc_2_start_FIFO_blk;
    wire [2:0] proc_2_TLF_FIFO_blk;
    wire [2:0] proc_2_input_sync_blk;
    wire [2:0] proc_2_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_2;
    reg [2:0] proc_dep_vld_vec_2_reg;
    wire [2:0] in_chan_dep_vld_vec_2;
    wire [17:0] in_chan_dep_data_vec_2;
    wire [2:0] token_in_vec_2;
    wire [2:0] out_chan_dep_vld_vec_2;
    wire [5:0] out_chan_dep_data_2;
    wire [2:0] token_out_vec_2;
    wire dl_detect_out_2;
    wire dep_chan_vld_0_2;
    wire [5:0] dep_chan_data_0_2;
    wire token_0_2;
    wire dep_chan_vld_3_2;
    wire [5:0] dep_chan_data_3_2;
    wire token_3_2;
    wire dep_chan_vld_5_2;
    wire [5:0] dep_chan_data_5_2;
    wire token_5_2;
    wire [4:0] proc_3_data_FIFO_blk;
    wire [4:0] proc_3_data_PIPO_blk;
    wire [4:0] proc_3_start_FIFO_blk;
    wire [4:0] proc_3_TLF_FIFO_blk;
    wire [4:0] proc_3_input_sync_blk;
    wire [4:0] proc_3_output_sync_blk;
    wire [4:0] proc_dep_vld_vec_3;
    reg [4:0] proc_dep_vld_vec_3_reg;
    wire [4:0] in_chan_dep_vld_vec_3;
    wire [29:0] in_chan_dep_data_vec_3;
    wire [4:0] token_in_vec_3;
    wire [4:0] out_chan_dep_vld_vec_3;
    wire [5:0] out_chan_dep_data_3;
    wire [4:0] token_out_vec_3;
    wire dl_detect_out_3;
    wire dep_chan_vld_0_3;
    wire [5:0] dep_chan_data_0_3;
    wire token_0_3;
    wire dep_chan_vld_1_3;
    wire [5:0] dep_chan_data_1_3;
    wire token_1_3;
    wire dep_chan_vld_2_3;
    wire [5:0] dep_chan_data_2_3;
    wire token_2_3;
    wire dep_chan_vld_4_3;
    wire [5:0] dep_chan_data_4_3;
    wire token_4_3;
    wire dep_chan_vld_5_3;
    wire [5:0] dep_chan_data_5_3;
    wire token_5_3;
    wire [1:0] proc_4_data_FIFO_blk;
    wire [1:0] proc_4_data_PIPO_blk;
    wire [1:0] proc_4_start_FIFO_blk;
    wire [1:0] proc_4_TLF_FIFO_blk;
    wire [1:0] proc_4_input_sync_blk;
    wire [1:0] proc_4_output_sync_blk;
    wire [1:0] proc_dep_vld_vec_4;
    reg [1:0] proc_dep_vld_vec_4_reg;
    wire [1:0] in_chan_dep_vld_vec_4;
    wire [11:0] in_chan_dep_data_vec_4;
    wire [1:0] token_in_vec_4;
    wire [1:0] out_chan_dep_vld_vec_4;
    wire [5:0] out_chan_dep_data_4;
    wire [1:0] token_out_vec_4;
    wire dl_detect_out_4;
    wire dep_chan_vld_3_4;
    wire [5:0] dep_chan_data_3_4;
    wire token_3_4;
    wire dep_chan_vld_5_4;
    wire [5:0] dep_chan_data_5_4;
    wire token_5_4;
    wire [4:0] proc_5_data_FIFO_blk;
    wire [4:0] proc_5_data_PIPO_blk;
    wire [4:0] proc_5_start_FIFO_blk;
    wire [4:0] proc_5_TLF_FIFO_blk;
    wire [4:0] proc_5_input_sync_blk;
    wire [4:0] proc_5_output_sync_blk;
    wire [4:0] proc_dep_vld_vec_5;
    reg [4:0] proc_dep_vld_vec_5_reg;
    wire [4:0] in_chan_dep_vld_vec_5;
    wire [29:0] in_chan_dep_data_vec_5;
    wire [4:0] token_in_vec_5;
    wire [4:0] out_chan_dep_vld_vec_5;
    wire [5:0] out_chan_dep_data_5;
    wire [4:0] token_out_vec_5;
    wire dl_detect_out_5;
    wire dep_chan_vld_0_5;
    wire [5:0] dep_chan_data_0_5;
    wire token_0_5;
    wire dep_chan_vld_1_5;
    wire [5:0] dep_chan_data_1_5;
    wire token_1_5;
    wire dep_chan_vld_2_5;
    wire [5:0] dep_chan_data_2_5;
    wire token_2_5;
    wire dep_chan_vld_3_5;
    wire [5:0] dep_chan_data_3_5;
    wire token_3_5;
    wire dep_chan_vld_4_5;
    wire [5:0] dep_chan_data_4_5;
    wire token_4_5;
    wire [5:0] dl_in_vec;
    wire dl_detect_out;
    wire token_clear;
    reg [5:0] origin;

    reg ap_done_reg_0;// for module grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.read_input_U0
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            ap_done_reg_0 <= 'b0;
        end
        else begin
            ap_done_reg_0 <= grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.read_input_U0.ap_done & ~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.read_input_U0.ap_continue;
        end
    end

    reg ap_done_reg_1;// for module grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.write_result_U0
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            ap_done_reg_1 <= 'b0;
        end
        else begin
            ap_done_reg_1 <= grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.write_result_U0.ap_done & ~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.write_result_U0.ap_continue;
        end
    end

reg [15:0] trans_in_cnt_0;// for process grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.dataflow_in_loop_VITIS_LOOP_346_2_entry3_U0
always @(negedge reset or posedge clock) begin
    if (~reset) begin
         trans_in_cnt_0 <= 16'h0;
    end
    else if (grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.dataflow_in_loop_VITIS_LOOP_346_2_entry3_U0.start_write == 1'b1) begin
        trans_in_cnt_0 <= trans_in_cnt_0 + 16'h1;
    end
    else begin
        trans_in_cnt_0 <= trans_in_cnt_0;
    end
end

reg [15:0] trans_out_cnt_0;// for process grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.dataflow_in_loop_VITIS_LOOP_346_2_entry3_U0
always @(negedge reset or posedge clock) begin
    if (~reset) begin
         trans_out_cnt_0 <= 16'h0;
    end
    else if (grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.dataflow_in_loop_VITIS_LOOP_346_2_entry3_U0.ap_done == 1'b1 && grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.dataflow_in_loop_VITIS_LOOP_346_2_entry3_U0.ap_continue == 1'b1) begin
        trans_out_cnt_0 <= trans_out_cnt_0 + 16'h1;
    end
    else begin
        trans_out_cnt_0 <= trans_out_cnt_0;
    end
end

reg [15:0] trans_in_cnt_1;// for process grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.read_input_U0
always @(negedge reset or posedge clock) begin
    if (~reset) begin
         trans_in_cnt_1 <= 16'h0;
    end
    else if (grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.read_input_U0.start_write == 1'b1) begin
        trans_in_cnt_1 <= trans_in_cnt_1 + 16'h1;
    end
    else begin
        trans_in_cnt_1 <= trans_in_cnt_1;
    end
end

reg [15:0] trans_out_cnt_1;// for process grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.read_input_U0
always @(negedge reset or posedge clock) begin
    if (~reset) begin
         trans_out_cnt_1 <= 16'h0;
    end
    else if (grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.read_input_U0.ap_done == 1'b1 && grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.read_input_U0.ap_continue == 1'b1) begin
        trans_out_cnt_1 <= trans_out_cnt_1 + 16'h1;
    end
    else begin
        trans_out_cnt_1 <= trans_out_cnt_1;
    end
end

    // Process: grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.dataflow_in_loop_VITIS_LOOP_346_2_entry3_U0
    krnl_LZW_hls_deadlock_detect_unit #(6, 0, 4, 4) krnl_LZW_hls_deadlock_detect_unit_0 (
        .reset(reset),
        .clock(clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_0),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_0),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_0),
        .token_in_vec(token_in_vec_0),
        .dl_detect_in(dl_detect_out),
        .origin(origin[0]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_0),
        .out_chan_dep_data(out_chan_dep_data_0),
        .token_out_vec(token_out_vec_0),
        .dl_detect_out(dl_in_vec[0]));

    assign proc_0_data_FIFO_blk[0] = 1'b0 | (~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.dataflow_in_loop_VITIS_LOOP_346_2_entry3_U0.input_out_blk_n) | (~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.dataflow_in_loop_VITIS_LOOP_346_2_entry3_U0.send_data_out_blk_n) | (~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.dataflow_in_loop_VITIS_LOOP_346_2_entry3_U0.i_1_out_blk_n) | (~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.dataflow_in_loop_VITIS_LOOP_346_2_entry3_U0.output_length_out_blk_n);
    assign proc_0_data_PIPO_blk[0] = 1'b0;
    assign proc_0_start_FIFO_blk[0] = 1'b0 | (~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.start_for_dataflow_in_loop_VITIS_LOOP_346_2_entry6_U0_U.if_full_n & grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.dataflow_in_loop_VITIS_LOOP_346_2_entry3_U0.ap_start & ~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.dataflow_in_loop_VITIS_LOOP_346_2_entry3_U0.real_start & (trans_in_cnt_0 == trans_out_cnt_0) & ~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.start_for_dataflow_in_loop_VITIS_LOOP_346_2_entry6_U0_U.if_read);
    assign proc_0_TLF_FIFO_blk[0] = 1'b0;
    assign proc_0_input_sync_blk[0] = 1'b0;
    assign proc_0_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_0[0] = dl_detect_out ? proc_dep_vld_vec_0_reg[0] : (proc_0_data_FIFO_blk[0] | proc_0_data_PIPO_blk[0] | proc_0_start_FIFO_blk[0] | proc_0_TLF_FIFO_blk[0] | proc_0_input_sync_blk[0] | proc_0_output_sync_blk[0]);
    assign proc_0_data_FIFO_blk[1] = 1'b0;
    assign proc_0_data_PIPO_blk[1] = 1'b0;
    assign proc_0_start_FIFO_blk[1] = 1'b0;
    assign proc_0_TLF_FIFO_blk[1] = 1'b0;
    assign proc_0_input_sync_blk[1] = 1'b0 | (grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.ap_sync_dataflow_in_loop_VITIS_LOOP_346_2_entry3_U0_ap_ready & grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.dataflow_in_loop_VITIS_LOOP_346_2_entry3_U0.ap_idle & ~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.ap_sync_Block_entry_proc_proc_U0_ap_ready);
    assign proc_0_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_0[1] = dl_detect_out ? proc_dep_vld_vec_0_reg[1] : (proc_0_data_FIFO_blk[1] | proc_0_data_PIPO_blk[1] | proc_0_start_FIFO_blk[1] | proc_0_TLF_FIFO_blk[1] | proc_0_input_sync_blk[1] | proc_0_output_sync_blk[1]);
    assign proc_0_data_FIFO_blk[2] = 1'b0;
    assign proc_0_data_PIPO_blk[2] = 1'b0;
    assign proc_0_start_FIFO_blk[2] = 1'b0;
    assign proc_0_TLF_FIFO_blk[2] = 1'b0;
    assign proc_0_input_sync_blk[2] = 1'b0 | (grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.ap_sync_dataflow_in_loop_VITIS_LOOP_346_2_entry3_U0_ap_ready & grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.dataflow_in_loop_VITIS_LOOP_346_2_entry3_U0.ap_idle & ~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.ap_sync_read_input_U0_ap_ready);
    assign proc_0_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_0[2] = dl_detect_out ? proc_dep_vld_vec_0_reg[2] : (proc_0_data_FIFO_blk[2] | proc_0_data_PIPO_blk[2] | proc_0_start_FIFO_blk[2] | proc_0_TLF_FIFO_blk[2] | proc_0_input_sync_blk[2] | proc_0_output_sync_blk[2]);
    assign proc_0_data_FIFO_blk[3] = 1'b0;
    assign proc_0_data_PIPO_blk[3] = 1'b0;
    assign proc_0_start_FIFO_blk[3] = 1'b0;
    assign proc_0_TLF_FIFO_blk[3] = 1'b0;
    assign proc_0_input_sync_blk[3] = 1'b0 | (grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.ap_sync_dataflow_in_loop_VITIS_LOOP_346_2_entry3_U0_ap_ready & grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.dataflow_in_loop_VITIS_LOOP_346_2_entry3_U0.ap_idle & ~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.ap_sync_write_result_U0_ap_ready);
    assign proc_0_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_0[3] = dl_detect_out ? proc_dep_vld_vec_0_reg[3] : (proc_0_data_FIFO_blk[3] | proc_0_data_PIPO_blk[3] | proc_0_start_FIFO_blk[3] | proc_0_TLF_FIFO_blk[3] | proc_0_input_sync_blk[3] | proc_0_output_sync_blk[3]);
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            proc_dep_vld_vec_0_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_0_reg <= proc_dep_vld_vec_0;
        end
    end
    assign in_chan_dep_vld_vec_0[0] = dep_chan_vld_1_0;
    assign in_chan_dep_data_vec_0[5 : 0] = dep_chan_data_1_0;
    assign token_in_vec_0[0] = token_1_0;
    assign in_chan_dep_vld_vec_0[1] = dep_chan_vld_2_0;
    assign in_chan_dep_data_vec_0[11 : 6] = dep_chan_data_2_0;
    assign token_in_vec_0[1] = token_2_0;
    assign in_chan_dep_vld_vec_0[2] = dep_chan_vld_3_0;
    assign in_chan_dep_data_vec_0[17 : 12] = dep_chan_data_3_0;
    assign token_in_vec_0[2] = token_3_0;
    assign in_chan_dep_vld_vec_0[3] = dep_chan_vld_5_0;
    assign in_chan_dep_data_vec_0[23 : 18] = dep_chan_data_5_0;
    assign token_in_vec_0[3] = token_5_0;
    assign dep_chan_vld_0_1 = out_chan_dep_vld_vec_0[0];
    assign dep_chan_data_0_1 = out_chan_dep_data_0;
    assign token_0_1 = token_out_vec_0[0];
    assign dep_chan_vld_0_2 = out_chan_dep_vld_vec_0[1];
    assign dep_chan_data_0_2 = out_chan_dep_data_0;
    assign token_0_2 = token_out_vec_0[1];
    assign dep_chan_vld_0_3 = out_chan_dep_vld_vec_0[2];
    assign dep_chan_data_0_3 = out_chan_dep_data_0;
    assign token_0_3 = token_out_vec_0[2];
    assign dep_chan_vld_0_5 = out_chan_dep_vld_vec_0[3];
    assign dep_chan_data_0_5 = out_chan_dep_data_0;
    assign token_0_5 = token_out_vec_0[3];

    // Process: grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.dataflow_in_loop_VITIS_LOOP_346_2_entry6_U0
    krnl_LZW_hls_deadlock_detect_unit #(6, 1, 3, 3) krnl_LZW_hls_deadlock_detect_unit_1 (
        .reset(reset),
        .clock(clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_1),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_1),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_1),
        .token_in_vec(token_in_vec_1),
        .dl_detect_in(dl_detect_out),
        .origin(origin[1]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_1),
        .out_chan_dep_data(out_chan_dep_data_1),
        .token_out_vec(token_out_vec_1),
        .dl_detect_out(dl_in_vec[1]));

    assign proc_1_data_FIFO_blk[0] = 1'b0 | (~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.dataflow_in_loop_VITIS_LOOP_346_2_entry6_U0.input_r_blk_n) | (~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.dataflow_in_loop_VITIS_LOOP_346_2_entry6_U0.send_data_blk_n) | (~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.dataflow_in_loop_VITIS_LOOP_346_2_entry6_U0.i_1_blk_n) | (~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.dataflow_in_loop_VITIS_LOOP_346_2_entry6_U0.output_length_blk_n);
    assign proc_1_data_PIPO_blk[0] = 1'b0;
    assign proc_1_start_FIFO_blk[0] = 1'b0 | (~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.start_for_dataflow_in_loop_VITIS_LOOP_346_2_entry6_U0_U.if_empty_n & grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.dataflow_in_loop_VITIS_LOOP_346_2_entry6_U0.ap_idle & ~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.start_for_dataflow_in_loop_VITIS_LOOP_346_2_entry6_U0_U.if_write);
    assign proc_1_TLF_FIFO_blk[0] = 1'b0;
    assign proc_1_input_sync_blk[0] = 1'b0;
    assign proc_1_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_1[0] = dl_detect_out ? proc_dep_vld_vec_1_reg[0] : (proc_1_data_FIFO_blk[0] | proc_1_data_PIPO_blk[0] | proc_1_start_FIFO_blk[0] | proc_1_TLF_FIFO_blk[0] | proc_1_input_sync_blk[0] | proc_1_output_sync_blk[0]);
    assign proc_1_data_FIFO_blk[1] = 1'b0 | (~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.dataflow_in_loop_VITIS_LOOP_346_2_entry6_U0.input_out_blk_n);
    assign proc_1_data_PIPO_blk[1] = 1'b0;
    assign proc_1_start_FIFO_blk[1] = 1'b0;
    assign proc_1_TLF_FIFO_blk[1] = 1'b0;
    assign proc_1_input_sync_blk[1] = 1'b0;
    assign proc_1_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_1[1] = dl_detect_out ? proc_dep_vld_vec_1_reg[1] : (proc_1_data_FIFO_blk[1] | proc_1_data_PIPO_blk[1] | proc_1_start_FIFO_blk[1] | proc_1_TLF_FIFO_blk[1] | proc_1_input_sync_blk[1] | proc_1_output_sync_blk[1]);
    assign proc_1_data_FIFO_blk[2] = 1'b0 | (~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.dataflow_in_loop_VITIS_LOOP_346_2_entry6_U0.send_data_out_blk_n) | (~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.dataflow_in_loop_VITIS_LOOP_346_2_entry6_U0.i_1_out_blk_n) | (~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.dataflow_in_loop_VITIS_LOOP_346_2_entry6_U0.output_length_out_blk_n);
    assign proc_1_data_PIPO_blk[2] = 1'b0;
    assign proc_1_start_FIFO_blk[2] = 1'b0;
    assign proc_1_TLF_FIFO_blk[2] = 1'b0;
    assign proc_1_input_sync_blk[2] = 1'b0;
    assign proc_1_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_1[2] = dl_detect_out ? proc_dep_vld_vec_1_reg[2] : (proc_1_data_FIFO_blk[2] | proc_1_data_PIPO_blk[2] | proc_1_start_FIFO_blk[2] | proc_1_TLF_FIFO_blk[2] | proc_1_input_sync_blk[2] | proc_1_output_sync_blk[2]);
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            proc_dep_vld_vec_1_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_1_reg <= proc_dep_vld_vec_1;
        end
    end
    assign in_chan_dep_vld_vec_1[0] = dep_chan_vld_0_1;
    assign in_chan_dep_data_vec_1[5 : 0] = dep_chan_data_0_1;
    assign token_in_vec_1[0] = token_0_1;
    assign in_chan_dep_vld_vec_1[1] = dep_chan_vld_3_1;
    assign in_chan_dep_data_vec_1[11 : 6] = dep_chan_data_3_1;
    assign token_in_vec_1[1] = token_3_1;
    assign in_chan_dep_vld_vec_1[2] = dep_chan_vld_5_1;
    assign in_chan_dep_data_vec_1[17 : 12] = dep_chan_data_5_1;
    assign token_in_vec_1[2] = token_5_1;
    assign dep_chan_vld_1_0 = out_chan_dep_vld_vec_1[0];
    assign dep_chan_data_1_0 = out_chan_dep_data_1;
    assign token_1_0 = token_out_vec_1[0];
    assign dep_chan_vld_1_3 = out_chan_dep_vld_vec_1[1];
    assign dep_chan_data_1_3 = out_chan_dep_data_1;
    assign token_1_3 = token_out_vec_1[1];
    assign dep_chan_vld_1_5 = out_chan_dep_vld_vec_1[2];
    assign dep_chan_data_1_5 = out_chan_dep_data_1;
    assign token_1_5 = token_out_vec_1[2];

    // Process: grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.Block_entry_proc_proc_U0
    krnl_LZW_hls_deadlock_detect_unit #(6, 2, 3, 3) krnl_LZW_hls_deadlock_detect_unit_2 (
        .reset(reset),
        .clock(clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_2),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_2),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_2),
        .token_in_vec(token_in_vec_2),
        .dl_detect_in(dl_detect_out),
        .origin(origin[2]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_2),
        .out_chan_dep_data(out_chan_dep_data_2),
        .token_out_vec(token_out_vec_2),
        .dl_detect_out(dl_in_vec[2]));

    assign proc_2_data_FIFO_blk[0] = 1'b0;
    assign proc_2_data_PIPO_blk[0] = 1'b0;
    assign proc_2_start_FIFO_blk[0] = 1'b0;
    assign proc_2_TLF_FIFO_blk[0] = 1'b0;
    assign proc_2_input_sync_blk[0] = 1'b0 | (grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.ap_sync_Block_entry_proc_proc_U0_ap_ready & grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.Block_entry_proc_proc_U0.ap_idle & ~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.ap_sync_dataflow_in_loop_VITIS_LOOP_346_2_entry3_U0_ap_ready);
    assign proc_2_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_2[0] = dl_detect_out ? proc_dep_vld_vec_2_reg[0] : (proc_2_data_FIFO_blk[0] | proc_2_data_PIPO_blk[0] | proc_2_start_FIFO_blk[0] | proc_2_TLF_FIFO_blk[0] | proc_2_input_sync_blk[0] | proc_2_output_sync_blk[0]);
    assign proc_2_data_FIFO_blk[1] = 1'b0;
    assign proc_2_data_PIPO_blk[1] = 1'b0;
    assign proc_2_start_FIFO_blk[1] = 1'b0;
    assign proc_2_TLF_FIFO_blk[1] = 1'b0;
    assign proc_2_input_sync_blk[1] = 1'b0 | (grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.ap_sync_Block_entry_proc_proc_U0_ap_ready & grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.Block_entry_proc_proc_U0.ap_idle & ~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.ap_sync_read_input_U0_ap_ready);
    assign proc_2_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_2[1] = dl_detect_out ? proc_dep_vld_vec_2_reg[1] : (proc_2_data_FIFO_blk[1] | proc_2_data_PIPO_blk[1] | proc_2_start_FIFO_blk[1] | proc_2_TLF_FIFO_blk[1] | proc_2_input_sync_blk[1] | proc_2_output_sync_blk[1]);
    assign proc_2_data_FIFO_blk[2] = 1'b0;
    assign proc_2_data_PIPO_blk[2] = 1'b0;
    assign proc_2_start_FIFO_blk[2] = 1'b0;
    assign proc_2_TLF_FIFO_blk[2] = 1'b0;
    assign proc_2_input_sync_blk[2] = 1'b0 | (grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.ap_sync_Block_entry_proc_proc_U0_ap_ready & grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.Block_entry_proc_proc_U0.ap_idle & ~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.ap_sync_write_result_U0_ap_ready);
    assign proc_2_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_2[2] = dl_detect_out ? proc_dep_vld_vec_2_reg[2] : (proc_2_data_FIFO_blk[2] | proc_2_data_PIPO_blk[2] | proc_2_start_FIFO_blk[2] | proc_2_TLF_FIFO_blk[2] | proc_2_input_sync_blk[2] | proc_2_output_sync_blk[2]);
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            proc_dep_vld_vec_2_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_2_reg <= proc_dep_vld_vec_2;
        end
    end
    assign in_chan_dep_vld_vec_2[0] = dep_chan_vld_0_2;
    assign in_chan_dep_data_vec_2[5 : 0] = dep_chan_data_0_2;
    assign token_in_vec_2[0] = token_0_2;
    assign in_chan_dep_vld_vec_2[1] = dep_chan_vld_3_2;
    assign in_chan_dep_data_vec_2[11 : 6] = dep_chan_data_3_2;
    assign token_in_vec_2[1] = token_3_2;
    assign in_chan_dep_vld_vec_2[2] = dep_chan_vld_5_2;
    assign in_chan_dep_data_vec_2[17 : 12] = dep_chan_data_5_2;
    assign token_in_vec_2[2] = token_5_2;
    assign dep_chan_vld_2_0 = out_chan_dep_vld_vec_2[0];
    assign dep_chan_data_2_0 = out_chan_dep_data_2;
    assign token_2_0 = token_out_vec_2[0];
    assign dep_chan_vld_2_3 = out_chan_dep_vld_vec_2[1];
    assign dep_chan_data_2_3 = out_chan_dep_data_2;
    assign token_2_3 = token_out_vec_2[1];
    assign dep_chan_vld_2_5 = out_chan_dep_vld_vec_2[2];
    assign dep_chan_data_2_5 = out_chan_dep_data_2;
    assign token_2_5 = token_out_vec_2[2];

    // Process: grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.read_input_U0
    krnl_LZW_hls_deadlock_detect_unit #(6, 3, 5, 5) krnl_LZW_hls_deadlock_detect_unit_3 (
        .reset(reset),
        .clock(clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_3),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_3),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_3),
        .token_in_vec(token_in_vec_3),
        .dl_detect_in(dl_detect_out),
        .origin(origin[3]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_3),
        .out_chan_dep_data(out_chan_dep_data_3),
        .token_out_vec(token_out_vec_3),
        .dl_detect_out(dl_in_vec[3]));

    assign proc_3_data_FIFO_blk[0] = 1'b0 | (~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.read_input_U0.input_r_blk_n);
    assign proc_3_data_PIPO_blk[0] = 1'b0;
    assign proc_3_start_FIFO_blk[0] = 1'b0;
    assign proc_3_TLF_FIFO_blk[0] = 1'b0;
    assign proc_3_input_sync_blk[0] = 1'b0;
    assign proc_3_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_3[0] = dl_detect_out ? proc_dep_vld_vec_3_reg[0] : (proc_3_data_FIFO_blk[0] | proc_3_data_PIPO_blk[0] | proc_3_start_FIFO_blk[0] | proc_3_TLF_FIFO_blk[0] | proc_3_input_sync_blk[0] | proc_3_output_sync_blk[0]);
    assign proc_3_data_FIFO_blk[1] = 1'b0 | (~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.read_input_U0.inStream_in_blk_n);
    assign proc_3_data_PIPO_blk[1] = 1'b0;
    assign proc_3_start_FIFO_blk[1] = 1'b0 | (~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.start_for_compute_LZW_U0_U.if_full_n & grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.read_input_U0.ap_start & ~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.read_input_U0.real_start & (trans_in_cnt_1 == trans_out_cnt_1) & ~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.start_for_compute_LZW_U0_U.if_read);
    assign proc_3_TLF_FIFO_blk[1] = 1'b0;
    assign proc_3_input_sync_blk[1] = 1'b0;
    assign proc_3_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_3[1] = dl_detect_out ? proc_dep_vld_vec_3_reg[1] : (proc_3_data_FIFO_blk[1] | proc_3_data_PIPO_blk[1] | proc_3_start_FIFO_blk[1] | proc_3_TLF_FIFO_blk[1] | proc_3_input_sync_blk[1] | proc_3_output_sync_blk[1]);
    assign proc_3_data_FIFO_blk[2] = 1'b0;
    assign proc_3_data_PIPO_blk[2] = 1'b0;
    assign proc_3_start_FIFO_blk[2] = 1'b0;
    assign proc_3_TLF_FIFO_blk[2] = 1'b0;
    assign proc_3_input_sync_blk[2] = 1'b0 | (grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.ap_sync_read_input_U0_ap_ready & grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.read_input_U0.ap_idle & ~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.ap_sync_dataflow_in_loop_VITIS_LOOP_346_2_entry3_U0_ap_ready);
    assign proc_3_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_3[2] = dl_detect_out ? proc_dep_vld_vec_3_reg[2] : (proc_3_data_FIFO_blk[2] | proc_3_data_PIPO_blk[2] | proc_3_start_FIFO_blk[2] | proc_3_TLF_FIFO_blk[2] | proc_3_input_sync_blk[2] | proc_3_output_sync_blk[2]);
    assign proc_3_data_FIFO_blk[3] = 1'b0;
    assign proc_3_data_PIPO_blk[3] = 1'b0;
    assign proc_3_start_FIFO_blk[3] = 1'b0;
    assign proc_3_TLF_FIFO_blk[3] = 1'b0;
    assign proc_3_input_sync_blk[3] = 1'b0 | (grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.ap_sync_read_input_U0_ap_ready & grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.read_input_U0.ap_idle & ~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.ap_sync_Block_entry_proc_proc_U0_ap_ready);
    assign proc_3_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_3[3] = dl_detect_out ? proc_dep_vld_vec_3_reg[3] : (proc_3_data_FIFO_blk[3] | proc_3_data_PIPO_blk[3] | proc_3_start_FIFO_blk[3] | proc_3_TLF_FIFO_blk[3] | proc_3_input_sync_blk[3] | proc_3_output_sync_blk[3]);
    assign proc_3_data_FIFO_blk[4] = 1'b0;
    assign proc_3_data_PIPO_blk[4] = 1'b0;
    assign proc_3_start_FIFO_blk[4] = 1'b0;
    assign proc_3_TLF_FIFO_blk[4] = 1'b0;
    assign proc_3_input_sync_blk[4] = 1'b0 | (grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.ap_sync_read_input_U0_ap_ready & grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.read_input_U0.ap_idle & ~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.ap_sync_write_result_U0_ap_ready);
    assign proc_3_output_sync_blk[4] = 1'b0 | (ap_done_reg_0 & grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.read_input_U0.ap_done & ~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.write_result_U0.ap_done);
    assign proc_dep_vld_vec_3[4] = dl_detect_out ? proc_dep_vld_vec_3_reg[4] : (proc_3_data_FIFO_blk[4] | proc_3_data_PIPO_blk[4] | proc_3_start_FIFO_blk[4] | proc_3_TLF_FIFO_blk[4] | proc_3_input_sync_blk[4] | proc_3_output_sync_blk[4]);
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            proc_dep_vld_vec_3_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_3_reg <= proc_dep_vld_vec_3;
        end
    end
    assign in_chan_dep_vld_vec_3[0] = dep_chan_vld_0_3;
    assign in_chan_dep_data_vec_3[5 : 0] = dep_chan_data_0_3;
    assign token_in_vec_3[0] = token_0_3;
    assign in_chan_dep_vld_vec_3[1] = dep_chan_vld_1_3;
    assign in_chan_dep_data_vec_3[11 : 6] = dep_chan_data_1_3;
    assign token_in_vec_3[1] = token_1_3;
    assign in_chan_dep_vld_vec_3[2] = dep_chan_vld_2_3;
    assign in_chan_dep_data_vec_3[17 : 12] = dep_chan_data_2_3;
    assign token_in_vec_3[2] = token_2_3;
    assign in_chan_dep_vld_vec_3[3] = dep_chan_vld_4_3;
    assign in_chan_dep_data_vec_3[23 : 18] = dep_chan_data_4_3;
    assign token_in_vec_3[3] = token_4_3;
    assign in_chan_dep_vld_vec_3[4] = dep_chan_vld_5_3;
    assign in_chan_dep_data_vec_3[29 : 24] = dep_chan_data_5_3;
    assign token_in_vec_3[4] = token_5_3;
    assign dep_chan_vld_3_1 = out_chan_dep_vld_vec_3[0];
    assign dep_chan_data_3_1 = out_chan_dep_data_3;
    assign token_3_1 = token_out_vec_3[0];
    assign dep_chan_vld_3_4 = out_chan_dep_vld_vec_3[1];
    assign dep_chan_data_3_4 = out_chan_dep_data_3;
    assign token_3_4 = token_out_vec_3[1];
    assign dep_chan_vld_3_0 = out_chan_dep_vld_vec_3[2];
    assign dep_chan_data_3_0 = out_chan_dep_data_3;
    assign token_3_0 = token_out_vec_3[2];
    assign dep_chan_vld_3_2 = out_chan_dep_vld_vec_3[3];
    assign dep_chan_data_3_2 = out_chan_dep_data_3;
    assign token_3_2 = token_out_vec_3[3];
    assign dep_chan_vld_3_5 = out_chan_dep_vld_vec_3[4];
    assign dep_chan_data_3_5 = out_chan_dep_data_3;
    assign token_3_5 = token_out_vec_3[4];

    // Process: grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.compute_LZW_U0
    krnl_LZW_hls_deadlock_detect_unit #(6, 4, 2, 2) krnl_LZW_hls_deadlock_detect_unit_4 (
        .reset(reset),
        .clock(clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_4),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_4),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_4),
        .token_in_vec(token_in_vec_4),
        .dl_detect_in(dl_detect_out),
        .origin(origin[4]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_4),
        .out_chan_dep_data(out_chan_dep_data_4),
        .token_out_vec(token_out_vec_4),
        .dl_detect_out(dl_in_vec[4]));

    assign proc_4_data_FIFO_blk[0] = 1'b0 | (~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.compute_LZW_U0.inStream_in_blk_n);
    assign proc_4_data_PIPO_blk[0] = 1'b0;
    assign proc_4_start_FIFO_blk[0] = 1'b0 | (~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.start_for_compute_LZW_U0_U.if_empty_n & grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.compute_LZW_U0.ap_idle & ~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.start_for_compute_LZW_U0_U.if_write);
    assign proc_4_TLF_FIFO_blk[0] = 1'b0;
    assign proc_4_input_sync_blk[0] = 1'b0;
    assign proc_4_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_4[0] = dl_detect_out ? proc_dep_vld_vec_4_reg[0] : (proc_4_data_FIFO_blk[0] | proc_4_data_PIPO_blk[0] | proc_4_start_FIFO_blk[0] | proc_4_TLF_FIFO_blk[0] | proc_4_input_sync_blk[0] | proc_4_output_sync_blk[0]);
    assign proc_4_data_FIFO_blk[1] = 1'b0 | (~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.compute_LZW_U0.outStream_code_flg_blk_n) | (~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.compute_LZW_U0.outStream_code_blk_n);
    assign proc_4_data_PIPO_blk[1] = 1'b0;
    assign proc_4_start_FIFO_blk[1] = 1'b0;
    assign proc_4_TLF_FIFO_blk[1] = 1'b0;
    assign proc_4_input_sync_blk[1] = 1'b0;
    assign proc_4_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_4[1] = dl_detect_out ? proc_dep_vld_vec_4_reg[1] : (proc_4_data_FIFO_blk[1] | proc_4_data_PIPO_blk[1] | proc_4_start_FIFO_blk[1] | proc_4_TLF_FIFO_blk[1] | proc_4_input_sync_blk[1] | proc_4_output_sync_blk[1]);
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            proc_dep_vld_vec_4_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_4_reg <= proc_dep_vld_vec_4;
        end
    end
    assign in_chan_dep_vld_vec_4[0] = dep_chan_vld_3_4;
    assign in_chan_dep_data_vec_4[5 : 0] = dep_chan_data_3_4;
    assign token_in_vec_4[0] = token_3_4;
    assign in_chan_dep_vld_vec_4[1] = dep_chan_vld_5_4;
    assign in_chan_dep_data_vec_4[11 : 6] = dep_chan_data_5_4;
    assign token_in_vec_4[1] = token_5_4;
    assign dep_chan_vld_4_3 = out_chan_dep_vld_vec_4[0];
    assign dep_chan_data_4_3 = out_chan_dep_data_4;
    assign token_4_3 = token_out_vec_4[0];
    assign dep_chan_vld_4_5 = out_chan_dep_vld_vec_4[1];
    assign dep_chan_data_4_5 = out_chan_dep_data_4;
    assign token_4_5 = token_out_vec_4[1];

    // Process: grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.write_result_U0
    krnl_LZW_hls_deadlock_detect_unit #(6, 5, 5, 5) krnl_LZW_hls_deadlock_detect_unit_5 (
        .reset(reset),
        .clock(clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_5),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_5),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_5),
        .token_in_vec(token_in_vec_5),
        .dl_detect_in(dl_detect_out),
        .origin(origin[5]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_5),
        .out_chan_dep_data(out_chan_dep_data_5),
        .token_out_vec(token_out_vec_5),
        .dl_detect_out(dl_in_vec[5]));

    assign proc_5_data_FIFO_blk[0] = 1'b0 | (~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.write_result_U0.send_data_blk_n) | (~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.write_result_U0.i_1_blk_n) | (~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.write_result_U0.output_length_blk_n);
    assign proc_5_data_PIPO_blk[0] = 1'b0;
    assign proc_5_start_FIFO_blk[0] = 1'b0;
    assign proc_5_TLF_FIFO_blk[0] = 1'b0;
    assign proc_5_input_sync_blk[0] = 1'b0;
    assign proc_5_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_5[0] = dl_detect_out ? proc_dep_vld_vec_5_reg[0] : (proc_5_data_FIFO_blk[0] | proc_5_data_PIPO_blk[0] | proc_5_start_FIFO_blk[0] | proc_5_TLF_FIFO_blk[0] | proc_5_input_sync_blk[0] | proc_5_output_sync_blk[0]);
    assign proc_5_data_FIFO_blk[1] = 1'b0 | (~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.write_result_U0.outStream_code_flg_blk_n) | (~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.write_result_U0.outStream_code_blk_n);
    assign proc_5_data_PIPO_blk[1] = 1'b0;
    assign proc_5_start_FIFO_blk[1] = 1'b0;
    assign proc_5_TLF_FIFO_blk[1] = 1'b0;
    assign proc_5_input_sync_blk[1] = 1'b0;
    assign proc_5_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_5[1] = dl_detect_out ? proc_dep_vld_vec_5_reg[1] : (proc_5_data_FIFO_blk[1] | proc_5_data_PIPO_blk[1] | proc_5_start_FIFO_blk[1] | proc_5_TLF_FIFO_blk[1] | proc_5_input_sync_blk[1] | proc_5_output_sync_blk[1]);
    assign proc_5_data_FIFO_blk[2] = 1'b0;
    assign proc_5_data_PIPO_blk[2] = 1'b0;
    assign proc_5_start_FIFO_blk[2] = 1'b0;
    assign proc_5_TLF_FIFO_blk[2] = 1'b0;
    assign proc_5_input_sync_blk[2] = 1'b0 | (grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.ap_sync_write_result_U0_ap_ready & grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.write_result_U0.ap_idle & ~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.ap_sync_dataflow_in_loop_VITIS_LOOP_346_2_entry3_U0_ap_ready);
    assign proc_5_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_5[2] = dl_detect_out ? proc_dep_vld_vec_5_reg[2] : (proc_5_data_FIFO_blk[2] | proc_5_data_PIPO_blk[2] | proc_5_start_FIFO_blk[2] | proc_5_TLF_FIFO_blk[2] | proc_5_input_sync_blk[2] | proc_5_output_sync_blk[2]);
    assign proc_5_data_FIFO_blk[3] = 1'b0;
    assign proc_5_data_PIPO_blk[3] = 1'b0;
    assign proc_5_start_FIFO_blk[3] = 1'b0;
    assign proc_5_TLF_FIFO_blk[3] = 1'b0;
    assign proc_5_input_sync_blk[3] = 1'b0 | (grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.ap_sync_write_result_U0_ap_ready & grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.write_result_U0.ap_idle & ~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.ap_sync_Block_entry_proc_proc_U0_ap_ready);
    assign proc_5_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_5[3] = dl_detect_out ? proc_dep_vld_vec_5_reg[3] : (proc_5_data_FIFO_blk[3] | proc_5_data_PIPO_blk[3] | proc_5_start_FIFO_blk[3] | proc_5_TLF_FIFO_blk[3] | proc_5_input_sync_blk[3] | proc_5_output_sync_blk[3]);
    assign proc_5_data_FIFO_blk[4] = 1'b0;
    assign proc_5_data_PIPO_blk[4] = 1'b0;
    assign proc_5_start_FIFO_blk[4] = 1'b0;
    assign proc_5_TLF_FIFO_blk[4] = 1'b0;
    assign proc_5_input_sync_blk[4] = 1'b0 | (grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.ap_sync_write_result_U0_ap_ready & grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.write_result_U0.ap_idle & ~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.ap_sync_read_input_U0_ap_ready);
    assign proc_5_output_sync_blk[4] = 1'b0 | (ap_done_reg_1 & grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.write_result_U0.ap_done & ~grp_dataflow_parent_loop_proc_fu_183.dataflow_in_loop_VITIS_LOOP_346_2_U0.read_input_U0.ap_done);
    assign proc_dep_vld_vec_5[4] = dl_detect_out ? proc_dep_vld_vec_5_reg[4] : (proc_5_data_FIFO_blk[4] | proc_5_data_PIPO_blk[4] | proc_5_start_FIFO_blk[4] | proc_5_TLF_FIFO_blk[4] | proc_5_input_sync_blk[4] | proc_5_output_sync_blk[4]);
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            proc_dep_vld_vec_5_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_5_reg <= proc_dep_vld_vec_5;
        end
    end
    assign in_chan_dep_vld_vec_5[0] = dep_chan_vld_0_5;
    assign in_chan_dep_data_vec_5[5 : 0] = dep_chan_data_0_5;
    assign token_in_vec_5[0] = token_0_5;
    assign in_chan_dep_vld_vec_5[1] = dep_chan_vld_1_5;
    assign in_chan_dep_data_vec_5[11 : 6] = dep_chan_data_1_5;
    assign token_in_vec_5[1] = token_1_5;
    assign in_chan_dep_vld_vec_5[2] = dep_chan_vld_2_5;
    assign in_chan_dep_data_vec_5[17 : 12] = dep_chan_data_2_5;
    assign token_in_vec_5[2] = token_2_5;
    assign in_chan_dep_vld_vec_5[3] = dep_chan_vld_3_5;
    assign in_chan_dep_data_vec_5[23 : 18] = dep_chan_data_3_5;
    assign token_in_vec_5[3] = token_3_5;
    assign in_chan_dep_vld_vec_5[4] = dep_chan_vld_4_5;
    assign in_chan_dep_data_vec_5[29 : 24] = dep_chan_data_4_5;
    assign token_in_vec_5[4] = token_4_5;
    assign dep_chan_vld_5_1 = out_chan_dep_vld_vec_5[0];
    assign dep_chan_data_5_1 = out_chan_dep_data_5;
    assign token_5_1 = token_out_vec_5[0];
    assign dep_chan_vld_5_4 = out_chan_dep_vld_vec_5[1];
    assign dep_chan_data_5_4 = out_chan_dep_data_5;
    assign token_5_4 = token_out_vec_5[1];
    assign dep_chan_vld_5_0 = out_chan_dep_vld_vec_5[2];
    assign dep_chan_data_5_0 = out_chan_dep_data_5;
    assign token_5_0 = token_out_vec_5[2];
    assign dep_chan_vld_5_2 = out_chan_dep_vld_vec_5[3];
    assign dep_chan_data_5_2 = out_chan_dep_data_5;
    assign token_5_2 = token_out_vec_5[3];
    assign dep_chan_vld_5_3 = out_chan_dep_vld_vec_5[4];
    assign dep_chan_data_5_3 = out_chan_dep_data_5;
    assign token_5_3 = token_out_vec_5[4];


`include "krnl_LZW_hls_deadlock_report_unit.vh"
