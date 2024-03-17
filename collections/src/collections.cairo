fn main () {
    println!("## ARRAYS ##");
    let mut a = ArrayTrait::new();
    a.append(0);
    a.append(1);
    a.append(2);

    // Set type of values
    let mut arr = ArrayTrait::<u128>::new();
    // or
    let mut arr:Array<u128> = ArrayTrait::new();

    // You can only remove elements from the front of an array by using the pop_front()
    // method. This method returns an Option<T> type, which will be None if the array is
    // empty, and Some(T) if the array is not empty.
    let first_value = a.pop_front().unwrap();
    println!("The first value is {}", first_value);

    // Reading Elements from an Array (get or at)
    // arr.at(index) is equivalent to using the subscripting operator arr[index].
    let first = a.get(0).unwrap();

    let mut arr = ArrayTrait::<u128>::new();
    arr.append(100);
    // Change this value to see different results, what would happen if the index doesn't exist?
    let index_to_access = 0;
    match arr.get(index_to_access) {
        Option::Some(x) => {
            // Don't worry about * for now, if you are curious see Chapter 4.2 #desnap operator
            // It basically means "transform what get(idx) returned into a real value"
            *x.unbox()
        },
        Option::None => { panic!("out of bounds") }
    }

    // The at function, on the other hand, directly returns a snapshot to the element at the
    // specified index using the unbox()
    // You should only use at when you want the program to panic
    let first = *a.at(0);
    let second = *a.at(1);

    // If you want to use the subscripting operator arr[index], you will need to explicitly
    // define the type of the elements of the array, otherwise it will not compile.
    let mut a: Array<felt252> = ArrayTrait::new();
    a.append(0);
    a.append(1);

    let first = a[0];
    let second = a[1];

    // array! is a macro that creates an array from a list of elements
    // Compiler will infer the type of the array
    let arr = array![1, 2, 3, 4, 5];

    // Storing multiple types with Enums
    let mut messages: Array<Data> = array![];
    messages.append(Data::Integer(100));
    messages.append(Data::Felt('hello world'));
    messages.append(Data::Tuple((10, 30)));

    // Span
    // Span is a struct that represents a snapshot of an Array
    // designed to provide safe and controlled access to the elements of
    // an array without modifying the original array
    let span = arr.span();

    println!("## DICTIONARIES ##");
}

#[derive(Copy, Drop)]
enum Data {
    Integer: u128,
    Felt: felt252,
    Tuple: (u32, u32),
}