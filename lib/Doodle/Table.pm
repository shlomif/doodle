package Doodle::Table;

use 5.014;

use Data::Object 'Class', 'Doodle::Library';

with 'Doodle::Table::Helpers';

use Doodle::Column;
use Doodle::Index;
use Doodle::Relation;

# VERSION

has name => (
  is => 'ro',
  isa => 'Str',
  req => 1
);

has doodle => (
  is => 'ro',
  isa => 'Doodle',
  req => 1
);

has schema => (
  is => 'ro',
  isa => 'Schema',
  opt => 1
);

has columns => (
  is => 'ro',
  isa => 'Columns',
  bld => 'new_columns',
  lzy => 1
);

has indices => (
  is => 'ro',
  isa => 'Indices',
  bld => 'new_indices',
  lzy => 1
);

has relations => (
  is => 'ro',
  isa => 'Relations',
  bld => 'new_relations',
  lzy => 1
);

has data => (
  is => 'ro',
  isa => 'Data',
  bld => 'new_data',
  lzy => 1
);

has engine => (
  is => 'rw',
  isa => 'Str'
);

has charset => (
  is => 'rw',
  isa => 'Str'
);

has collation => (
  is => 'rw',
  isa => 'Str'
);

# BUILD

fun new_data($self) {
  return do('hash', {});
}

fun new_columns($self) {
  return do('array', []);
}

fun new_indices($self) {
  return do('array', []);
}

fun new_relations($self) {
  return do('array', []);
}

# METHODS

method column(Str $name, Any %args) {
  $args{table} = $self;

  my $column = Doodle::Column->new(%args, name => $name);

  $self->columns->push($column);

  return $column;
}

method index(ArrayRef :$columns, Any %args) {
  $args{table} = $self;

  my $index = Doodle::Index->new(%args);

  $self->indices->push($index);

  return $index;
}

method relation(Str $column, Str $ftable, Str $fcolumn = 'id', Any %args) {
  $args{table} = $self;

  $args{column} = $column;
  $args{foreign_table} = $ftable;
  $args{foreign_column} =  $fcolumn;

  my $relation = Doodle::Relation->new(%args);

  $self->relations->push($relation);

  return $relation;
}

method create(Any %args) {
  $args{schema} = $self->schema if $self->schema;

  my $command = $self->doodle->table_create(
    %args,
    table => $self,
    columns => $self->columns,
    indices => $self->indices,
    relations => $self->relations
  );

  return $command;
}

method delete(Any %args) {
  my $schema = $self->schema;

  $args{table} = $self;
  $args{schema} = $schema if $schema;

  my $command = $self->doodle->table_delete(%args);

  return $command;
}

method rename(Str $name, Any %args) {
  my $schema = $self->schema;

  $args{table} = $self;
  $args{schema} = $schema if $schema;

  $self->data->{to} = $name;

  my $command = $self->doodle->table_rename(%args);

  return $command;
}

1;
