package Doodle::Index;

use 5.014;

use Data::Object 'Class', 'Doodle::Library';

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

has columns => (
  is => 'ro',
  isa => 'ArrayRef[Str]',
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
  my $columns = $self->columns;

  push @parts, $table->name;
  push @parts, @{$columns};

  return join '_', 'indx', @parts;
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
  $args{indices} = do('array', [$self]);

  my $command = $self->doodle->index_create(%args);

  return $command;
}

method delete(Any %args) {
  my $table = $self->table;

  $args{table} = $table;
  $args{schema} = $table->schema if $table->schema;
  $args{indices} = do('array', [$self]);

  my $command = $self->doodle->index_delete(%args);

  return $command;
}

method unique() {
  $self->data->{unique} = 1;

  return $self;
}

1;
