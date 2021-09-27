#print ("hello world")

'''
f = open('../input.txt', 'r')
print(f.read())

f.close()
'''

#with context managers:
with open('../input.txt','r') as f:
    '''
    f_contents = f.readlines()
    print(f_contents, end='') # [ end='' ] to not put a \n at the end 
    #f.seek(0)
    f_contents = f.readline()
    print(f_contents, end='') # [ end='' ] to not put a \n at the end 
    '''

    '''
    #loops line by line
    for line in f:
        print(line, end='')
    '''
    size_to_read=5
    f_contents = f.read(size_to_read)
    while len(f_contents) > 0: #f.read returns empty string in EOF, and won't meet condition
        print(f_contents,end="*")
        f_contents = f.read(size_to_read)