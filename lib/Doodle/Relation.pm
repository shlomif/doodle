package Doodle::Relation;

use 5.014;

use Data::Object 'Class', 'Doodle::Library';

with 'Doodle::Relation::Helpers';

# VERSION

has name => (
  is => 'ro',
  isa => 'Any',
  bld => 'new_name',
  lzy => 1
);

has table => (
  is => 'ro',
  isa => 'Table',
  req => 1
);

has column => (
  is => 'ro',
  isa => 'Str',
  req => 1
);

has foreign_table => (
  is => 'ro',
  isa => 'Str',
  req => 1
);

has foreign_column => (
  is => 'ro',
  isa => 'Str',
  req => 1
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

fun new_name($self) {
  my @parts;

  my $table = $self->table;
  my $column = $self->column;
  my $ftable = $self->foreign_table;
  my $fcolumn = $self->foreign_column;

  push @parts, $table->name, $column, $ftable, $fcolumn;

  return join '_', 'fkey', @parts;
}

# METHODS

method doodle() {
  my $doodle = $self->table->doodle;

  return $doodle;
}

method create(Any %args) {
  my $table = $self->table;

  $args{table} = $table;
  $args{schema} = $table->schema if $table->schema;
  $args{relation} = $self;

  my $command = $self->doodle->relation_create(%args);

  return $command;
}

method delete(Any %args) {
  my $table = $self->table;

  $args{table} = $table;
  $args{schema} = $table->schema if $table->schema;
  $args{relation} = $self;

  my $command = $self->doodle->relation_delete(%args);

  return $command;
}

1;
