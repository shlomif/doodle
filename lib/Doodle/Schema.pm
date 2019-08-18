package Doodle::Schema;

use 5.014;

use Data::Object 'Class', 'Doodle::Library';

with 'Doodle::Schema::Helpers';

use Doodle::Table;

# VERSION

has doodle => (
  is => 'ro',
  isa => 'Doodle',
  req => 1
);

has name => (
  is => 'ro',
  isa => 'Str',
  req => 1
);

has temporary => (
  is => 'ro',
  isa => 'Bool',
);

has data => (
  is => 'ro',
  isa => 'Data',
  bld => 'new_data',
  lzy => 1
);

# BUILD

fun new_data($self) {
  return do('hash', {});
}

# METHODS

method table(Str $name, Any %args) {
  $args{doodle} = $self->doodle;

  my $table = Doodle::Table->new(%args, name => $name);

  return $table;
}

method create(Any %args) {
  $args{schema} = $self;

  my $command = $self->doodle->schema_create(%args);

  return $command;
}

method delete(Any %args) {
  $args{schema} = $self;

  my $command = $self->doodle->schema_delete(%args);

  return $command;
}

1;
