#include <systemc>
#include <vector>
#include <iostream>
#include "hls_stream.h"
#include "ap_int.h"
#include "ap_fixed.h"
using namespace std;
using namespace sc_dt;
class AESL_RUNTIME_BC {
  public:
    AESL_RUNTIME_BC(const char* name) {
      file_token.open( name);
      if (!file_token.good()) {
        cout << "Failed to open tv file " << name << endl;
        exit (1);
      }
      file_token >> mName;//[[[runtime]]]
    }
    ~AESL_RUNTIME_BC() {
      file_token.close();
    }
    int read_size () {
      int size = 0;
      file_token >> mName;//[[transaction]]
      file_token >> mName;//transaction number
      file_token >> mName;//pop_size
      size = atoi(mName.c_str());
      file_token >> mName;//[[/transaction]]
      return size;
    }
  public:
    fstream file_token;
    string mName;
};
extern "C" void krnl_LZW(int*, int, int, int, int);
extern "C" void apatb_krnl_LZW_hw(volatile void * __xlx_apatb_param_input, volatile void * __xlx_apatb_param_input_length, volatile void * __xlx_apatb_param_send_data, volatile void * __xlx_apatb_param_output_length) {
  // Collect __xlx_input_input_length_send_data_output_length__tmp_vec
  vector<sc_bv<32> >__xlx_input_input_length_send_data_output_length__tmp_vec;
  for (int j = 0, e = 1; j != e; ++j) {
    __xlx_input_input_length_send_data_output_length__tmp_vec.push_back(((int*)__xlx_apatb_param_input)[j]);
  }
  int __xlx_size_param_input = 1;
  int __xlx_offset_param_input = 0;
  int __xlx_offset_byte_param_input = 0*4;
  for (int j = 0, e = 1; j != e; ++j) {
    __xlx_input_input_length_send_data_output_length__tmp_vec.push_back(((int*)__xlx_apatb_param_input_length)[j]);
  }
  int __xlx_size_param_input_length = 1;
  int __xlx_offset_param_input_length = 1;
  int __xlx_offset_byte_param_input_length = 1*4;
  for (int j = 0, e = 1; j != e; ++j) {
    __xlx_input_input_length_send_data_output_length__tmp_vec.push_back(((int*)__xlx_apatb_param_send_data)[j]);
  }
  int __xlx_size_param_send_data = 1;
  int __xlx_offset_param_send_data = 2;
  int __xlx_offset_byte_param_send_data = 2*4;
  for (int j = 0, e = 1; j != e; ++j) {
    __xlx_input_input_length_send_data_output_length__tmp_vec.push_back(((int*)__xlx_apatb_param_output_length)[j]);
  }
  int __xlx_size_param_output_length = 1;
  int __xlx_offset_param_output_length = 3;
  int __xlx_offset_byte_param_output_length = 3*4;
  int* __xlx_input_input_length_send_data_output_length__input_buffer= new int[__xlx_input_input_length_send_data_output_length__tmp_vec.size()];
  for (int i = 0; i < __xlx_input_input_length_send_data_output_length__tmp_vec.size(); ++i) {
    __xlx_input_input_length_send_data_output_length__input_buffer[i] = __xlx_input_input_length_send_data_output_length__tmp_vec[i].range(31, 0).to_uint64();
  }
  // DUT call
  krnl_LZW(__xlx_input_input_length_send_data_output_length__input_buffer, __xlx_offset_byte_param_input, __xlx_offset_byte_param_input_length, __xlx_offset_byte_param_send_data, __xlx_offset_byte_param_output_length);
// print __xlx_apatb_param_input
  sc_bv<32>*__xlx_input_output_buffer = new sc_bv<32>[__xlx_size_param_input];
  for (int i = 0; i < __xlx_size_param_input; ++i) {
    __xlx_input_output_buffer[i] = __xlx_input_input_length_send_data_output_length__input_buffer[i+__xlx_offset_param_input];
  }
  for (int i = 0; i < __xlx_size_param_input; ++i) {
    ((int*)__xlx_apatb_param_input)[i] = __xlx_input_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_input_length
  sc_bv<32>*__xlx_input_length_output_buffer = new sc_bv<32>[__xlx_size_param_input_length];
  for (int i = 0; i < __xlx_size_param_input_length; ++i) {
    __xlx_input_length_output_buffer[i] = __xlx_input_input_length_send_data_output_length__input_buffer[i+__xlx_offset_param_input_length];
  }
  for (int i = 0; i < __xlx_size_param_input_length; ++i) {
    ((int*)__xlx_apatb_param_input_length)[i] = __xlx_input_length_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_send_data
  sc_bv<32>*__xlx_send_data_output_buffer = new sc_bv<32>[__xlx_size_param_send_data];
  for (int i = 0; i < __xlx_size_param_send_data; ++i) {
    __xlx_send_data_output_buffer[i] = __xlx_input_input_length_send_data_output_length__input_buffer[i+__xlx_offset_param_send_data];
  }
  for (int i = 0; i < __xlx_size_param_send_data; ++i) {
    ((int*)__xlx_apatb_param_send_data)[i] = __xlx_send_data_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_output_length
  sc_bv<32>*__xlx_output_length_output_buffer = new sc_bv<32>[__xlx_size_param_output_length];
  for (int i = 0; i < __xlx_size_param_output_length; ++i) {
    __xlx_output_length_output_buffer[i] = __xlx_input_input_length_send_data_output_length__input_buffer[i+__xlx_offset_param_output_length];
  }
  for (int i = 0; i < __xlx_size_param_output_length; ++i) {
    ((int*)__xlx_apatb_param_output_length)[i] = __xlx_output_length_output_buffer[i].to_uint64();
  }
}
