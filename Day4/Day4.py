'''
PEP Python 
Tuple, set, dictonary
- Dont use numbers to name variables
- Name a variable like_this rather than likeThis
search for snake case, camel case, pascal case
'''
import string

def day4_p1 (passports: list):
    #required_fields = ["byr","iyr","eyr","hgt","hcl","ecl","pid","cid"]
    new_required_fields = ["byr","iyr","eyr","hgt","hcl","ecl","pid"]
    valid_passports = 0
    for passports_i in range(0,len(passports)):
        fields = 0
        for fields_i in range(0, len(new_required_fields)):
            if new_required_fields[fields_i] in passports[passports_i]:
                fields += 1
        if fields == len(new_required_fields):
            valid_passports += 1
    return valid_passports

def day4_p2 (passports: list):
    new_required_fields = ["byr","iyr","eyr","hgt","hcl","ecl","pid"]
    hex_pattern = list(map(chr, range(ord('a'), ord('f')+1))) + list(range(9+1))
    hex_pattern += '#'
    eye_color = ['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth']
    valid_passports = 0
    for passports_i in range(0,len(passports)):
        n_fields = 0
        for fields_i in range(0, len(new_required_fields)):
            if new_required_fields[fields_i] in passports[passports_i]:
                n_fields += 1
        if n_fields == len(new_required_fields):
            # passport has requiered fields
            add_passport_true = 0
            for field in new_required_fields:
                aux_str = ""
                field_index = passports[passports_i].find(field)
                k = 0
                while field_index+k+4 < len(passports[passports_i]) and passports[passports_i][field_index+k+4] != ' ' and passports[passports_i][field_index+k+4] != '\n':
                    aux_str += passports[passports_i][field_index+k+4]
                    k += 1
                #print("aux string: ", aux_str)

                if field == "byr":
                    if len(aux_str) != 4:
                        break
                    if not(int(aux_str) >= 1920 and int(aux_str) <= 2002):
                        break
                elif field == "iyr":
                    if len(aux_str) != 4:
                        break
                    if not(int(aux_str) >= 2010 and int(aux_str) <= 2020):
                        break
                elif field == "eyr":
                    if len(aux_str) != 4:
                        break
                    if not(int(aux_str) >= 2020 and int(aux_str) <= 2030):
                        break
                elif field == "hgt":
                    if aux_str[-2:] != "in" and aux_str[-2:] != "cm":
                        break
                    if aux_str[-2:] == "cm":
                        aux_str = aux_str[:-2]
                        if not(int(aux_str) >= 150 and int(aux_str) <= 193):
                            break
                    if aux_str[-2:] == "in":
                        aux_str = aux_str[:-2]
                        if not(int(aux_str) >= 59 and int(aux_str) <= 76):
                            break
                elif field == "hcl":
                    if len(aux_str) != 7:
                        break
                    if aux_str[0] != '#':
                        break
                    for ch in aux_str:
                        safe = 0
                        for element in hex_pattern:
                            if ch == element:
                                safe = 1
                                break
                        if safe != 1:
                            break
                    if safe != 1:
                            break
                elif field == "ecl":
                    safe = 0
                    for element in eye_color:
                        if aux_str == element:
                            safe = 1
                            break
                    if safe != 1:
                            break
                elif field == "pid":
                    if len(aux_str) != 9:
                        break
                '''
                # Match statements require Python 3.10 or newer
                match field:
                    case "byr":
                        print("OK")
                    case "iyr":
                        print("Go to the therapist")
                    case "eyr":
                        print("I'm a teapot")
                    case "hgt":
                        print("OK")
                    case "hcl":
                        print("Go to the therapist")
                    case "ecl":
                        print("I'm a teapot")
                    case "pid":
                        print("I'm a teapot")                         
                    case _:
                        print("Code not found")
                '''
                add_passport_true = 1
            if add_passport_true == 1:
                valid_passports += 1
    return valid_passports

with open("input.txt", 'r') as f:
    passports = ['']
    i = 0
    for line in f :
        passports[i] += line
        if line == '\n':
            passports.append('')
            i += 1

    print("Part 1: ", day4_p1(passports))
    print("Part 2: ", day4_p2(passports))