#include <iostream>
#include <queue>
#include <vector>
#include <fstream>
#include <string>
#include <algorithm>
#include <iomanip>
using namespace std;



/*  vektor vektora mozemo promatrati kao dvodimenzionalno polje sa 6 redaka,
 *  šest redaka zato sto svaki redak predstavlja jedno slovo [a,f], te se u njegovom retku nalaze svi stringovi
 *  iz kojeg se to slovo moze dobiti, npr neka se ba moze pretvoriti u a, onda bi nam se na ba nalazio u prvom retku.
 *  Radit cemo bottom up metodom, odnosno krenit cemo od samog 'a' pa cemo iz njega formirati vece rijeci, sve dok
 *  ne dodjemo do rijeci duzine n, tada cemo u brojac zapisati da smo nasli string duljine n koji se moze kratiti u 'a',
 */
int bfs(vector<vector<string>> S, int n){
    int brojac = 0;
    queue<string> Q;
    Q.push("a");
    while(!Q.empty()){
        string t = Q.front();

        Q.pop();
        char c;
        string temp = t;
        c = temp[0];
        temp.erase(0,1);
        string temp2;
        //radimo sve moguce zamjene za određeno slovo te ih pushamo u queue
        for(int i = 0;i < S[c-97].size();i++){
            temp2 = temp;
            temp2.insert(0,S[c-97][i]);
            if(temp2.size() == n){
                brojac++;
            }
            else{
                posjecen.push_back(temp2);
                Q.push(temp2);

            }
        }
    }
    return brojac;

}

int main() {
    int n, q; cin >> n >> q;
    vector<vector<string>> S(6);
    for(int i = 0;i < q;i++){
        string s;
        char t;
        cin >> s >> t;
        //koristimo ascii vrijednost charova da bi znali na koje mjesto trebamo umetnuti njihovu zamjenu
        S[t - 97].push_back(s);
    }
    cout << bfs(S, n);
    return 0;
}