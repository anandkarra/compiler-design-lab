#include <bits/stdc++.h>

using namespace std;

int main(){
	ifstream infile;
	infile.open("in.cpp");
	ofstream outfile;
	outfile.open("copy_in.cpp");

	while(!infile.eof()){
		string line;
		getline(infile,line);
		line+="\n";
		outfile << line;
	}
		
	infile.close();
	outfile.close();
	return 0;
}
