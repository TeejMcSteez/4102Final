## Docs

[Install Docs](https://www.swift.org/install/linux/)
[Language Docs](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/)

## Basic Setup 

Command used to make this template

```bash
swift package init --name final --type executable
```

To ensure setup run . . .

```bash
swift run
```

## Setup

To run setup.sh first make it an executable on the machine, `sudo chmod +x setup.sh`

Then simply `sudo ./setup.sh` and this should one shot update, install curl and gpg, curl swift, unpackage it, runs it's install script, and then download the recommended packages after swift's setup.

## TODO

4 Data Types With 2 Methods

1. ?
2. Integer (UInt16 & UInt32)
    1. init for different types of integers (UInt32/UInt16)
    2. integer.bigEndian
3. String (body & header)
    1. withCString
    2. `(body.utf8.count)`
4. Pointer -> `withUnsafePointer(to: &addr)`
    1. withUnsafePointer
    2. withMemoryRebound

2 Major Data Structures & 2 Major Control Structures

Data Structures:
1. Using C Union/Struct (addr)
2. Struct (Response Struct)

Control Structures:
1. While loop
2. Continue

Exception Handling or Concurrency

1. Basic error handling with do-catch
    1. Run states that it can throw an error
    2. do { try `expression` } will try to run the expression
    3. catch can handle the error gracefully much like Javascript and Java