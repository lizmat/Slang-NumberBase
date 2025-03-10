[![Actions Status](https://github.com/lizmat/Slang-NumberBase/actions/workflows/linux.yml/badge.svg)](https://github.com/lizmat/Slang-NumberBase/actions) [![Actions Status](https://github.com/lizmat/Slang-NumberBase/actions/workflows/macos.yml/badge.svg)](https://github.com/lizmat/Slang-NumberBase/actions) [![Actions Status](https://github.com/lizmat/Slang-NumberBase/actions/workflows/windows.yml/badge.svg)](https://github.com/lizmat/Slang-NumberBase/actions)

NAME
====

Slang::NumberBase - provide number base literals

SYNOPSIS
========

```raku
use Slang::NumberBase;

say ₈123.45;   # 173.346315
say ₃₆123.45;  # 3F.G77777
```

DESCRIPTION
===========

The `Slang::NumberBase` distribution provides a slang that will interprete literal numeric values that start with subscripted digits ("₀₁₂₃₄₅₆₇₈₉") as the number base in which the numeric value should be expressed.

So in effect "₈123.45" is short for "123.45.base(8)".

Note that only number bases 2..36 are currently supported, as these are the values that are supported by the [`base`](https://docs.raku.org/routine/base) method.

ACKNOWLEDGEMENTS
================

Tom Browder for the idea.

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/Slang-NumberBase . Comments and Pull Requests are welcome.

If you like this module, or what I'm doing more generally, committing to a [small sponsorship](https://github.com/sponsors/lizmat/) would mean a great deal to me!

COPYRIGHT AND LICENSE
=====================

Copyright 2025 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

