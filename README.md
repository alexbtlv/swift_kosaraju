# Kosaraju's Algorithm to find SCCs in a directed graph.
---
Kosaraju's algorithm is a linear time algorithm to find the strongly connected components of a directed graph.


### The input
---
Our exapmle graph looks like this

![initial_graph][initial_graph]

### The algorithm
---
Kosaraju's algorithm works as follows:
* Given G be a directed graph.
* Compute Grev – a reversed vesrion of G.
* Run DFS-Loop on Grev, set finishingTime for each node. (Goal is to comptute "magical ordering" of nodes)
* Run DFS-Loop on G, process nodes in decreasing order of finishing times. The result is number of Strongly connected components. Append to the result.
* Return an array contains numbers of SCCs.

### The output
---

![sccs_graph][sccs_graph]

## [5,3,3]


### The perfomance

Kosaraju's algorithm performs two complete traversals of the graph and so runs in Θ(V+E) (linear) time, which is asymptotically optimal because there is a matching lower bound (any algorithm must examine all vertices and edges). It is the conceptually simplest efficient algorithm, but is not as efficient in practice as Tarjan's strongly connected components algorithm and the path-based strong component algorithm, which perform only one traversal of the graph.

It should be noted that if input size of the graph is large, the recursive approach will cause Stack Overflow Exception. 

[initial_graph]: https://github.com/alexbtlv/swift_kosaraju/blob/master/assets/initial_graph.png "Graph"
[sccs_graph]: https://github.com/alexbtlv/swift_kosaraju/blob/master/assets/sccs_graph.png "SCCs"