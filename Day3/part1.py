def print_forest(forest: list):
    """For Visualising
    """
    for line in forest:
        for i in range(2):          # amount of times to repeat pattern to the right
            for ch in line[:-1] :   # removes last character from line, to remove the \n
                print(ch, end='')
        print()                     # prints one \n

def print_forest2 (forest: list):
    """Another method for visualising the forest
    """
    for line in forest:
        for i in range(2): 
            for ch in line:
                if ch != '\n':
                    print(ch, end='')
        print()

def day3 (forest: list):
    """Puzzles
    """
    trees = int(0)
    right_displacement = int(0)
    i = 0
    for line in forest:
        i += 1
        line_lenght = len(line)-1
        if right_displacement >= line_lenght:
            right_displacement = right_displacement-line_lenght
        ch = line[right_displacement]
        print(ch,right_displacement, end='')
        if ch == '#':
            trees += 1 
        right_displacement += 3
    print("Home free!")
    return trees

forest = list()
# or forest = []
with open("input.txt",'r') as f:
    for line in f:
        forest.append(line)

#print_forest(forest)
#print_forest(forest)
print (day3(forest))