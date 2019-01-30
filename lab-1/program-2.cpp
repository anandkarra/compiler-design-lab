#include <bits/stdc++.h>

using namespace std;

int main(){
	ifstream infile;
	infile.open("in.cpp");
	
	string line;
	int numLines=0;
	while(getline(infile,line)){
		numLines++;
	}
	infile.close();
	cout << "No. of lines in input file= " << numLines << endl;
	return 0;
}
