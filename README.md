[![Actions Status](https://github.com/lizmat/Slang-NumberBase/actions/workflows/linux.yml/badge.svg)](https://github.com/lizmat/Slang-NumberBase/actions) [![Actions Status](https://github.com/lizmat/Slang-NumberBase/actions/workflows/macos.yml/badge.svg)](https://github.com/lizmat/Slang-NumberBase/actions) [![Actions Status](https://github.com/lizmat/Slang-NumberBase/actions/workflows/windows.yml/badge.svg)](https://github.com/lizmat/Slang-NumberBase/actions)

NAME
====

Slang::NumberBase - provide number base literal conversions

SYNOPSIS
========

```raku
use Slang::NumberBase;

dd ₈123.45;   # "173.346315"
dd ₃₆123.45;  # "3F.G77777"

dd FF₁₆;    # 255
dd 377.7₈;  # 255.875
```

DESCRIPTION
===========

The `Slang::NumberBase` distribution provides a slang that will interpret literal numeric values that either start or end with subscripted digits ("₀₁₂₃₄₅₆₇₈₉") (such as ₈123.45 and FF₁₆).

In the case of prefixed subscripts, the value is taken as the base to which a numeric value should be converted to as a string. So in effect "₈123.45" is short for "123.45.base(8)".

In the case of postfixed subscripts, the value is taken as the base with which to interprete the string to create a numeric value. So in effect "FF₁₆" is short for "FF".parse-base(16).

Note that only number bases 2..36 are currently supported, as these are the values that are supported by the [`base`](https://docs.raku.org/routine/base) and [`base`](https://docs.raku.org/routine/parse-base) methods.

ACKNOWLEDGEMENTS
================

Tom Browder for the idea, and Will Coleda for wanting the postfix version.

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/Slang-NumberBase . Comments and Pull Requests are welcome.

If you like this module, or what I'm doing more generally, committing to a [small sponsorship](https://github.com/sponsors/lizmat/) would mean a great deal to me!

COPYRIGHT AND LICENSE
=====================

Copyright 2025, 2026 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

