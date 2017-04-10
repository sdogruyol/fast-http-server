# fast-http-server

Super fast, zero configuration command line HTTP Server written in Crystal programming language.

## Usage

Zero configuration: `fast-http-server`  and your server's ready.

```haskell
usage: fast-http-server [-h] [-d DIR] [port] 

positional arguments:
    port                             specify alternate port [default: 3000]

optional arguments:
    -h, --help                       show this help message and exit
    -d DIR, --directory DIR          specify a directory
```

By default fast-http-server listens port 3000. Go to `localhost:3000`.  

To listen on a different port you can start `fast-http-server` with the desired port:  
`fast-http-server 5050`  

To choose a directory: `fast-http-server -d example_directory`


# Fast
<!--Really need to update the benchmark + add instructions on how to replicate-->
Numbers speak louder than words.

| Server | Request Per Second  | Avg. Response Time |
| :------------ |:---------------:| -----:|
| fast-http-server (***Crystal***)    | 18348.47 | 8.67ms  |
| http-server (***Node.js***)     | 2105.55        |   47.92ms |
| SimpleHTTPServer (***Python***) | 785.14     |  1.91ms |

## Installation

### OS X

You can install `fast-http-server` via Brew.

<!--little trick to make the code pweetier-->
```haskell
brew tap sdogruyol/fast-http-server
brew install fast-http-server
```

### Manual

`fast-http-server` requires  [Crystal](http://crystal-lang.org/) 0.10.0. You can install it [here](http://crystal-lang.org/docs/installation/index.html)

```haskell
git clone https://github.com/sdogruyol/fast-http-server
crystal build --release src/fast-http-server.cr
mv fast-http-server /usr/local/bin/fast-http-server
```

### Protip

For quick use, add
```bash
alias fhs='fast-http-server'
```
to your `.bashrc` | `.zshrc` | Profile file