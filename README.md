# fast-http-server

Super fast, zero configuration command line HTTP Server written in Crystal programming language.

## Usage

Zero configuration: `fast-http-server`  and your server's ready.

```
usage: fast-http-server [-h] [-d DIR] [port]

positional arguments:
    port                             specify alternate port [default: 3000]

optional arguments:
    -h, --help                       show this help message and exit
    -d DIR, --directory DIR          specify a directory
    -l LIST, --listdir LIST          enable/disable directory listing (yes/no)
```

By default fast-http-server listens port 3000. Go to `localhost:3000`.

To listen on a different port you can start `fast-http-server` with the desired port:
`fast-http-server 5050`

To choose a directory: `fast-http-server -d example_directory`


# Fast

```
$ wrk -c 100 -d 20 -t 4 --latency http://localhost:3000

Running 20s test @ http://localhost:3000
  4 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     3.98ms  615.13us  12.73ms   77.06%
    Req/Sec     6.31k   347.48     7.05k    77.88%
  Latency Distribution
     50%    3.87ms
     75%    4.27ms
     90%    4.75ms
     99%    5.86ms
  502556 requests in 20.02s, 456.75MB read
Requests/sec:  25102.60
Transfer/sec:     22.81MB
```

## Installation

### OS X

You can install `fast-http-server` via Brew.

```
brew tap sdogruyol/fast-http-server
brew install fast-http-server
```

### Manual

`fast-http-server` requires  [Crystal](http://crystal-lang.org/) 0.27.0 You can install it [here](http://crystal-lang.org/docs/installation/index.html)

```
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
