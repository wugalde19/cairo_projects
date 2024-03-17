// Constants
const ONE_HOUR_IN_SECONDS: u32 = 3600;

// Constant using macro to compute value at runtime
const ONE_HOUR_IN_SECONDS_RUN_TIME: u32 = consteval_int!(60 * 60);

fn main() {
    println!("===== Concepts");
    println!("## Variables and Mutability");
    // Make variable mutable so that we can change its value
    // To do this we use the `mut` keyword
    let mut x = 5;
    println!("The value of x is: {}", x);
    x = 6;
    println!("The value of x is: {}", x);

    println!("## Data Types");
    println!("## Functions");
    println!("## Comments");
    println!("## Control Flow");
}

