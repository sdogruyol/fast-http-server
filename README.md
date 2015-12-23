# fast-http-server

Super fast, zero configuration command line HTTP Server.

## Installation

```
git clone https://github.com/sdogruyol/fast-http-server
crystal build --release src/fast-http-server.cr
mv fast-http-server /usr/local/bin/fast-http-server
```

## Usage

Zero configuration.

`fast-http-server`

By default fast-http-server listens port 3000. Go to `localhost:3000`.

To listen on a different port you can start `fast-http-server` with `-p` `--port` option.

`fast-http-server -p 5050`

## Contributing

1. Fork it ( https://github.com/sdogruyol/fast-http-server/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [sdogruyol](https://github.com/sdogruyol) Serdar Dogruyol - creator, maintainer
