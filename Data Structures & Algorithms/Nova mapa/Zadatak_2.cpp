#include <iostream>
#include <queue>
#include <vector>
#include <fstream>
#include <string>
#include <algorithm>
using namespace std;


//(i,j) su pozicije od koje pocinjemo, a primamo nas labirint po referenci
void bfs(vector<string> &s,int i, int j){
    int a = i, b = j;
    pair<int,int> S(i,j);
    pair<int,int> temp;
    queue<pair<int,int>> Q;
    Q.push(S);
    while(!Q.empty()){
        a = Q.front().first;
        b = Q.front().second;
        Q.pop();
        //provjeravamo jesu li susjedni nodeovi prazni, ako da stavi ih na queue da se obrade
        //ako nisu prazni obojamo ih s '#'
        if(s[a][b-1] == ' '){
            temp = make_pair(a,b-1);
            Q.push(temp);
        }
        if(s[a][b+1] == ' '){
            temp = make_pair(a,b+1);
            Q.push(temp);
        }
        if(s[a-1][b] == ' '){
            temp = make_pair(a-1,b);
            Q.push(temp);
        }
        if(s[a+1][b] == ' '){
            temp = make_pair(a+1,b);
            Q.push(temp);
        }
        s[a][b] = '#';
    }

}


int main() {
    int n; cin >> n;

    for(int i = 0;i < n;i++){
        vector<string> s;
        string t;
        int s_i = 0, s_j = -1;
        int brojac = 0;
        do{
            getline(cin,t);
            if(t[0] != '_') s.push_back(t);
            if(s_j == -1) {
                for (int j = 0; j < t.size(); j++) {
                    if (t[j] == '*') {

                        s_i = brojac;
                        s_j = j;
                    }
                }
            }
            ++brojac;
        }while(t[0] != '_');
        bfs(s,s_i,s_j);
        for(int g = 0;g < s.size();g++){
            cout << s[g] << endl;
        }
        cout << t << endl;
    }


    //ako je unos .txt file
   /* vector<string> s;
    fstream inText( "text.txt", ios::in );
    string line, file;
    for(int i = 0;i < n;i++){
        int s_i = 0, s_j;
        int t = 0;
        while( getline( inText, line ) ) {
            file = line + '\n';
            int j = 0;
            for (; j < file.size(); j++) {
                if (file[j] == '*') {

                    s_i = t;
                    s_j = j;
                }
            }
            if(file[0] != '_'){
                s.push_back(file);
            }
            else break;
            t++;
        }
        bfs(s,s_i,s_j);
        for(int i = 0;i < s.size();i++){
            cout << s[i];
        }
        s.clear();
        cout << "_____" << endl;
    }*/

    return 0;
}