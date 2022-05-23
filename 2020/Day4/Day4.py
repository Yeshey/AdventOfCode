'''
Things to see & study:
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

def to_space(s: string):
	aux = ''
	for letter in s:
		if letter==' ' or letter=='\n':
			return aux
		aux +=letter

	return aux

def day4_p2(passports: list):
	eye_colors = ['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth']

	required_fields = ["byr","iyr","eyr","hgt","hcl","ecl","pid"]
	valid_passports = 0

	for passport in passports:
		n_fields = 0
		for field in required_fields:

			i = passport.find(field)
			if i == -1:
				break

			field_data = to_space(passport[i+4:])
			
			if field == "byr":
				value = int(field_data)
				if value < 1920 or value > 2002:
					break

			elif field == "iyr":
				value = int(field_data)
				if value < 2010 or value > 2020:
					break
 			
			elif field == "eyr":
				value = int(field_data)
				if value < 2020 or value > 2030:
					break

			elif field == "hgt":
				value = int(field_data[:-2])
				if field_data[-2:] == "cm":
					if value < 150 or value > 193:
						break
				elif field_data[-2:] == "in":
					if value < 59 or value > 76:
						break
				else:
					break

			elif field == "hcl":
				if field_data[0] != '#':
					break
				if (len(field_data[1:])!=6):
					break
				for ch in field_data[1:]:
					o = ord(ch)
					if not ((o>=48 and o<=57) or (o>=97 and o<=122)):
						break  

			elif field == "ecl":
				if field_data not in eye_colors:
					break

			elif field == "pid":
				if len(field_data) != 9:
					break

			elif field == "cid":
				n_fields-=1

			n_fields+=1
			if n_fields == len(required_fields):
				valid_passports+=1
				break
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
