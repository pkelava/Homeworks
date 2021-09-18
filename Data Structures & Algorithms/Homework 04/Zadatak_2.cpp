#include <iostream>
#include <algorithm>
#include <vector>
#include <fstream>
#include <iomanip>
#include <string>
#include <sstream>
using namespace std;

typedef long long ll;
typedef unsigned long long ull;
typedef vector<ll> vi;
typedef vector<vector<ll>> vvi;


ll t = 1;

void unos(vvi &L,string s,ull p,ull k){
    ll t = stoi(s.substr(0,p-1));
    string ost = s.substr(k+1,s.size());


    if(ost.size() > 1) ost = ost.substr(0,ost.size());
    stringstream iss( ost );
    ll broj;

    while(iss >> broj){
        L[t].push_back(broj);
    }

}

void dfs(vvi L, ll n,vi &otkriven, vi &otkriven2){
    if(otkriven[n] != 0) return;
    otkriven[n] = t;
    otkriven2[n] = t++;
    for(ll i = 0;i < L[n].size();i++){
        dfs(L,L[n][i],otkriven,otkriven2);
    }
}

ll dfs2(vvi L,ll n,ll dosao,vi &provjerio, vi &otkriven2){
    if(provjerio[n] != 0) return otkriven2[n];
    provjerio[n] = 1;
    for(ll i = 0;i < L[n].size();i++){
        if(L[n][i] != dosao) otkriven2[n] = min(otkriven2[n],dfs2(L,L[n][i],n,provjerio,otkriven2));
    }
    return otkriven2[n];
}

int main() {

    vector<string> s;
    fstream inText( "text.txt", ios::in );
    string line, file;
        while( getline( inText, line ) ) {
            file = line;
            s.push_back(file);
        }

    for(ll ii = 0;ii < s.size();ii++){
        string broj = s[ii];
        ull n = stoi(broj);
        vvi L(n+1);
        vi otkriven(n+1);
        vi otkriven2(n+1);
        vi provjerio(n+1);
        for(ll jj = 0;jj < n;jj++) {
            ull t1 = s[ii + jj + 1].find('(');
            ull t2 = s[ii + jj + 1].find(')');
            unos(L, s[ii + jj + 1], t1, t2);
        }


            for(ll i = 0;i < n;i++) dfs(L,i,otkriven,otkriven2);
            for(ll i = 0;i < n;i++) dfs2(L,i,-1,provjerio,otkriven2);
            vvi artikulacijske(n);



            for(ll i = 0;i < n;i++) {
                for (ll j = 0; j < L[i].size(); j++) {
                    if (otkriven2[L[i][j]] > otkriven[i]) {
                        artikulacijske[i].push_back(L[i][j]);
                    }
                }
            }

            ll suma = 0;

             for(ll i = 0;i < n;i++){
                suma += artikulacijske[i].size();
            }

             cout << suma << " critical links" << endl;
            for(ll i = 0;i < n;i++){
                for(ll j = 0;j < artikulacijske[i].size();j++) cout << i << " - " << artikulacijske[i][j] << endl;
            }
        ii += n;
        }






/*
    ll n, m; cin >> n >> m;
    vvi L(n+1);
    vi otkriven(n+1);
    vi otkriven2(n+1);
    vi provjerio(n+1);
    ll root = -1;
    for(ll i = 0;i < m;i++){
        ll t, v; cin >> t >> v;
        if(root == -1) root = t - 1;
        L[t].push_back(v);
        L[v].push_back(t);
    }

    for(ll i = 0;i < n;i++) dfs(L,i,otkriven,otkriven2);
    for(ll i = 0;i < n;i++) cout << otkriven[i]<< " ";
    cout << endl;
    for(ll i = 0;i < n;i++) dfs2(L,i,-1,provjerio,otkriven2);
    for(ll i = 0;i < n;i++) cout << otkriven2[i]<< " ";
    cout << endl;

    vvi artikulacijske(n);


    for(ll i = 0;i < n;i++) {
        for (ll j = 0; j < L[i].size(); j++) {
            if (otkriven2[L[i][j]] > otkriven[i]) {
                artikulacijske[i].push_back(L[i][j]);
            }
        }
    }
    for(ll i = 0;i < n;i++){
        for(ll j = 0;j < artikulacijske[i].size();j++) cout << i << " " << artikulacijske[i][j] << endl;
    }*/

    return 0;
}