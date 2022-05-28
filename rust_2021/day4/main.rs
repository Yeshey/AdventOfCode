use std::fs::{self};

fn main() {
    let file_contents = read_file("day4/input.txt");

    // Part 1
    let (sum_of_all_unmarked_numbers, last_called_number) = day4_p1(&file_contents);

    // Part 2
    //let (oxygen_generator_rating, CO2_scrubber_rating) = day4_p2(file_contents);
}

fn read_file(path: &str) -> String {
    match fs::read_to_string(path) {
        Ok(file) => file,
        Err(_) => fs::read_to_string("input.txt").expect("Couldn't read the file")
    }
}

fn day4_p1(file_contents: &str) -> (i32, i32){
    // u32 vs i32 vs usize vs isize
    // usize gives you the guarantee to be always big enough to hold any pointer or any offset in a data structure, while u32 can be too small on some architectures.
    // usize has bigger memory footprint but is garanted to have suficient space in any architecture. 
    // usize - Use for memory size, index, offset related
    // i32 / u32 - Use for actual integers
    // u32 = unsigned int - [min=0, max = 4294967295]
    // i32 = int - [min=-2147483648, max = 2147483647]

    println!("{}", file_contents);

    let guesses: Vec<i32> = file_contents.lines().nth(0).unwrap() // take first line of the file
        .split(',') // splits based on
        .map(|x| // allows to transform all the elements at the same time
            x.trim_matches(|c: char| !c.is_numeric()) // check examples, trims all matches that are not alphabetic (witch apperantly wasn't needed)
             .parse::<i32>().unwrap()) // attempts to convert to i32
        .collect(); // returns a vector with all the values of the iterator

    println!("{:?}", guesses);

    // removing the first line from the String:
    let mut file_contents = file_contents.replace(file_contents.lines().nth(0).unwrap(), "");
    let mut amount_to_remove = 0;
    for ch in file_contents.chars(){ // there should be a better way than using clone here..?
        if ch.is_whitespace() {
            amount_to_remove += 1;
        } else {
            break;
        }
    }
    for i in 0..amount_to_remove {
        file_contents.remove(i);   
    }

    print!("------\n{}", file_contents.chars().nth(0).unwrap());
    print!("------\n{}", file_contents.lines().nth(1).unwrap());
    print!("------\n{}", file_contents.lines().nth(2).unwrap());

    for (mut i, ch) in file_contents.chars().enumerate(){



        //print!("{}",ch);
    }
    

    let sum_of_all_unmarked_numbers = 0;
    let last_called_number = 0;
    (sum_of_all_unmarked_numbers, last_called_number)
}

/* 
fn day4_p2(mut file_contents: String) -> (i32, i32){

    let oxygen_generator_rating = 0;
    let CO2_scrubber_rating = 0;
    (oxygen_generator_rating,CO2_scrubber_rating)
}
*/