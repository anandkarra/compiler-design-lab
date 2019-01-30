#include <bits/stdc++.h>

using namespace std;

int main(){
	ifstream infile;
	infile.open("in.cpp");
	
	int numOps=0;
	if(infile.is_open()){
		while(!infile.eof()){
			string line;
			infile >> line;

			for(int i=0;i<line.length();i++){
				if(i<line.length()-1 && line[i]=='/' && line[i+1]=='/')
					i+=2;
				if(i<line.length()-1 && line[i]=='/' && line[i+1]=='*')
					i+=2;
				if(i<line.length()-1 && line[i]=='+' && line[i+1]!='=' && line[i+1]!='+')
					numOps++;
				if(i<line.length()-1 && line[i]=='-' && line[i+1]!='=' && line[i+1]!='-')
					numOps++;
				if(i<line.length()-1 && line[i]=='*' && line[i+1]!='=')
					numOps++;
				if(i<line.length()-1 && line[i]=='/' && line[i+1]!='=' && line[i+1]!='/' && line[i+1]!='*')
					numOps++;
			}
		}
	}
	infile.close();
	
	cout << "No. of operators(+,-,*,/,%) in input file= " << numOps << endl;
	
	return 0;
}
