/**
 Primary Expressions
 */

// 1 Literal Expression
print(#file, #line, #function, #column)
func logFunctionName(string: String = #function) {
    print(string)
}
func myFunction() {
    logFunctionName() // Prints "myFunction()".
}

