# SOIC



**Simple cmdline utility to search through all Stack Overflow subdomains from the terminal.**

![SOIC](/img/soic.png)

## Table of contents
- [Installation](##Installation)
- [Cmdline options](##Cmdline-options)
- [Examples](##Examples)

## Installation

- `SOIC` requires [Elixir](https://elixir-lang.org/install.html) libs to be installed on your system.

- Copy `soic` script file from the root to the `../bin` directory (e.g `~/../../usr/local/bin/`) or start `soic` with `./soic` like usual script.

- Or you could build script by yourself with `mix escript.build`

## Cmdline options
```
usage: soic KEYWORD [-n INTEGER]
                    [--num INTEGER]

optional arguments:
  -n, --num          Number of result suggestions (default = 10)
```

## Examples
1. Soic Stack Overflow:
```
soic Hello World
```

2. Soic with size limit:
```
soic Hello World -n 1
```

3. Soic on place
```
./soic Hello World
```