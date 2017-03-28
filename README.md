# fast-http-server

Super fast, zero configuration command line HTTP Server written in Crystal programming language.

## Usage

Zero configuration.

`fast-http-server`

By default fast-http-server listens port 3000. Go to `localhost:3000`.

To listen on a different port you can start `fast-http-server` with `-p` `--port` option.

`fast-http-server -p 5050`

# Fast

Numbers speak louder than words.

| Server | Request Per Second  | Avg. Response Time |
| :------------ |:---------------:| -----:|
| fast-http-server (***Crystal***)    | 18348.47 | 8.67ms  |
| http-server (***Node.js***)     | 2105.55        |   47.92ms |
| SimpleHTTPServer (***Python***) | 785.14     |  1.91ms |


## Installation

### OS X

You can install `fast-http-server` via Brew.

```
brew tap sdogruyol/fast-http-server
brew install fast-http-server
```

### Manual

`fast-http-server` requires  [Crystal](http://crystal-lang.org/) 0.10.0. You can install it [here](http://crystal-lang.org/docs/installation/index.html)

```
git clone https://github.com/sdogruyol/fast-http-server
crystal build --release src/fast-http-server.cr
mv fast-http-server /usr/local/bin/fast-http-server
```

