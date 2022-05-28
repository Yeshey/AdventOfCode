use std::fs::{self};

fn main() {
    let file_contents = read_file("day5/input.txt");

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

    println!("{}", file_contents);

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