# base32

A Base32 library for MATLAB.

## Description

*Base32 is a notation for encoding arbitrary byte data using a restricted set of symbols that can be conveniently used by humans and processed by computers.* \
— [Wikipedia](https://en.wikipedia.org/wiki/Base32)

## Features

This library includes one Base32 implementation:

- [Crockford's Base32](https://www.crockford.com/base32.html)

### Crockford

**`base32.Crockford.random`** \- Generates a random Base32 string.

```matlab
str = base32.Crockford.random(10);

disp(str)
```
