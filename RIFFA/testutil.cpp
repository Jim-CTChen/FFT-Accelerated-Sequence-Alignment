// ----------------------------------------------------------------------
// Copyright (c) 2016, The Regents of the University of California All
// rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are
// met:
// 
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
// 
//     * Redistributions in binary form must reproduce the above
//       copyright notice, this list of conditions and the following
//       disclaimer in the documentation and/or other materials provided
//       with the distribution.
// 
//     * Neither the name of The Regents of the University of California
//       nor the names of its contributors may be used to endorse or
//       promote products derived from this software without specific
//       prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL REGENTS OF THE
// UNIVERSITY OF CALIFORNIA BE LIABLE FOR ANY DIRECT, INDIRECT,
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
// BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
// OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
// TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
// USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
// DAMAGE.
// ----------------------------------------------------------------------
#include <stdlib.h>
#include <stdio.h>
#include <iostream>
#include "timer.h"
#include "riffa.h"
#include <algorithm>
#include <bitset>
#include <cstdlib>
#include <ctime>
#include <cmath>
#include <vector>
#include <string>
#include <sstream>
#include <fstream>
#include <bits/stdc++.h>
#include <sys/time.h>
#include "omp.h"

/*    std::string binary = std::bitset<8>(128).to_string(); //to binary
    std::cout<<binary<<"\n";

    unsigned long decimal = std::bitset<8>(binary).to_ulong();
    std::cout<<decimal<<"\n";*/

using namespace std;

int float_to_bits(float f)
{
	return bitset<sizeof f*8>(*(long unsigned int*)(&f)).to_ulong();
}

string float_to_str(float f)
{
	return bitset<sizeof f*8>(*(long unsigned int*)(&f)).to_string();
}


void ErrorStat(int* diff_vec, int* ref_vec, int size);


int main(int argc, char** argv) {
	fpga_t * fpga;
	fpga_info_list info;
	int option;
	int i;
	int id;
	int chnl;
	int sent;
	int recvd;
	unsigned int * sendBuffer;
	unsigned int * recvBuffer;
	GET_TIME_INIT(3);
	srand(time(NULL));

	if (argc < 2) {
		printf("Usage: %s <option>\n", argv[0]);
		return -1;
	}

	option = atoi(argv[1]);

	if (option == 0) {	// List FPGA info
		// Populate the fpga_info_list struct
		if (fpga_list(&info) != 0) {
			printf("Error populating fpga_info_list\n");
			return -1;
		}
		printf("Number of devices: %d\n", info.num_fpgas);
		for (i = 0; i < info.num_fpgas; i++) {
			printf("%d: id:%d\n", i, info.id[i]);
			printf("%d: num_chnls:%d\n", i, info.num_chnls[i]);
			printf("%d: name:%s\n", i, info.name[i]);
			printf("%d: vendor id:%04X\n", i, info.vendor_id[i]);
			printf("%d: device id:%04X\n", i, info.device_id[i]);
		}
	}
	else if (option == 1) { // Reset FPGA
		if (argc < 3) {
			printf("Usage: %s %d <fpga id>\n", argv[0], option);
			return -1;
		}

		id = atoi(argv[2]);

		// Get the device with id
		fpga = fpga_open(id);
		if (fpga == NULL) {
			printf("Could not get FPGA %d\n", id);
			return -1;
	    }

		// Reset
		fpga_reset(fpga);

		// Done with device
        fpga_close(fpga);
	}
	else if (option == 2) { // Send data, receive data

		
		//int numData	= min(65536, atoi(argv[2])); //65536;//atoi(argv[4]);
		id 		= 0;//atoi(argv[2]);
		chnl 	= 0;// atoi(argv[3]);
		
		struct  timeval t_start;
		struct  timeval t_end;

		ifstream d1("./data0/ref.txt");

		
		// Get the device with id
		fpga = fpga_open(id);
		if (fpga == NULL) {
			printf("Could not get FPGA %d\n", id);
			return -1;
	    }

		
		//int* input_memory   = new int [numData];
		//int* receive_memory = new int [numData];
		//int* golden_output  = new int [numData];

		///////////////// INPUT PATTERN //////////////////
		string line;
		string temp_str;
		
		int cnt_seq_start = 0; // start from which sequence //////////////////////////////////////////////////////////////////////////////////////////
		int num_of_seq = 200; // How many sequences input
		int numRecv = 1000;

    	int seq_max = cnt_seq_start + num_of_seq ;
		int i,j;
		string ref_file_name;
		string qry_file_name;
		string file_path = "./test";
		vector<int> ref_buffer,qry_buffer,gold_buffer;
		int* ref_len_buffer   = new int [num_of_seq];
		int* qry_len_buffer   = new int [num_of_seq];
		int* max_len_buffer   = new int [num_of_seq];
		int total_pair_ref = 0;
		int total_pair_qry = 0;
		int total_pair_max = 0;
		int* golden_output  = new int [num_of_seq];
		int cnt_seq;
		
	
		for (cnt_seq = cnt_seq_start ; cnt_seq < seq_max ; cnt_seq = cnt_seq + 1){
			// read ref file
			ref_file_name = file_path + to_string(cnt_seq) + "/ref.txt";
			ifstream ref_file (ref_file_name);
			int len_ref;
			if (ref_file.is_open())
			{
				getline (ref_file, temp_str);
				std::size_t endPos = temp_str.find(" ");
				len_ref = stoi(temp_str.substr(0,endPos) , 0 , 2);
				//cout << "There are " << len_ref << " pairs in ref sequence " <<  cnt_seq << endl;
				//int* ref_buffer   = new int [len_ref];
				ref_len_buffer[cnt_seq - cnt_seq_start] = len_ref;

				while (getline(ref_file,temp_str)){
					//ref_buffer[counter] = stoi(temp_str.substr(0,5) , 0 , 2);
					ref_buffer.push_back(stoi(temp_str.substr(0,5) , 0 , 2));
				}

				ref_file.close();
			}
			else cout << "Unable to open ref file: " << ref_file_name << endl; 
			total_pair_ref = total_pair_ref + len_ref;
			

			// read qry file
			qry_file_name = file_path + to_string(cnt_seq) + "/qry.txt";
			ifstream qry_file (qry_file_name);
			int len_qry;
			if (qry_file.is_open())
			{
				getline (qry_file, temp_str);
				std::size_t endPos = temp_str.find(" ");
				len_qry = stoi(temp_str.substr(0,endPos) , 0 , 2);
				//cout << "There are " << len_qry << " pairs in qry sequence " << cnt_seq << endl;
				//int* qry_buffer   = new int [len_qry];
				qry_len_buffer[cnt_seq - cnt_seq_start] = len_qry;

				while (getline(qry_file,temp_str)){
					//qry_buffer[counter] = stoi(temp_str.substr(0,5) , 0 , 2);
					qry_buffer.push_back(stoi(temp_str.substr(0,5) , 0 , 2));
				}

				qry_file.close();
			}
			else cout << "Unable to open qry file: " << qry_file_name << endl; 
			total_pair_qry = total_pair_qry + len_qry;

			max_len_buffer[cnt_seq - cnt_seq_start] = max(len_ref,len_qry);
			total_pair_max = total_pair_max + max_len_buffer[cnt_seq - cnt_seq_start];

			ifstream gold_file (file_path + to_string(cnt_seq) + "/golden.txt");
			if (gold_file.is_open())
			{
				getline (gold_file, temp_str);
				gold_buffer.push_back(stoi(temp_str.substr(0,16) , 0 , 2));
				//cout << stoi(temp_str.substr(0,16) , 0 , 2) << endl;
			}
			else cout << "Unable to open gold file: " << cnt_seq << endl;

			//cnt_seq = cnt_seq + 1;
		}
		//cout << total_pair_ref << endl;
		//cout << total_pair_qry << endl;
		for (i=0 ; i<num_of_seq ; i=i+1){
			golden_output[i] = gold_buffer[i];
		}

		int numData = total_pair_max + 1 + num_of_seq; 
		int remain = numData % 4;
		//numData += (4-remain);
		
		
		int* input_memory   = new int [numData];
		//int* receive_memory = new int [num_of_seq];
		int* receive_memory = new int [numRecv];

		for (i=0 ; i<numData ; i=i+1){
			input_memory[i] = 0; //initialize
		}

		//load parameter
		input_memory[0] += num_of_seq;
		input_memory[0] += 18 * pow(2,19); //threshold
		input_memory[0] += 17 * pow(2,26); //window

		int cnt_pos = 1; //load ref/qry seq
		int cnt_ref = 0;
		int cnt_qry = 0;
		for (i=0 ; i<num_of_seq ; i=i+1){
			input_memory[cnt_pos] = (ref_len_buffer[i] * pow(2,22) + qry_len_buffer[i] * pow(2,12) + pow(2,21) - pow(2,31)); //2's complement
			//cout << bitset<32>(input_memory[cnt_pos]) << endl;

			for (j=0 ; j<max_len_buffer[i] ; j=j+1){
				if (j < ref_len_buffer[i]){
					input_memory[j + cnt_pos] += (ref_buffer[cnt_ref] * pow(2,6)) + pow(2,11);
					cnt_ref = cnt_ref + 1;
				} else {
					input_memory[j + cnt_pos] += 0;
				}

				if (j < qry_len_buffer[i]){
					input_memory[j + cnt_pos] += (qry_buffer[cnt_qry]) + pow(2,5);
					cnt_qry = cnt_qry + 1;
				} else {
					input_memory[j + cnt_pos] += 0;
				}

			}
			input_memory[j + cnt_pos] += (pow(2,12) - 1); // End protocol
			cnt_pos += (max_len_buffer[i] + 1);

			
			
		}
		// 32 bit add to 128 bit
		int* input_memory_extend   = new int [numData*4];
		for (i=0 ; i<(numData*4) ; i+=1) {
			
			if ((i%4) == 0){
				input_memory_extend[i] = input_memory[i/4];
			} else {
				input_memory_extend[i] = 0;
			}
		}
		
		///////////////////////////////////////////////

		int r_offset = 0;	// rOff in chnl_test.v
/*
		for (i=0 ; i<numData ; i=i+1){
			cout << "[" << i << "]: " << bitset<32>(input_memory[i]) << endl;
		}
*/
		for (i=0 ; i<num_of_seq ; i=i+1){
			cout << "seq" << i << "length=" << ref_len_buffer[i] <<" / "<< qry_len_buffer[i] << endl;
		}
		cout << "<" << bitset<32>(input_memory[0]) << ">" << endl << endl;
/*
		for (i=0 ; i<numData*4 ; i=i+1){
			cout << i << " : " << bitset<32>(input_memory_extend[i]) << endl;
		}*/
		cout<<numData*4<<" datas total" << endl;

		cout<<"Start sending data ..."<<endl;
		cout<<endl;
		
		//===============================SEND====================================//
		//fpga_reset(fpga);
		
		GET_TIME_VAL(1);
		sent = fpga_send(fpga, chnl, input_memory_extend, numData*4, r_offset, 1, 25000); // 128 bit input

		cout << "finish sending data ..." << endl;
		cout << "start recving data..." << endl;
		
		recvd = fpga_recv(fpga, chnl, receive_memory, numRecv, 25000);
		GET_TIME_VAL(2);

		cout << "finish recving data..." << endl;
		
		
		//=======================================================================//
		// Reset
		fpga_reset(fpga);
		// Done with device
        fpga_close(fpga);
		int golden;
		// Display some data
		int rcv_error = 0;
		for (i = 0; i < numRecv ; i++) 
		{
			if (i%4 == 0){
				if (i/4 <= num_of_seq + 1){
					if (golden_output[i/4 - 1] >= 65536/2){
						golden = -(65536 - golden_output[i/4 - 1]);
					} else{
						golden = golden_output[i/4 - 1];
					}
					if (i/4 == 0){
						cout << "/////first receive is invalid (due to buffer fetching)/////" << endl;
					} else {
						cout << "///// data # "<< i/4 - 1 << "-> golden: " << golden <<" /////" << endl;
						if (receive_memory[i] == golden_output[i/4 - 1]){
							cout << "------------correct-------------" << endl;
						} else{
							cout << "XXXXXXXXXXXXXfailXXXXXXXXXXXXXXX" << endl;
							rcv_error += 1;
						}

					}
				}
				if (receive_memory[i] >= 65536/2){
					cout<<"recvBuffer["<<i<<"]: "<<-(65536 - receive_memory[i]) <<" // "<< bitset<32>(receive_memory[i])<<endl;
				} else {
					cout<<"recvBuffer["<<i<<"]: "<<receive_memory[i] <<" // "<< bitset<32>(receive_memory[i])<<endl;
				}
			}
			/*
			if (receive_memory[i] >= 65536/2){
				cout<<"recvBuffer["<<i<<"]: "<<-(65536 - receive_memory[i]) <<" // "<< bitset<32>(receive_memory[i])<<endl;
			} else {
				cout<<"recvBuffer["<<i<<"]: "<<receive_memory[i] <<" // "<< bitset<32>(receive_memory[i])<<endl;
			}
			*/
			
		}
		printf("\n");
		
		cout<<"Sent    Data (words) = "<<sent<<endl;
		cout<<"Receive Data (words) = "<<recvd<<endl;
		cout <<"Total data: " << num_of_seq << "/ total error: " << rcv_error << endl;
		//all_sent *= 4.0;
		
		// Check the data
		/*
		if (recvd != 0) {
			ErrorStat(receive_memory, golden_output, numData);
			//float ms = 1000*(end-start);//1000*(t_end.tv_sec-t_start.tv_sec)+0.001*(t_end.tv_usec-t_start.tv_usec);
			
			printf("FPGA send bw: %f MB/s %fms\n",
				sent*4.0/1024/1024/(fpga_ms/1000.0), (fpga_ms ));
		}
		*/
	}

	return 0;
}

//=============================================================================================================================//

