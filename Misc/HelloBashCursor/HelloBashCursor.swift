import Darwin

/**
 Proof of concept script to illustrate how to print and move the bash cursor around.

 Prerequisite Knowledge:
 - `fflush(__stdoutp)`: Forces output lacking new-line.
 - `\r`: Puts the cursor at the beginning of the line (a.k.a. carriage return).
 - `\u{1B}`: Unicode escape character (`\033` in bash).
 - `7`: When it follows an escape character, it saves the current cursor position.
 - `8`: When it follows an escape character, it restores the cursor position.
 - `[3A`: When it follows an escape character, it moves the cursor UP 3 rows.
 - `[3B`: When it follows an escape character, it moves the cursor DOWN 3 rows.
 - `[3C`: When it follows an escape character, it moves the cursor FORWARD 3 columns.
 - `[3D`: When it follows an escape character, it moves the cursor BACKWARD 3 columns.
 - `[1;0H`: When it follows an escape character, it places the cursor in row 1, column 0.

 Resources:
 - http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x361.html
 - http://ascii-table.com/ansi-escape-sequences.php
 - http://wiki.bash-hackers.org/scripting/terminalcodes
 - https://stackoverflow.com/questions/25483292/update-current-line-with-command-line-tool-in-swift
 */

func oneLineReplaceSimple() {
  for i in 9...13 {
    print("\rHello \(i)", terminator: "")
    fflush(__stdoutp)
    sleep(1)
  }
  print("")
}
//oneLineReplaceSimple()

func oneLineReplace() {
  for i in 9...13 {
    if i != 9 {
      print("\u{1B}8", terminator: "")
    }
    print("\u{1B}7Hello \(i)", terminator: "")
    fflush(__stdoutp)
    sleep(1)
  }
  print("")
}
//oneLineReplace()

func multipleLineReplaceSimple() {
  for i in 9...13 {
    if i != 9 {
      print("\u{1B}8", terminator: "")
    }
    print("\u{1B}7Hello \(i)\nHello \(i)\nHello \(i)")
    sleep(1)
  }
}
//multipleLineReplaceSimple()

func multipleLineReplace() {
  for i in 9...13 {
    if i != 9 {
      print("\r\u{1B}[3A", terminator: "")
    }
    print("Hello \(i)\nHello \(i)\nHello \(i)")
    sleep(1)
  }
}
multipleLineReplace()
