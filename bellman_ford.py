# Represents a graph
class Graph:
    def __init__(self, nodes):
        self.V = nodes  # Number of nodes user wants
        self.graph = []  # Dictionary to store graph

    # Adds an edge to the graph
    def addEdge(self, u, v, w):
        self.graph.append([u, v, w])

    # Print the solution
    def printArr(self, dist):
        print("Vertex    Distance from Source")
        for i in range(self.V):
            if dist[i] == float("Inf"):
                print(i, " \t\t inf")
            else:
                print("%d \t\t %d" % (i, dist[i]))

    # The actual algorithm
    def BellmanFord(self, src_node):
        # Initialize distances from start node to infinity
        cost = [float("Inf")] * self.V
        cost[src_node] = 0
        # Relax all edges V - 1 times.
        for i in range(self.V - 1):
            # Update cost value and parent index of the adjacent vertices in the graph to start node
            for u, v, w in self.graph:
                if cost[u] != float("Inf") and cost[u] + w < cost[v]:
                    cost[v] = cost[u] + w
        # Check for negative-weight cycles.
        for u, v, w in self.graph:
            if cost[u] != float("Inf") and cost[u] + w < cost[v]:
                print("\nGraph contains negative weight cycle")
                return
        # Print results
        self.printArr(cost)
