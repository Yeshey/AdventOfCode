use std::fs::File;
use std::io::{self, prelude::*, BufReader};

fn main() -> io::Result<()> {
    /* This would read the whole file at once */
    //let contents = fs::read_to_string("day2/input.txt").expect("Something went wrong reading the file");
    //println!("With text:\n{}", contents);

    let file_path = "day2/input.txt";

    // Day 2 Part 1
    let (depth, horizontal_distance) = day2_p1(file_path);
    println!("depth: {} * horizontal_distance: {} = {}", depth, horizontal_distance, depth*&horizontal_distance);

    // Day 2 Part 2
    let (depth, horizontal_distance) = day2_p2(file_path);
    println!("depth: {} * horizontal_distance: {} = {}", depth, horizontal_distance, depth*&horizontal_distance);

    Ok(())
}

fn day2_p1(file_to_read: &str) -> (u32, u32){

    let file = File::open(file_to_read).unwrap(); // had ? instead of .unwrap() before
    let reader = BufReader::new(file);

    let mut depth = 0;
    let mut horizontal_distance = 0;

    for line in reader.lines(){
        //let line = line?; // for error handling (?), but the function needs to return -> io::Result<()>
        let line = line.unwrap(); // so I seemingly have to do this 

        let ch = line.chars().next().unwrap();
        let num = get_num(&line);
        match ch {
            'u' => depth-=num,
            'd' => depth+=num,
            'f' => horizontal_distance+=num,
            _ => { println!("error!"); break; }
        } 
    }
    (depth,horizontal_distance)
}

fn day2_p2(file_to_read: &str) -> (u32, u32){

    let file = File::open(file_to_read).unwrap(); // had ? instead of .unwrap() before
    let reader = BufReader::new(file);

    let mut depth = 0;
    let mut horizontal_distance = 0;
    let mut aim = 0;

    for line in reader.lines(){
        //let line = line?; // for error handling (?), but the function needs to return -> io::Result<()>
        let line = line.unwrap(); // so I seemingly have to do this 

        let ch = line.chars().next().unwrap();
        let num = get_num(&line);
        match ch {
            'u' => aim-=num,
            'd' => aim+=num,
            'f' => {
                horizontal_distance+=num;
                depth += num * aim;
            }
            _ => { println!("error!"); break; }
        } 
    }
    (depth,horizontal_distance)
}

fn get_num(str: &str) -> u32 {
    /* to iterate over a string */
    //for (char, index) in str.chars().enumerate(){ }

    str.chars().last().unwrap() // gets last char of the string
        .to_digit(10).unwrap() // converts to digit, unwrap always for error handling
}