use std::fs::{self};

fn main() {
    let file_contents = read_file("day3/input.txt");

    // Part 1
    let (gamma_rate, epsilon_rate) = day3_p1(&file_contents);
    println!("Part 1:
gamma_rate:   {:#014b} = {}
epsilon_rate: {:#014b} = {}
{} * {} = {}", 
gamma_rate, gamma_rate, epsilon_rate, epsilon_rate, gamma_rate, epsilon_rate, gamma_rate*epsilon_rate);

    // Part 2
    let (oxygen_generator_rating, CO2_scrubber_rating) = day3_p2(file_contents);
    println!("Part 2:
oxygen_generator_rating:   {:#014b} = {}
CO2_scrubber_rating: {:#014b} = {}
{} * {} = {}", 
oxygen_generator_rating, oxygen_generator_rating, CO2_scrubber_rating, CO2_scrubber_rating, oxygen_generator_rating, CO2_scrubber_rating, oxygen_generator_rating*CO2_scrubber_rating);}

fn read_file(path: &str) -> String {
    fs::read_to_string(path)
        .expect("Something went wrong reading the file")
}

fn day3_p1(file_contents: &str) -> (i32, i32){
    //let mut gamma_rate = String::new(); // ::from and ::new difference?
    //let mut epsilon_rate = String::from("");
    let mut gamma_rate: Vec<bool> = Vec::new(); // most common bit
    let mut epsilon_rate: Vec<bool> = Vec::new(); // least common bit
    let mut v: Vec<(u32,u32)> = Vec::new();  // (total amount of numbers, amount of number ones)

    for (idx, line) in file_contents.lines().enumerate(){
        // making the vector the right size / initializing it
        if idx == 0 {
            for ch in line.chars(){
                if ch == '0' || ch == '1'{
                    v.push((0,0));
                } else { println!("Error"); break; }
            }
        }

        // filling the vector 
        for (i,ch) in line.chars().enumerate(){
            v[i] = (v[i].0 + 1, if ch == '1' { v[i].1 + 1 } else { v[i].1 });
        }
    }

    for elem in v {
        gamma_rate.push( elem.1 > elem.0 / 2 );
        epsilon_rate.push( !(elem.1 > elem.0 / 2) );
    }

    // println!("{:?}", (&gamma_rate, &epsilon_rate)); // use {:?} when debugging vectors

    // converting binary arrays into number
    let gamma_rate = gamma_rate.iter()
        .rev() // Reverses an iterator's direction. 
        .enumerate() // So we can access the index as well as the value in the .fold
        .fold(0, |acc, (i, &x)| acc + if x { 1 } else { 0 }*(2_i32.pow(i.try_into().unwrap())) as i32); // brain
    let epsilon_rate = epsilon_rate.iter()
        .rev() // Reverses an iterator's direction. 
        .enumerate() // So we can access the index as well as the value in the .fold
        .fold(0, |acc, (i, &x)| acc + if x { 1 } else { 0 }*(2_i32.pow(i.try_into().unwrap())) as i32); // brain

    (gamma_rate, epsilon_rate)
}

fn day3_p2(mut file_contents: String) -> (u32, u32){
    let num_of_bits= file_contents.lines()
        .nth(0).expect("couldn't get element 0, .expect better than .unwrap!")
        .len();
    let mut trimmed_file_contents = String::new();
    let  file_contents2 = file_contents.clone();

    // oxygen
    for i in 0..num_of_bits {
        trimmed_file_contents.clear();
        let most_common_bit = most_common_bit_in_column(&file_contents, i, 1);

        for line in file_contents.lines(){
            if line.chars().nth(i).unwrap().to_digit(10).unwrap() == most_common_bit as u32 {
                trimmed_file_contents.push_str(line);
                trimmed_file_contents.push('\n');
            }
        }
        file_contents = trimmed_file_contents.clone();
    }

    remove_all_thats_not_a_0_or_a_1(&mut file_contents);

    // convert the string to binary number
    let oxygen_generator_rating = file_contents.chars()
        .rev()
        .enumerate()
        .fold(0, |acc, (i, x)| acc + x.to_digit(2).unwrap()*(2_i32.pow(i.try_into().unwrap())) as u32); // brain

    // CO2
    file_contents = file_contents2;
    for i in 0..num_of_bits {
        trimmed_file_contents.clear();
        let most_common_bit = most_common_bit_in_column(&file_contents, i, 0);

        for line in file_contents.lines(){
            if line.chars().nth(i).unwrap().to_digit(10).unwrap() == most_common_bit as u32 {
                trimmed_file_contents.push_str(line);
                trimmed_file_contents.push('\n');
            }
        }
        file_contents = trimmed_file_contents.clone();
    }

    remove_all_thats_not_a_0_or_a_1(&mut file_contents);

    // convert the string to binary number
    let CO2_scrubber_rating = file_contents.chars()
        .rev()
        .enumerate()
        .fold(0, |acc, (i, x)| acc + x.to_digit(2).unwrap()*(2_i32.pow(i.try_into().unwrap())) as u32); // brain

    (oxygen_generator_rating,CO2_scrubber_rating)
}

fn most_common_bit_in_column(file_contents: &str, index: usize, preference: i32) -> i32 {
    let mut num_of_1s = 0;
    let mut num_of_rows = 0;

    for line in file_contents.lines(){
        if line.chars().nth(index).unwrap() == '1' {
            num_of_1s += 1;
        }
        num_of_rows += 1;
    }
    if num_of_1s > num_of_rows / 2 {
        return 1;
    } else if num_of_1s < num_of_rows / 2 {
        return 0;
    } else {
        return preference;
    }
}

fn remove_all_thats_not_a_0_or_a_1(file_contents: &mut String){
    let mut temp_crap: String = String::new();
    for ch in file_contents.chars(){ // file_contents is being borrowed
        if ch != '0' && ch != '1' {
            temp_crap = file_contents.trim_matches(ch).to_string(); // need a temporary var because file_contents is being borrowed
        }
    }
    *file_contents = temp_crap; // gotta deference it to change it
}