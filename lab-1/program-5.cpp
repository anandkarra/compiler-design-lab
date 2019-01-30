#include <bits/stdc++.h>

using namespace std;

int main(){
	ifstream infile;
	infile.open("in.cpp");
	
	int numComSingle=0,numComMulti=0;
	if(infile.is_open()){
		while(!infile.eof()){
			string line;
			infile >> line;
			
			for(int i=0;i<line.length();i++){
				if(i<line.length()-1 && line[i]=='/' && line[i+1]=='/')
					numComSingle++;
				if(i<line.length()-1 && line[i]=='/' && line[i+1]=='*')
					numComMulti++;
			}
		}
	}
	infile.close();
	
	cout << "No. of single-line comments= " << numComSingle << endl;
	cout << "No. of multi-line comments = " << numComMulti << endl;
	
	return 0;
}
