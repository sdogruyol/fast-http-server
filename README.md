# fast-http-server

Super fast, zero configuration command line HTTP Server written in Crystal.

[![Stars](https://img.shields.io/github/stars/sdogruyol/fast-http-server?style=flat-square&label=%20&color=gold)](https://github.com/sdogruyol/fast-http-server)
[![CI](https://img.shields.io/github/actions/workflow/status/sdogruyol/fast-http-server/ci.yml?style=flat-square)](https://github.com/sdogruyol/fast-http-server/actions/workflows/ci.yml)
[![Release](https://img.shields.io/github/v/release/sdogruyol/fast-http-server?style=flat-square)](https://github.com/sdogruyol/fast-http-server/releases)
![Crystal](https://img.shields.io/badge/Crystal-1.0+-%23000?style=flat-square&logo=crystal)
[![License](https://img.shields.io/github/license/sdogruyol/fast-http-server?style=flat-square)](LICENSE)
![Built with Crystal](https://img.shields.io/badge/Built%20with-Crystal-776791?style=flat-square&logo=crystal)

---

## Quick Start

```bash
crystal run src/fast-http-server.cr
```

Or build and run:

```bash
shards build --release
./bin/fast-http-server
```

Open http://localhost:3000 - done. 🚀

---

## Features

- ⚡ **Zero config** - Run and go, defaults to port 3000
- 📁 **Static file serving** - Serves files from current directory or specified path
- 🔗 **Index redirect** - Automatically redirects `/blog/` to `/blog/index.html`
- 📂 **Directory listing** - Browse directories in browser (can be disabled)
- 🚀 **25K req/sec** - Fast enough for most use cases

---

## Why fast-http-server?

| Problem | Solution |
|---------|----------|
| "I just need to serve static files quickly" | One command, no config |
| "Python http.server is slow" | Crystal native speed, 25K req/sec |
| "I don't want Node/npm for a static server" | Single binary, no dependencies |
| "I need directory listing" | Built-in, toggle on/off |

---

## Usage

```bash
fast-http-server [port]
```

| Argument | Default | Description |
|----------|---------|-------------|
| `port` | 3000 | Port to listen on |
| `-d, --directory` | `.` | Directory to serve |
| `-l, --listdir` | `yes` | Enable/disable directory listing |

### Examples

```bash
# Serve on port 5050
fast-http-server 5050

# Serve a specific directory
fast-http-server -d ./public

# Disable directory listing
fast-http-server -l no -d ./public
```

---

## Installation

### Option 1: Build from source

Requires Crystal 1.0+.

```bash
git clone https://github.com/sdogruyol/fast-http-server
cd fast-http-server
shards build --release
mv bin/fast-http-server /usr/local/bin/fast-http-server
```

### Option 2: Quick alias

Add to your `.bashrc`, `.zshrc`, or config file:

```bash
alias fhs='fast-http-server'
```

---

## Performance

~25,000 requests/sec on modest hardware.

```
wrk -c 100 -d 20 -t 4 http://localhost:3000

Requests/sec:  25102.60
Transfer/sec:  22.81MB
Latency (avg): 3.98ms
Latency (p99): 5.86ms
```

---

## FAQ

**How is this different from Python's http.server?**

fast-http-server is ~50x faster, written in Crystal, and supports directory listing with index redirect out of the box.

**Does it support HTTPS?**

Not yet. For production, put it behind a reverse proxy like nginx or Caddy.

**Can I use it in production?**

It's designed for development and quick file sharing. For production, use nginx or Caddy.

---

## Sponsors

If fast-http-server helps you, consider [sponsoring](https://github.com/sponsors/sdogruyol). Every dollar helps me keep building open source tools full time.

[![Sponsor](https://img.shields.io/badge/Sponsor-30363D?style=flat-square&logo=githubsponsors&logoColor=white)](https://github.com/sponsors/sdogruyol)

---

## License

MIT