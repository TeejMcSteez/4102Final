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

## Notes (TJ)

I have to swift run and swift build in a WSL instance as the Windows install does not work for me.

Though we are building for Linux so I assume it won't be that big of a deal. If your are on Windows I recommend to use a WSL Linux distribution to compile to run Swift programs.

[WSL Docs](https://learn.microsoft.com/en-us/windows/wsl/install)