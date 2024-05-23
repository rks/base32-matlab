# base32-matlab

Base32 library for MATLAB.

## Overview

> Base32 is a notation for encoding arbitrary byte data using a restricted set of
> symbols that can be conveniently used by humans and processed by computers.

—[Wikipedia](https://en.wikipedia.org/wiki/Base32)

This `base32` library currently only includes one implementation ("[Crockford's Base32](https://www.crockford.com/base32.html)"),
and a single function (generate a random string).

## HOWTO

### Generate a random Base32 string

```matlab
str = base32.Crockford.random(10);

disp(str)
```
