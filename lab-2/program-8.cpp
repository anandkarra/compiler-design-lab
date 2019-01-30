#include <bits/stdc++.h>

#define mp make_pair

using namespace std;

unordered_map<string,int> ops={mp("+",0),mp("-",1),
                                     mp("*",2),mp("/",3),
                                     mp("%",4),mp("++",5),
                                     mp("--",6),mp("=",7),
                                     mp("+=",8),mp("-=",9),
                                     mp("*=",10),mp("/=",11),
                                     mp("%=",12),mp("==",13),
                                     mp(">",14),mp("<",15),
                                     mp("!=",16),mp(">=",17),
                                     mp("<=",18),mp("&&",19),
                                     mp("||",20),mp("!",21),
                                     mp("&",22),mp("|",23),
                                     mp("^",24),mp("~",25),
                                     mp("<<",26),mp(">>",27)};

void isValid(string id){
    if(ops.find(id) == ops.end()){
        cout << "Invalid operator entered." << endl;
        return ;
    }
    else{
        cout << "Operator " << id << " found at: " << ops[id] << endl;
        return ;
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