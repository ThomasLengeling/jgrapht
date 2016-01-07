/* ==========================================
 * JGraphT : a free Java graph-theory library
 * ==========================================
 
 JGraphT library for processing
 
 Code based on HelloJGraphT.java
 https://github.com/jgrapht/jgrapht/blob/master/jgrapht-demo/src/main/java/org/jgrapht/demo/HelloJGraphT.java
 
 Thomas Sanchez Lengeling
*/

import java.net.*;

import org.jgrapht.*;
import org.jgrapht.graph.*;


void setup() {
  size(1024, 768);


  UndirectedGraph<String, DefaultEdge> stringGraph = createStringGraph();

  // note undirected edges are printed as: {<v1>,<v2>}
  System.out.println(stringGraph.toString());

  // create a graph based on URL objects
  DirectedGraph<URL, DefaultEdge> hrefGraph = createHrefGraph();

  // note directed edges are printed as: (<v1>,<v2>)
  System.out.println(hrefGraph.toString());
}

void draw() {
}

void createDirectedGraph() {
  UndirectedGraph<String, DefaultEdge> stringGraph = createStringGraph();

  // note undirected edges are printed as: {<v1>,<v2>}
  System.out.println(stringGraph.toString());

  // create a graph based on URL objects
  DirectedGraph<URL, DefaultEdge> hrefGraph = createHrefGraph();

  // note directed edges are printed as: (<v1>,<v2>)
  System.out.println(hrefGraph.toString());
}


DirectedGraph<URL, DefaultEdge> createHrefGraph() {

  DirectedGraph<URL, DefaultEdge> g;
  g = new DefaultDirectedGraph<URL, DefaultEdge>(DefaultEdge.class);

  try {
    URL amazon = new URL("http://www.amazon.com");
    URL yahoo = new URL("http://www.yahoo.com");
    URL ebay = new URL("http://www.ebay.com");

    // add the vertices
    g.addVertex(amazon);
    g.addVertex(yahoo);
    g.addVertex(ebay);

    // add edges to create linking structure
    g.addEdge(yahoo, amazon);
    g.addEdge(yahoo, ebay);
  } 
  catch (MalformedURLException e) {
    e.printStackTrace();
  }

  return g;
}

/**
 * Create a toy graph based on String objects.
 * @return a graph based on String objects.
 */
UndirectedGraph<String, DefaultEdge> createStringGraph() {

  UndirectedGraph<String, DefaultEdge> g;
  g = new SimpleGraph<String, DefaultEdge>(DefaultEdge.class);

  String v1 = "v1";
  String v2 = "v2";
  String v3 = "v3";
  String v4 = "v4";

  // add the vertices
  g.addVertex(v1);
  g.addVertex(v2);
  g.addVertex(v3);
  g.addVertex(v4);

  // add edges to create a circuit
  g.addEdge(v1, v2);
  g.addEdge(v2, v3);
  g.addEdge(v3, v4);
  g.addEdge(v4, v1);

  return g;
}