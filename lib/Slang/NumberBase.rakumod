my role Grammar {
    # Patch the <number> rule to add our own numeric type.
    token number:sym<base> {
        $<base>=<[₀₁₂₃₄₅₆₇₈₉]>+ $<value>=[ \d+ [ '.' \d+ ]? ]
    }
}

my role Actions {
    method number:sym<base>(Mu $/) {
        my $value := $<value>.Str.Numeric
          .base($<base>.Str.trans('₀₁₂₃₄₅₆₇₈₉' => '0123456789').Numeric);

        # Running under the Raku grammar
        if self.^name.starts-with('Raku::') {
            use experimental :rakuast;
            make RakuAST::Literal.from-value($value);
        }

        # Running under the legacy grammar
        else {
            use QAST:from<NQP>;
            $*W.add_object_if_no_sc($value);
            make $value ~~ Int
              ?? QAST::IVal.new(:$value)
              !! QAST::WVal.new(:$value);
        }
    }
}

use Slangify:ver<0.0.4+>:auth<zef:lizmat> Grammar, Actions;

# vim: expandtab shiftwidth=4
