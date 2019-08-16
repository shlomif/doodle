use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

statements

=usage

  my $statements = $self->statements;

=description

Returns a set of Statement objects for the given grammar.

=signature

statements(Any @args) : Object

=type

method

=cut

# TESTING

use Doodle;

can_ok "Doodle", "statements";

ok 1 and done_testing;
