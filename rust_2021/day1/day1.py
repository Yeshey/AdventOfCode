
def day1_01(lines: list):
    counter = 0
    for i in range(0, len(lines)):
        if (i == 0):
            print(lines[i] + " no previous measurment")
            continue
        if (lines[i] > lines[i-1]):
            counter += counter
            print(lines[i] + " increased")
        elif (lines[i] == lines[i-1]):
            print(lines[i] + " equal")
        else:
            print(lines[i] + " decreased")
    
        

forest = list()
# or forest = []
with open("./input.txt",'r') as f:
    for line in f:
        forest.append(line)

#print_forest(forest)
#print_forest(forest)
print ("puzzle 1 =", day1_01(forest))