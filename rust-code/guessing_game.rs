extern crate rand;

use std::io;
use rand::Rng;
use std::cmp::Ordering;
use std::io::Write;

fn main() {



    println!("Brute force PoC");
    println!("===============");
    println!(" 	");
    println!("34 64 a9 09 a0 7a");
    println!("58 91 cf 61 53 f5");

    let secret_number = rand::thread_rng()
        .gen_range(1,101);
    println!("Random code: {}", secret_number);


    loop {
	    let mut guess = String::new();
        println!("---");
        print!("Code: ");

        io::stdout()
            .flush()
            .unwrap();

        io::stdin()
            .read_line(&mut guess)
            .expect("Failed to read line");

        println!("guess: {}", guess);
        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => continue,
        };

        println!("guess: {}", guess);
        match guess.cmp(&secret_number) {
            Ordering::Less      => println!("Too small!"),
            Ordering::Greater   => println!("Too big!"),
            Ordering::Equal     => { 
                println!("Equal!");
                break;
            },
        }
    }


}
