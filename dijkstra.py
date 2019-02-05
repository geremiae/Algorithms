from collections import deque, namedtuple

#Default unvisited node value.
infinity = float('infinity')

#How an edge is defined in the graph.
Edge = namedtuple('Edge', 'start, end, cost')

#Creating a new edge in the graph, default edge cost is 1 if not provided.
def new_edge(start, end, cost=1):
  return Edge(start, end, cost)

#Defines a graph with nodes, edges, and neighbors.
class Graph:
    def __init__(self, edges):
        #Adds edges passed in.
        self.edges = [new_edge(*edge) for edge in edges]
        #Uses edges to create a set of nodes.
        self.nodes = set(sum(([edge.start, edge.end] for edge in self.edges), []))
        #Initializes an empty set of neighbors then uses the graphs edges to fill it in.
        self.neighbors = {node: set() for node in self.nodes}
        for edge in self.edges:
            self.neighbors[edge.start].add((edge.end, edge.cost))

    #*NOT USED* Returns a list of node pairs with one or two entries depending if the nodes are doubly linked.
    def get_node_pairs(self, node1, node2, double_edge=True):
        if double_edge:
            node_pairs = [[node1, node2], [node2, node1]]
        else:
            node_pairs = [[node1, node2]]
        return node_pairs

    #*NOT USED* Removes an edge found in the graph, edge cases covered by driver.
    def remove_edge(self, node1, node2, double_edge=True):
        node_pairs = self.get_node_pairs(node1, node2, double_edge)
        edges = self.edges[:]
        for edge in edges:
            if [edge.start, edge.end] in node_pairs:
                self.edges.remove(edge)

    #*NOT USED* Adds an edge to the graph, edge cases covered by driver.
    def add_edge(self, node1, node2, cost=1, double_edge=True):
        self.edges.append(Edge(start=node1, end=node2, cost=cost))
        if double_edge:
            self.edges.append(Edge(start=node2, end=node1, cost=cost))

    #Runs through graph given start and end node. Computes shortest path. Edge cases handled by driver.
    def dijkstra(self, start, end):
        #define all the nodes as unvisited by setting them to infinity
        distances = {node: infinity for node in self.nodes}
        #define the previous nodes as an empty set
        previous_nodes = {node: None for node in self.nodes}
        #set the distance fore the start node to 0
        distances[start] = 0
        nodes = self.nodes.copy()
        #loop through the nodes
        while nodes:
            #the new current node is the minimum distance unvisited node
            current_node = min(nodes, key=lambda node: distances[node])
            nodes.remove(current_node)
            #stop if the smallest distance is infinity
            if distances[current_node] == infinity:
                break
            #calculate neighbor node distances
            for neighbor, cost in self.neighbors[current_node]:
                alternative_route = distances[current_node] + cost
                #update if the new calculated distance is smaller than current neighbor distance
                if alternative_route < distances[neighbor]:
                    distances[neighbor] = alternative_route
                    previous_nodes[neighbor] = current_node

        #use deque to get path to end node by appending nodes if they are on the path
        path, current_node = deque(), end
        while previous_nodes[current_node] is not None:
            path.appendleft(current_node)
            current_node = previous_nodes[current_node]
        if path:
            path.appendleft(current_node)
        return path