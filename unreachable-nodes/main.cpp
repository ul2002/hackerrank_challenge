   #include <iostream>
   #include <vector>
    using namespace std;

    vector <int> adj[100000];
    bool visited[100000] = { false };
    int ans = 0;

    void dfs(int s) {
        visited[s] = true;
        ans++;
        for(int i = 0;i < adj[s].size();++i)    {
         if(visited[adj[s][i]] == false)
             dfs(adj[s][i]);
        }
    }

    int main() {
        int nodes, edges, x, y, head, unreachableNodes = 0;
        cin >> nodes;                       //Number of nodes
        cin >> edges;                       //Number of edges
        for(int i = 0;i < edges;++i) {
         cin >> x >> y;     
         //Undirected Graph 
         adj[x].push_back(y);                   //Edge from vertex x to vertex y
         adj[y].push_back(x);                   //Edge from vertex y to vertex x
        }
        cin >> head;  

        dfs(head);

        
        cout << (nodes - ans);
        return 0;
    }