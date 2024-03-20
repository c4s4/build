use clap::Parser;

/// Describe project here
#[derive(Parser)]
#[command(version)]
struct Cli {
    /// Describe argument here
    #[clap(default_value = "test")]
    arg: String,
}

fn main() {
    // parse command line arguments
    let args = Cli::parse();
    // print argument
    println!("Argument: {}", args.arg);
    // run function
    run();
}

/// Describe function here
fn run() {
    println!("Hello World!")
}
