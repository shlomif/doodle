package Doodle::Schema;

use 5.014;

use Data::Object 'Class', 'Doodle::Library';

use Doodle::Table;

# VERSION

has charset => (
  is => 'ro',
  isa => 'Str',
);

has collation => (
  is => 'ro',
  isa => 'Str',
);

has doodle => (
  is => 'ro',
  isa => 'Doodle',
  req => 1
);

has engine => (
  is => 'ro',
  isa => 'Str',
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

  my $command = $self->doodle->schema_create(%args);

  return $command;
}

1;
