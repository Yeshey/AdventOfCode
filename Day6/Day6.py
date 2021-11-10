def day6_p1(answers: list) -> int:
    group_answers = []
    i = -1
    yeses = 0
    for group in answers:
        i+=1
        group_answers.append('')
        for person in group:
            for ch in person:
                group_answers[i] += ch
    for group in group_answers:
        yeses += len(set(group))
    return yeses

def day6_p2(answers: list) -> int:
    group_answers = []
    i = -1
    all_yes = 0
    for group in answers:
        i+=1
        group_answers.append('')
        for person in group:
            for ch in person:
                group_answers[i] += ch
        for ch in set(group_answers[i]):
            j=0
            for person_answers in group:
                j+=1
                if ch not in person_answers:
                    break
                if j == len(group):
                    all_yes += 1
    return all_yes

if __name__ == '__main__':
    with open("input.txt", 'r') as f:
        answers = [[]]
        i = 0
        for line in f :
            #print (line,end='')
            if line == '\n':
                answers.append([])
                i += 1
            else:
                answers[i].append(line[:-1])

    print("Problem1 - ", day6_p1(answers))
    print("problem2 - ", day6_p2(answers))