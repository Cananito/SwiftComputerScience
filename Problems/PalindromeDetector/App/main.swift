import Problems_PalindromeDetector_PalindromeDetector

func printInputRequest() {
    print("> Enter a word to check if it's palindrome:")
}

printInputRequest()
while let input = readLine() {
    if input.isEmpty {
        print("Empty so... sure?")
    } else if input.lowercased().withoutWhiteSpaces().isPalindrome() {
        print("Yep")
    } else {
        print("Nope")
    }
    printInputRequest()
}
