use anyhow::{Context, Result};
use clap::Parser;
use rust::library;

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
    match run() {
        Ok(_) => println!("OK"),
        Err(e) => {
            eprintln!("ERROR {:#}", e);
            std::process::exit(1);
        }
    }
}

/// Describe function here
fn run() -> Result<()> {
    println!("Answer: {}", library());
    let _ = buggy()?;
    Ok(())
}

/// Buggy function
pub fn buggy() -> Result<i32> {
    let bug = root_cause().context("there was a bug");
    bug
}

/// Root cause of the bug
pub fn root_cause() -> Result<i32> {
    anyhow::bail!("root cause")
}
