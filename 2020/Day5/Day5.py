from io import StringIO


def row_column(field):
    # Rows [0 through 127]
    row_range = list(range(0,128))
    for ch in field[:-3]:
        middle_index = len(row_range)//2
        if ch == 'F':
            # Lower half
            row_range = row_range[:middle_index]
        elif ch == 'B':
            # Upper half
            row_range = row_range[middle_index:]
        else:
            return -1,-1

    # Columns [0 through 7]
    column_range = list(range(0,8))
    for ch in field[-3:]:
        middle_index = len(column_range)//2
        if ch == 'L':
            # Lower half
            column_range = column_range[:middle_index]
        elif ch == 'R':
            # Upper half
            column_range = column_range[middle_index:]
        else:
            return -1,-1
    return [row_range[0], column_range[0], field]

def day5_p1(seats: list) -> int:
    biggest_ID = 0
    for field in seats:
        #seat_data = [row, column, seat, ID]
        seat_data = row_column(field)
        seat_data.append(seat_data[0] * 8 + seat_data[1])
        if seat_data[3] > biggest_ID:
            biggest_ID = seat_data[3]
    return biggest_ID

def day5_p2(seats: list) -> int:
    IDs = list()
    for field in seats:
        #seat_data = [row, column, seat, ID]
        seat_data = row_column(field)
        IDs.append(seat_data[0] * 8 + seat_data[1])
    IDs = sorted(IDs)
    for i in range(1,len(IDs)):
        if IDs[i-1] != (IDs[i] - 1):
            return IDs[i] - 1
    return "yo"

if __name__ == '__main__':
    seats = list()
    # or numbers = []
    with open("input.txt",'r') as f:
        for line in f:
            seats.append(line[:-1])

    print("Problem1 - Biggest ID: ", day5_p1(seats))
    print("problem2 - Your seat: ", day5_p2(seats))