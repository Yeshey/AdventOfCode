'''
PEP Python 
'''

def p1(numbers: list) -> int:
    for something1 in numbers:
        for something2 in numbers:
            if something1 + something2 == 2020:
                return ([something1,something2])
    return 0
    
def p2(numbers):
    for something1 in numbers:
        for something2 in numbers:
            for somethin3 in  numbers:
                if something1 + something2 + somethin3 == 2020:
                    return ([something1,something2,somethin3])
    return 0

if __name__ == '__main__':
    numbers = list()
    # or numbers = []
    with open("input.txt",'r') as f:
        for line in f:
            numbers.append(int(line))

    liday1 = p1(numbers)
    liday2 = p2(numbers)
    print(str(liday1[0]) + " x " + str(liday1[1]) + " = " + str(liday1[0]*liday1[1]) )
    print(str(liday2[0]) + " x " + str(liday2[1]) + " x " + str(liday2[2]) + " = " + str(liday2[0]*liday2[1]*liday2[2]) )
