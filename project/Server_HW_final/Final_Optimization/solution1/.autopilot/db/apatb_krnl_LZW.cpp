#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;

// wrapc file define:
#define AUTOTB_TVIN_aximm0 "../tv/cdatafile/c.krnl_LZW.autotvin_aximm0.dat"
#define AUTOTB_TVOUT_aximm0 "../tv/cdatafile/c.krnl_LZW.autotvout_aximm0.dat"
// wrapc file define:
#define AUTOTB_TVIN_input "../tv/cdatafile/c.krnl_LZW.autotvin_input_r.dat"
#define AUTOTB_TVOUT_input "../tv/cdatafile/c.krnl_LZW.autotvout_input_r.dat"
// wrapc file define:
#define AUTOTB_TVIN_input_length "../tv/cdatafile/c.krnl_LZW.autotvin_input_length.dat"
#define AUTOTB_TVOUT_input_length "../tv/cdatafile/c.krnl_LZW.autotvout_input_length.dat"
// wrapc file define:
#define AUTOTB_TVIN_send_data "../tv/cdatafile/c.krnl_LZW.autotvin_send_data.dat"
#define AUTOTB_TVOUT_send_data "../tv/cdatafile/c.krnl_LZW.autotvout_send_data.dat"
// wrapc file define:
#define AUTOTB_TVIN_output_length "../tv/cdatafile/c.krnl_LZW.autotvin_output_length.dat"
#define AUTOTB_TVOUT_output_length "../tv/cdatafile/c.krnl_LZW.autotvout_output_length.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_aximm0 "../tv/rtldatafile/rtl.krnl_LZW.autotvout_aximm0.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_input "../tv/rtldatafile/rtl.krnl_LZW.autotvout_input_r.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_input_length "../tv/rtldatafile/rtl.krnl_LZW.autotvout_input_length.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_send_data "../tv/rtldatafile/rtl.krnl_LZW.autotvout_send_data.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_output_length "../tv/rtldatafile/rtl.krnl_LZW.autotvout_output_length.dat"

class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  aximm0_depth = 0;
  input_depth = 0;
  input_length_depth = 0;
  send_data_depth = 0;
  output_length_depth = 0;
  trans_num =0;
}
~INTER_TCL_FILE() {
  mFile.open(mName);
  if (!mFile.good()) {
    cout << "Failed to open file ref.tcl" << endl;
    exit (1); 
  }
  string total_list = get_depth_list();
  mFile << "set depth_list {\n";
  mFile << total_list;
  mFile << "}\n";
  mFile << "set trans_num "<<trans_num<<endl;
  mFile.close();
}
string get_depth_list () {
  stringstream total_list;
  total_list << "{aximm0 " << aximm0_depth << "}\n";
  total_list << "{input_r " << input_depth << "}\n";
  total_list << "{input_length " << input_length_depth << "}\n";
  total_list << "{send_data " << send_data_depth << "}\n";
  total_list << "{output_length " << output_length_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int aximm0_depth;
    int input_depth;
    int input_length_depth;
    int send_data_depth;
    int output_length_depth;
    int trans_num;
  private:
    ofstream mFile;
    const char* mName;
};

static void RTLOutputCheckAndReplacement(std::string &AESL_token, std::string PortName) {
  bool no_x = false;
  bool err = false;

  no_x = false;
  // search and replace 'X' with '0' from the 3rd char of token
  while (!no_x) {
    size_t x_found = AESL_token.find('X', 0);
    if (x_found != string::npos) {
      if (!err) { 
        cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port" 
             << PortName << ", possible cause: There are uninitialized variables in the C design."
             << endl; 
        err = true;
      }
      AESL_token.replace(x_found, 1, "0");
    } else
      no_x = true;
  }
  no_x = false;
  // search and replace 'x' with '0' from the 3rd char of token
  while (!no_x) {
    size_t x_found = AESL_token.find('x', 2);
    if (x_found != string::npos) {
      if (!err) { 
        cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' on port" 
             << PortName << ", possible cause: There are uninitialized variables in the C design."
             << endl; 
        err = true;
      }
      AESL_token.replace(x_found, 1, "0");
    } else
      no_x = true;
  }
}
extern "C" void krnl_LZW_hw_stub_wrapper(volatile void *, volatile void *, volatile void *, volatile void *);

extern "C" void apatb_krnl_LZW_hw(volatile void * __xlx_apatb_param_input, volatile void * __xlx_apatb_param_input_length, volatile void * __xlx_apatb_param_send_data, volatile void * __xlx_apatb_param_output_length) {
  refine_signal_handler();
  fstream wrapc_switch_file_token;
  wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
  int AESL_i;
  if (wrapc_switch_file_token.good())
  {

    CodeState = ENTER_WRAPC_PC;
    static unsigned AESL_transaction_pc = 0;
    string AESL_token;
    string AESL_num;{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_aximm0);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<64> > aximm0_pc_buffer(4);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "aximm0");
  
            // push token into output port buffer
            if (AESL_token != "") {
              aximm0_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 1; j < e; j += 1, ++i) {
            ((long long*)__xlx_apatb_param_input)[j] = aximm0_pc_buffer[i].to_int64();
          }
            for (int j = 0, e = 1; j < e; j += 1, ++i) {
            ((long long*)__xlx_apatb_param_input_length)[j] = aximm0_pc_buffer[i].to_int64();
          }
            for (int j = 0, e = 1; j < e; j += 1, ++i) {
            ((long long*)__xlx_apatb_param_send_data)[j] = aximm0_pc_buffer[i].to_int64();
          }
            for (int j = 0, e = 1; j < e; j += 1, ++i) {
            ((long long*)__xlx_apatb_param_output_length)[j] = aximm0_pc_buffer[i].to_int64();
          }}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
    AESL_transaction_pc++;
    return ;
  }
static unsigned AESL_transaction;
static AESL_FILE_HANDLER aesl_fh;
static INTER_TCL_FILE tcl_file(INTER_TCL);
std::vector<char> __xlx_sprintf_buffer(1024);
CodeState = ENTER_WRAPC;
//aximm0
aesl_fh.touch(AUTOTB_TVIN_aximm0);
aesl_fh.touch(AUTOTB_TVOUT_aximm0);
//input
aesl_fh.touch(AUTOTB_TVIN_input);
aesl_fh.touch(AUTOTB_TVOUT_input);
//input_length
aesl_fh.touch(AUTOTB_TVIN_input_length);
aesl_fh.touch(AUTOTB_TVOUT_input_length);
//send_data
aesl_fh.touch(AUTOTB_TVIN_send_data);
aesl_fh.touch(AUTOTB_TVOUT_send_data);
//output_length
aesl_fh.touch(AUTOTB_TVIN_output_length);
aesl_fh.touch(AUTOTB_TVOUT_output_length);
CodeState = DUMP_INPUTS;
unsigned __xlx_offset_byte_param_input = 0;
unsigned __xlx_offset_byte_param_input_length = 0;
unsigned __xlx_offset_byte_param_send_data = 0;
unsigned __xlx_offset_byte_param_output_length = 0;
// print aximm0 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_aximm0, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_input = 0*8;
  if (__xlx_apatb_param_input) {
    for (int j = 0  - 0, e = 1 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_input)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_aximm0, __xlx_sprintf_buffer.data()); 
      }
  }
  __xlx_offset_byte_param_input_length = 1*8;
  if (__xlx_apatb_param_input_length) {
    for (int j = 0  - 0, e = 1 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_input_length)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_aximm0, __xlx_sprintf_buffer.data()); 
      }
  }
  __xlx_offset_byte_param_send_data = 2*8;
  if (__xlx_apatb_param_send_data) {
    for (int j = 0  - 0, e = 1 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_send_data)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_aximm0, __xlx_sprintf_buffer.data()); 
      }
  }
  __xlx_offset_byte_param_output_length = 3*8;
  if (__xlx_apatb_param_output_length) {
    for (int j = 0  - 0, e = 1 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_output_length)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_aximm0, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(4, &tcl_file.aximm0_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_aximm0, __xlx_sprintf_buffer.data());
}
// print input Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_input, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv = __xlx_offset_byte_param_input;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_input, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.input_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_input, __xlx_sprintf_buffer.data());
}
// print input_length Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_input_length, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv = __xlx_offset_byte_param_input_length;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_input_length, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.input_length_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_input_length, __xlx_sprintf_buffer.data());
}
// print send_data Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_send_data, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv = __xlx_offset_byte_param_send_data;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_send_data, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.send_data_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_send_data, __xlx_sprintf_buffer.data());
}
// print output_length Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_output_length, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv = __xlx_offset_byte_param_output_length;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_output_length, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.output_length_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_output_length, __xlx_sprintf_buffer.data());
}
CodeState = CALL_C_DUT;
krnl_LZW_hw_stub_wrapper(__xlx_apatb_param_input, __xlx_apatb_param_input_length, __xlx_apatb_param_send_data, __xlx_apatb_param_output_length);
CodeState = DUMP_OUTPUTS;
// print aximm0 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_aximm0, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_input = 0*8;
  if (__xlx_apatb_param_input) {
    for (int j = 0  - 0, e = 1 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_input)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_aximm0, __xlx_sprintf_buffer.data()); 
      }
  }
  __xlx_offset_byte_param_input_length = 1*8;
  if (__xlx_apatb_param_input_length) {
    for (int j = 0  - 0, e = 1 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_input_length)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_aximm0, __xlx_sprintf_buffer.data()); 
      }
  }
  __xlx_offset_byte_param_send_data = 2*8;
  if (__xlx_apatb_param_send_data) {
    for (int j = 0  - 0, e = 1 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_send_data)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_aximm0, __xlx_sprintf_buffer.data()); 
      }
  }
  __xlx_offset_byte_param_output_length = 3*8;
  if (__xlx_apatb_param_output_length) {
    for (int j = 0  - 0, e = 1 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_output_length)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_aximm0, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(4, &tcl_file.aximm0_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_aximm0, __xlx_sprintf_buffer.data());
}
CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
