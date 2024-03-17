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

    // Shadowing
    // Consists in re-declaring a variable with the same name.
    // Cairo will also consider the scope of the variable
    let y = 5;
    let y = y + 1;
    {
        let y = y * 2;
        println!("Inner scope y value is (12): {}", y);
    }
    println!("Outer scope y value is (6): {}", y);

    println!("## Data Types");
    
    // == Felt Type
    // 
    let three: felt252 = 3;

    //Integer Type
    // 8-bit	u8
    // 16-bit	u16
    // 32-bit	u32
    // 64-bit	u64
    // 128-bit	u128
    // 256-bit	u256
    // 32-bit	usize -> usize alias for u32
    let number: u32 = 5;

    // == Boolean Type
    let f: bool = false;

    // == String Type
    // Cairo uses the felt252 for short strings (limited to 31 characters)
    let string1: felt252 = 'Hello, world!';

    // For longer strings, Cairo uses the ByteArray
    let long_string: ByteArray = "this is a string which has more than 31 characters";
   
    // == Type casting
    let my_felt252 = 10;
    // Since a felt252 might not fit in a u8, we need to unwrap the Option<T> type
    let my_u8: u8 = my_felt252.try_into().unwrap();
    let my_u16: u16 = my_u8.into();
    let my_u32: u32 = my_u16.into();
    let my_u64: u64 = my_u32.into();
    let my_u128: u128 = my_u64.into();
    // As a felt252 is smaller than a u256, we can use the into() method
    let my_u256: u256 = my_felt252.into();
    let my_usize: usize = my_felt252.try_into().unwrap();
    let my_other_felt252: felt252 = my_u8.into();
    let my_third_felt252: felt252 = my_u16.into();

    // == Tuple Type
    let tup: (u32, u64, bool) = (10, 20, true);

    let tup2 = (500, 6, true);
    let (x2, y2, z2) = tup2;
    if y2 == 6 {
        println!("y2 is 6!");
    }

    let (x3, y3): (felt252, felt252) = (2, 3);

    println!("## Functions");
    println!("## Comments");
    println!("## Control Flow");
}

