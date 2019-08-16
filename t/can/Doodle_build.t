use 5.014;

use strict;
use warnings;

use Test::More;

# POD

=name

build

=usage

  my $build = $self->build;

=description

Execute a given callback for each generated SQL statement.

=signature

build(Any @args) : Object

=type

method

=cut

# TESTING

use Doodle;

can_ok "Doodle", "build";

ok 1 and done_testing;
