# fast-http-server

[![CI](https://github.com/sdogruyol/fast-http-server/actions/workflows/ci.yml/badge.svg)](https://github.com/sdogruyol/fast-http-server/actions/workflows/ci.yml)

Super fast, zero configuration command line HTTP Server written in Crystal programming language.

## Features

- **Zero config** — Run and go, defaults to port 3000
- **Static file serving** — Serves files from current directory or specified path
- **Index redirect** — Automatically redirects `/blog` and `/blog/` to `/blog/index.html`
- **Directory listing** — Browse directories in browser (can be disabled with `-l no`)
- **High performance** — ~25K requests/sec (see benchmarks below)

## Usage

Zero configuration: `fast-http-server` and your server's ready.

```
usage: fast-http-server [-h] [-d DIR] [port]

positional arguments:
    port                             specify alternate port [default: 3000]

optional arguments:
    -h, --help                       show this help message and exit
    -d DIR, --directory DIR          specify a directory
    -l LIST, --listdir LIST          enable/disable directory listing (yes/no)
```

By default fast-http-server listens on port 3000. Go to `localhost:3000`.

**Examples:**

```bash
# Different port
fast-http-server 5050

# Specific directory
fast-http-server -d example_directory

# Disable directory listing
fast-http-server -l no -d ./public
```

## Performance

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

`fast-http-server` requires [Crystal](https://crystal-lang.org/) 1.0.0+. Install it [here](https://crystal-lang.org/install/).

```bash
git clone https://github.com/sdogruyol/fast-http-server
cd fast-http-server
shards build --release
mv bin/fast-http-server /usr/local/bin/fast-http-server
```

**Protip**

For quick use, add to your `.bashrc`, `.zshrc`, or profile file:

```bash
alias fhs='fast-http-server'
```
