## Etc.

I have to swift run and swift build in a WSL instance as the Windows install does not work for me.

Though we are building for Linux so I assume it won't be that big of a deal. If your are on Windows I recommend to use a WSL Linux distribution to compile to run Swift programs.

[WSL Docs](https://learn.microsoft.com/en-us/windows/wsl/install)

## Closures

Closures in Swift are basically anonymous functions or lambdas as they grab information from within the closure.

[Source](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures/)

## Unsafe Memory

Working with pointers in Swift is a little weird, as there are helper functions to do most of the functionality to handle memory for you.

withUnsafePointer invoked the given closure with a pointer to the argument needed for are program to pass the address to the bind function in C.

To work with an unsafe pointer a way is to use withMemoryRebound as it executes the given closure while copying the information passed to it as a buffer.

## Placeholder values and Unamed Variables

Alongside that to work with placeholder values in closures Swift uses a indexing syntax, for example to take the first argument passed by the closure one can use $0 as seen in the code.

With placeholder values their are also unamed variables as return values inside a closure don't matter in are case. We just want to bind to the socket.

## C String Helper Function

withCString is a simple Swift helper that represents the given closure as a null terminated string this is needed to write our Swift string to the file descriptor in C used for the socket. 