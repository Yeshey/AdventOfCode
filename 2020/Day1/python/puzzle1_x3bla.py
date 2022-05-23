temp = 0
num1 = 0
num2 = 0
num3 = 0
lists = []
inputs = []

with open("input.txt", 'r') as f:
    for line in f:
        y = int(line)
        inputs.append(y)

with open("input.txt", 'r') as f:
    for line in f:
        temp = int(line)
        num1 = temp
        #print(temp)
        with open("input.txt", 'r') as fi:
            for x in inputs:
                x = int(x)
                num2 = x
                #print(x)
                for y in inputs:
                    y = int(y)
                    num3 = y
                    check = num1 + num2 + num3
                    #print(check)
                    if check == 2020:
                        print("added")
                        lists.append(num1)
                        lists.append(num2)
                        lists.append(num3)
                        break
                    #print(num1, num2, num3)

print(lists)
