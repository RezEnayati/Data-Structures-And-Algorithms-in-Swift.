import Foundation

//Graphs Consists of Vertices and Edges.

enum EdgeType {
    case directed
    case undirected
}

//MARK: -  Vertex

struct Vertex<T> {
    let data: T
    let index: Int
}

extension Vertex: Hashable where T: Hashable {}
extension Vertex: Equatable where T: Hashable {}

extension Vertex: CustomStringConvertible {
    var description: String {
        return "\(index): \(data)"
    }
}

//MARK: -  Creating the edge that conncect Verticies.

struct Edge<T> {
    let source: Vertex<T>
    let destination: Vertex<T>
    let weight: Double?
}

// Creating a Protocol which will is going to define a particular Graph

//MARK: -  Implementing the Graph itself

protocol Graph {
    associatedtype Element //Making Sure The graph works with any type of Element
    func createVertex(data: Element) -> Vertex<Element>
    func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>, weight: Double?)
    func add(_ edge: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    func edges(from source: Vertex<Element>) -> [Edge<Element>]
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double?
}

extension Graph {
    
    // addUndirectedGraph
    func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>, weight: Double?){
        addDirectedEdge(from: source, to: destination, weight: weight)
        addDirectedEdge(from: destination, to: source , weight: weight)
    }
    // add function
    func add(_ edge: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?){
        switch edge {
        case .directed:
            addDirectedEdge(from: source, to: destination, weight: weight)
        case .undirected:
            addUndirectedEdge(between: source, and: destination, weight: weight)
        }
    }

}

//MARK: -  Adjacency List

class AdjacencyList<T: Hashable>: Graph {
    
    private var adjacencies: [Vertex<T>: [Edge<T>]] = [:]
    init(){}
    
    func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(data: data, index: adjacencies.count)
        adjacencies[vertex] = []
        return vertex
    }
    
    func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
            let edge = Edge(source: source, destination: destination, weight: weight)
        adjacencies[source]?.append(edge)
    }
    
    func edges(from source: Vertex<T>) -> [Edge<T>] {
        return adjacencies[source] ?? []
    }
    
    func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
        return edges(from: source).first {$0.destination == destination}?.weight
    }
}


//The code bellow is Only to Display the graph:

extension AdjacencyList: CustomStringConvertible {
    public var description: String {
        var result = ""
        for (vertex, edges) in adjacencies {
            var edgeString = ""
            for (index, edge) in edges.enumerated() {
                if index != edges.count - 1 {
                    edgeString.append("\(edge.destination), ")
                } else {
                    edgeString.append("\(edge.destination)")
                }
            }
            result.append("\(vertex) ---> [\(edgeString)] \n")
        }
        return result
    }
}

//Graph obect

let graph = AdjacencyList<String>()

let singapore = graph.createVertex(data: "Singapore")
let tokyo = graph.createVertex(data: "Tokyo")
let hongKong = graph.createVertex(data: "Hong Kong")
let detroit = graph.createVertex(data: "Detroit")
let sanFrancisco = graph.createVertex(data: "San Francisco")
let WashingtonDC = graph.createVertex(data: "Washington DC")
let austinTexas = graph.createVertex(data: "Austin Texas")
let seattle = graph.createVertex(data: "Seattle")

graph.add(.undirected, from: singapore, to: hongKong, weight: 300)
graph.add(.undirected, from: singapore, to: tokyo, weight: 500)
graph.add(.undirected, from: hongKong, to: tokyo, weight: 250)
graph.add(.undirected, from: tokyo, to: detroit, weight: 450)
graph.add(.undirected, from: tokyo, to: WashingtonDC, weight: 300)
graph.add(.undirected, from: hongKong, to: sanFrancisco, weight: 600)
graph.add(.undirected, from: detroit, to: austinTexas, weight: 50)
graph.add(.undirected, from: austinTexas, to: WashingtonDC, weight: 292)
graph.add(.undirected, from: sanFrancisco, to: WashingtonDC, weight: 337)
graph.add(.undirected, from: WashingtonDC, to: seattle, weight: 277)
graph.add(.undirected, from: sanFrancisco, to: seattle, weight: 218)
graph.add(.undirected, from: austinTexas, to: sanFrancisco, weight: 297)

print(graph)
