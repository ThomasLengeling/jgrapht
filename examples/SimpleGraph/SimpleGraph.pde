/*
Simple usage of jgrapht
 based on DirectedGraphDemo 
 https://github.com/jgrapht/jgrapht/wiki/DirectedGraphDemo
 
 Thomas Sanchez Lengeling
 */

import java.util.List;
import org.jgrapht.alg.*;
import org.jgrapht.*;
import org.jgrapht.graph.*;

void setup() {
  size(1024, 768);

  DirectedGraph<String, DefaultEdge> directedGraph;
  directedGraph = new DefaultDirectedGraph<String, DefaultEdge>(DefaultEdge.class);

  createDirectedGraph(directedGraph);
  computeConnections(directedGraph);
}

void draw() {
}


// constructs a directed graph with the specified vertices and edges
void createDirectedGraph(DirectedGraph<String, DefaultEdge> directedGraph) {

  directedGraph.addVertex("a");
  directedGraph.addVertex("b");
  directedGraph.addVertex("c");
  directedGraph.addVertex("d");
  directedGraph.addVertex("e");
  directedGraph.addVertex("f");
  directedGraph.addVertex("g");
  directedGraph.addVertex("h");
  directedGraph.addVertex("i");
  directedGraph.addEdge("a", "b");
  directedGraph.addEdge("b", "d");
  directedGraph.addEdge("d", "c");
  directedGraph.addEdge("c", "a");
  directedGraph.addEdge("e", "d");
  directedGraph.addEdge("e", "f");
  directedGraph.addEdge("f", "g");
  directedGraph.addEdge("g", "e");
  directedGraph.addEdge("h", "e");
  directedGraph.addEdge("i", "h");
}


void computeConnections(DirectedGraph<String, DefaultEdge> directedGraph) {
  // computes all the strongly connected components of the directed graph
  StrongConnectivityInspector sci = new StrongConnectivityInspector(directedGraph);

  List stronglyConnectedSubgraphs = sci.stronglyConnectedSubgraphs();

  // prints the strongly connected components
  System.out.println("Strongly connected components:");
  for (int i = 0; i < stronglyConnectedSubgraphs.size(); i++) {
    System.out.println(stronglyConnectedSubgraphs.get(i));
  }
  println();

  // Prints the shortest path from vertex i to vertex c. This certainly
  // exists for our particular directed graph.
  System.out.println("Shortest path from i to c:");
  List path = DijkstraShortestPath.findPathBetween(directedGraph, "i", "c");
  println(path + "\n");

  // Prints the shortest path from vertex c to vertex i. This path does
  // NOT exist for our particular directed graph. Hence the path is
  // empty and the variable "path"; must be null.
  System.out.println("Shortest path from c to i:");
  path = DijkstraShortestPath.findPathBetween(directedGraph, "c", "i");
  println(path);
}