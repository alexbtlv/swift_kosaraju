import Foundation

var sccCount = 0
var time = 0

func dfs(_ graph: Graph) {
    for node in graph.nodes {
        if !node.visited {
            _ = dfsLoop(graph, node)
        }
    }
}

func dfsLoop(_ graph: Graph, _ node: Node) -> Int {
    if !node.visited {
        sccCount += 1
    }
    
    time += 1
    node.visited = true
    for n in node.neighbors {
        if !n.visited {
            _ = dfsLoop(graph, n)
        }
    }
    
    time += 1
    node.finishedTime = time
    return sccCount
}


func kosaraju(_ graph: Graph) -> [Int] {
    let revGraph = graph.reversedGraph
    let numberOfNodes = revGraph.nodes.count
    dfs(revGraph)
    revGraph.nodes = revGraph.nodes.sorted { $0.finishedTime! > $1.finishedTime! }
    var SCCs = [Int]()
    
    for i in 0..<numberOfNodes {
        sccCount = 0
        let nodeInOrder = revGraph.nodes[i]
        let currentCount = dfsLoop(graph, graph.nodeById(nodeInOrder.id)!)
        if currentCount > 0 {
            SCCs.append(currentCount)
        }
    }
    
    return SCCs
}

let graph = Graph()
if let path = Bundle.main.path(forResource: "data", ofType: "txt"), let reader = LineReader(path: path) {
    for line in reader {
        let edge = line.replacingOccurrences(of: "\n", with: "")
        let ids = edge.split(separator: " ")
        guard let v1 = Int(ids[0]) else { print("Can not read value 1 from line \(edge)"); break }
        guard let v2 = Int(ids[1]) else { print("Can not read value 2 from line \(edge)"); break }
        var n1: Node!
        var n2: Node!
        if let n = graph.nodeById(v1) {
            n1 = n
        } else {
            n1 = Node(v1)
            graph.addNode(n1)
        }
        if let n = graph.nodeById(v2) {
            n2 = n
        } else {
            n2 = Node(v2)
            graph.addNode(n2)
        }
        graph.addEdgeFromNode(n1, toNode: n2)
    }
    
} else {
    print("can not open file")
}


let SCCs = kosaraju(graph)



