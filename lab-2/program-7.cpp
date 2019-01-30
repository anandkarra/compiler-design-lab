#include <bits/stdc++.h>

#define mp make_pair

using namespace std;

int addr=31;

unordered_map<string,int> kwrds={mp("auto",0),mp("break",1),
                                     mp("case",2),mp("char",3),
                                     mp("const",4),mp("continue",5),
                                     mp("default",6),mp("do",7),
                                     mp("double",8),mp("else",9),
                                     mp("enum",10),mp("extern",11),
                                     mp("float",12),mp("for",13),
                                     mp("goto",14),mp("if",15),
                                     mp("int",16),mp("long",17),
                                     mp("register",17),mp("return",18),
                                     mp("short",19),mp("signed",20),
                                     mp("sizeof",21),mp("static",22),
                                     mp("struct",23),mp("switch",24),
                                     mp("typedef",25),mp("union",26),
                                     mp("unsigned",27),mp("void",28),
                                     mp("volatile",29),mp("while",30)};

void isValid(string id){
    if(id[0] < 'A' || id[0] > 'z'){
        cout << "Invalid keyword entered." << endl;
        return ;
    }
    else{
        if(kwrds.find(id) == kwrds.end()){
            cout << "Added keyword to symbol table.\n";
            kwrds.insert(mp(id,addr));
            cout << "Keyword \"" << id << "\" inserted at: " << kwrds[id] << endl;
            addr++;
            return ;
        }
        else{
            cout << "Keyword " << id << " found at: " << kwrds[id] << endl;
            return ;
        }
    }
}

int main(){

    unordered_map<string,int> mp;

    while(1){
        cout << "\n---Do you want to exit program(0/1)?---\n";
        bool run;
        cin >> run;
        
        if(run)
            break;
        cout << "Enter the keyword: ";
        string inp;
        cin >> inp;

        isValid(inp);
    }
    return 0;
}