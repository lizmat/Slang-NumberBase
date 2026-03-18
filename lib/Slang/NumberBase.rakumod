my role Grammar {
    # Patch the <number> rule to add our own numeric type.
    token number:sym<base> {
        $<prebase>=<[₀₁₂₃₄₅₆₇₈₉]>+ $<value>=[ \d+ [ '.' \d+ ]? ]
         | $<value>=[
             <[a..z A..Z 0..9]>+ [ '.' <[a..z A..Z 0..9]>+ ]?
           ] $<postbase>=<[₀₁₂₃₄₅₆₇₈₉]>+
    }
}

my role Actions {
    method number:sym<base>(Mu $/) {

        # ₈123.45
        my $value := do if $<prebase> -> $prebase {
            my $base := $prebase.Str.trans('₀₁₂₃₄₅₆₇₈₉' => '0123456789').Int;
            die "Base must be between 2 and 36 inclusive: $base"
              if $base < 1 || $base > 36;
            $<value>.Str.Numeric.base($base)

        }

        # FF₁₆
        else {
            my $base := $<postbase>.Str.trans('₀₁₂₃₄₅₆₇₈₉' => '0123456789').Int;
            die "Base must be between 2 and 36 inclusive: $base"
              if $base < 1 || $base > 36;
            $<value>.Str.parse-base($base);
        }

        # Running under the legacy grammar
        if Raku.legacy {
            use QAST:from<NQP>;
            $*W.add_object_if_no_sc($value);

            make ($value ~~ Str
                   ?? QAST::SVal
                   !! $value ~~ Int
                     ?? QAST::IVal
                     !! QAST::WVal
                 ).new(:$value);
        }

        # Running under the Raku grammar
        else {
            use experimental :rakuast;
            make RakuAST::Literal.from-value($value);
        }
    }
}

use Slangify:ver<0.0.4+>:auth<zef:lizmat> Grammar, Actions;

# vim: expandtab shiftwidth=4
