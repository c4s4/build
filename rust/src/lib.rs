/// This is the answer
pub fn library() -> i32 {
    42
}

//////////////////////////////////// TESTS /////////////////////////////////////

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test() {
        assert_eq!(library(), 42);
    }
}
