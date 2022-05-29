fn main() {
    let file_contents = include_str!("input.txt");

    // Part 1
    let (winning_table_sum, winning_guess) = day4_p1(&file_contents);
    println!("Winning table sum = {}, winning_guess = {} | {} * {} = {}", 
        winning_table_sum,winning_guess,winning_table_sum,winning_guess,winning_table_sum*winning_guess);

    // Part 2
    //let (oxygen_generator_rating, CO2_scrubber_rating) = day4_p2(file_contents);
}

fn day4_p1(file_contents: &str) -> (i32, i32){
    // u32 vs i32 vs usize vs isize
    // usize gives you the guarantee to be always big enough to hold any pointer or any offset in a data structure, while u32 can be too small on some architectures.
    // usize has bigger memory footprint but is garanted to have suficient space in any architecture. 
    // usize - Use for memory size, index, offset related
    // i32 / u32 - Use for actual integers
    // u32 = unsigned int - [min=0, max = 4294967295]
    // i32 = int - [min=-2147483648, max = 2147483647]

    let (guesses, mut tables) = extract_info(file_contents);
    let mut winning_table_index = 0;
    let mut winning_guess = 0;
    let tables_safe = tables.clone();

    for guess in guesses {
        scrap_guess(guess, &mut tables);
        winning_table_index = ckeck_winners(&mut tables);
        winning_guess = guess;
        if winning_table_index != -1 {
            break;
        }
    }

    let winning_table_sum: i32 = sum_table(tables_safe, winning_table_index);

    (winning_table_sum, winning_guess)
}

fn extract_info(file_contents: &str) -> (Vec<i32>, Vec<Vec<Vec<i32>>>) {
    let (guesses, tables) = file_contents.split_once("\n\n").unwrap();

    let guesses: Vec<i32> = guesses
        .lines().nth(0).unwrap() // take first line of the file
        .split(',') // splits based on
        .map(|x| // allows to transform all the elements at the same time
            x.trim_matches(|c: char| !c.is_numeric()) // check examples, trims all matches that are not alphabetic (witch apperantly wasn't needed)
             .parse::<i32>().unwrap()) // attempts to convert to i32
        .collect(); // returns a vector with all the values of the iterator

    let tables: Vec<Vec<Vec<i32>>> = tables.split("\n\n")
    .map(|x| 
        x.split('\n').map(|h|
            h.split_whitespace()
                .map(|r|
                r.trim_matches(|c: char| !c.is_numeric()) // check examples, trims all matches that are not alphabetic (witch apperantly wasn't needed)
                .parse::<i32>().expect("no deal")
            )
            .collect()
        )
        .collect()
    )
    .collect();

    (guesses, tables)
}

fn scrap_guess(guess: i32, tables: &mut Vec<Vec<Vec<i32>>>){
    for el1 in tables {
        for el2 in el1 {
            for el3 in el2 {
                if *el3 == guess {
                    *el3 = -1;
                }
            }
        }
    }
}

fn ckeck_winners(tables: &mut Vec<Vec<Vec<i32>>>) -> i32 {
    for (i, el1) in tables.iter().enumerate() {

        for (g, el2) in el1.iter().enumerate() {
            if g <= 4 {
                if el1.iter().all(|f| f[g] == -1) {
                    return i as i32; // returns index of winning table
                }
                if el2.iter().all(|f| *f == -1){
                    return i as i32; // returns index of winning table
                }
            }
        }
        
    }
    -1
}

fn sum_table(tables: Vec<Vec<Vec<i32>>>, winning_table_index: i32) -> i32{
    let one_table = tables.iter().nth(winning_table_index as usize).unwrap();
    
    let one_sum = one_table.iter().flat_map(|x| x.iter()).sum();

    one_sum
}

/* 
fn day4_p2(mut file_contents: String) -> (i32, i32){

    let oxygen_generator_rating = 0;
    let CO2_scrubber_rating = 0;
    (oxygen_generator_rating,CO2_scrubber_rating)
}
*/