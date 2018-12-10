import Foundation

public class Graph {
    public var nodes = [Node]()
    public var idToNode = [Int: Node]()
    
    public var reversedGraph: Graph {
        let newGraph = Graph()
        
        for node in nodes {
            newGraph.addNode(Node(node.id))
        }
        
        for node in nodes {
            let sourceNode = newGraph.nodeById(node.id)!
            
            for destinationNodeOld in node.neighbors {
                let destination = newGraph.nodeById(destinationNodeOld.id)!
                newGraph.addEdgeFromNode(destination, toNode: sourceNode)
            }
        }
        
        return newGraph
    }
    
    public init() {}
    
    public func addNode(_ node: Node)  {
        idToNode[node.id] = node
        nodes.append(node)
    }
    
    public func nodeById(_ id: Int) -> Node? {
        return idToNode[id]
    }
    
    public func addEdgeFromNode(_ src: Node, toNode destination: Node) {
        src.addNeighbor(node: destination)
    }
}
