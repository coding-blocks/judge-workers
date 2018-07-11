package main

import ("bufio"
        "fmt"
        "os"
  )

func main() {
  scanner := bufio.NewScanner(os.Stdin)
  text, _ := scanner.Scan()
  fmt.Println("Hello" + text)
  
}
