import Foundation

public class Node: Hashable {
    public var id: Int
    public var hashValue: Int {
        return id
    }
    public var neighbors = [Node]()
    public var visited = false
    public var finishedTime: Int?
    
    public init(_ id: Int) {
        self.id = id
    }
    
    public static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func addNeighbor(node: Node) {
        neighbors += [node]
    }
}

