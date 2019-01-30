#include <bits/stdc++.h>

using namespace std;

int main(){
	ifstream infile;
	infile.open("in.cpp");
	ofstream outfile;
	outfile.open("out.cpp");
	
	if(infile.is_open()){
		while(!infile.eof()){
			string line;
			infile >> line;
			outfile << line;
		}
	}
	infile.close();
	outfile.close();
	return 0;
}
