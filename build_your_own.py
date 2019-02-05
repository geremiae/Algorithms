import dijkstra
import bellman_ford
sentence = input("If you want the Bellman Ford algorithm INPUT 1. \nIf you want dijkstra's algorithm input anything else.")
if sentence == "1":
    print("\nHello! This is an implementation of the Bellman Ford algorithm in python. Here is what you can do:\n")
    print("1. Define the amount of nodes you want in your graph.")
    print("2. Report the edges you want, valid nodes are 0 - (amount of nodes - 1)")
    print("3. After you have all the edges you want, just input the node you want to calculate.")
    while True:
        number = input("\nPlease input the number of nodes you want for your new graph: ")
        if number.isdigit() is False:
            print("\nPlease enter a valid number")
        else:
            #add nodes to graph since the input is valid
            g = bellman_ford.Graph(int(number))
            #num is the last node value
            num = int(number) - 1
            while True:
                print("\nVALID NODES INCLUDE 0 -", num )
                the_edge = input("Please enter a an edge of the form: NODE1 NODE2 DISTANCE. Enter 'done' to go on to the algorithm:")
                if the_edge == "done":  # if user wants to go to algorithm
                    node = input("\nPlease enter the node you want to calculate.")
                    #make sure input is valid node
                    if node.isdigit() is False or int(node) > num:
                        print("\nPlease enter a valid number. Please enter 'done' again to make sure you are ready")
                    else:
                        #calculate table
                        g.BellmanFord(int(node))
                        break
                else:
                    the_edge = the_edge.strip()  # strip sentence of whitespace NOTE: does not get rid of whitespace between characters
                    x = the_edge.split(' ', 2)
                    if len(x) != 3:  # make sure the input is valid
                        print("\nInvalid input form, please try again.")
                    elif x[0].isdigit() is False or x[1].isdigit() is False:  # make sure the nodes are numbers
                        print("\nNot a valid number for nodes, please try again.")
                    elif int(x[0]) > num or int(x[1]) > num: # make sure nodes are in the valid range
                        print("\nNot a valid number for nodes, please try again.")
                    elif x[2].isdigit() is False: # if the distance is not a digit
                        if x[2][0] != '-': # first make sure it isn't just negative
                            print("\nNot a valid number for distance, please try again.")
                        else: # if it is negative add the edge to the graph
                            g.addEdge(int(x[0]), int(x[1]), int(x[2]))
                            print("\nEdge " + str(x) + " added!")
                    else: # add edge to graph
                        g.addEdge(int(x[0]), int(x[1]), int(x[2]))
                        print("\nEdge " + str(x) + " added!")
            answer = input("\nDo you want to quit or make a new graph? Enter 'exit' to quit, anything else to continue: ")
            if answer == "exit":
                break

else:
    print("Hello! This is an implementation of dijkstra's algorithm in python. Here is what you can do:\n")
    print("1. You can add as many edges to the graph you want.")
    print("2. You don't need to report the nodes beforehand, they will be taken from the edges you provide.")
    print("3. After you have all the edges you want, just input the path you want to calculate.")
    print("NOTE: Enter the word exit at any time to close connection and stop program\n")
    while True:
        edges = []
        # while loop that verifies that input is somewhat valid and that the user wants his/her input
        while True:
            sentence = input("Please input an edge of the form-> NODE1 NODE2 DISTANCE: ")
            if sentence == "exit":  # if user wants to quit, break from loop
                break
            sentence = sentence.strip()  # strip sentence of whitespace NOTE: does not get rid of whitespace between characters
            x = sentence.split(' ', 2)
            y = x.copy()
            if x[2].isdigit():  # make sure distance is a number
                y[2] = int(y[2])
            if len(x) != 3:  # make sure the input is valid
                print("\nInvalid input form, please try again.")
            elif tuple(y) in edges:  # make sure the edge hasn't already been added
                print("\nEdge already inputted, please try again.")
            elif x[2].isdigit() is False:  # make sure the distance is a number
                print("\nNot a valid number for distance, please try again.")
            else:
                x[2] = int(x[2])  # make distance into an int
                edges.append(tuple(x))  # append tuple to edge list
                print("\nEdge " + str(x) + " added!")
                answer = input("\nAre these all the edges you want? Input Y/y for yes, anything else for no: ")
                if answer == "y" or answer == "Y":  # make sure they want to calculate this expression
                    break
                elif answer == "exit":  # if user wants to quit, break from loop
                    sentence = "exit"
                    break
        if sentence == "exit":  # if you broke from the previous loop, break from big loop
            break
        graph = dijkstra.Graph(edges)  # add edges and create the graph
        while True:
            # ask to calculate path
            sentence = input("\nPlease input the shortest path you want to calculate in the form-> NODE1 NODE2: ")
            x = sentence.split(' ', 1)
            if len(x) != 2:  # make sure length is 2 nodes long
                print("\nInvalid input form, please try again.")
            elif x[0] not in graph.nodes or x[
                1] not in graph.nodes:  # make sure both of the nodes are actually in the graph
                print("\nOne or more of the nodes is invalid, please try again.")
            else:

                # perform dijkstra's algorithm
                deq = graph.dijkstra(x[0], x[1])
                print("Path: ", end='')
                count = 0
                for x in deq:  # display path in an easy to read format
                    if deq[count] == deq[len(deq) - 1]:
                        print(x, end='')
                    else:
                        count += 1
                        print(x + "->", end='')
                print('')
                more = input(
                    "\nDo you want to calculate another shortest path with the same graph? Y/y for yes, anything else for no: ")
                if more != "Y" and more != "y":
                    break
        more = input("\nDo you want to continue using the program? Y/y for yes, anything else for no: ")
        if more != "Y" and more != "y":
            break

print("\nThanks for trying my project!")