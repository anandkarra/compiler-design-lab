#include <bits/stdc++.h>

using namespace std;

bool isValid(string id){
    return (id[0]<'A' || id[0]>'z');
}

int main(){

    unordered_map<string,int> mp;
    int location=0;

    while(1){
        cout << "\n---Do you want to exit program(0/1)?---\n";
        bool run;
        cin >> run;
        
        if(run)
            break;

        string idtf;
        cout << "Enter identifier:\n";
        cin >> idtf;
        while(isValid(idtf)){
            cout << "Invalid identifier entered. Re-enter identifier:\n";
            cin >> idtf;
        }

        if(mp.find(idtf) == mp.end()){
            cout << "[NOT FOUND]\tEntered identifier not found in symbol table. Inserting...\n";
            mp.insert(make_pair(idtf,location));
            cout << "[INSERTED]\tIdentifier inserted at: " << mp[idtf] << endl;
            location++;
        }
        else{
            cout << "[FOUND]\tIdentifier found at: " << mp[idtf] << endl;
        }
    }
    return 0;
}