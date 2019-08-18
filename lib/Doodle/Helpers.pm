package Doodle::Helpers;

use 5.014;

use Data::Object 'Role', 'Doodle::Library';

# VERSION

# METHODS

method schema_create(Any %args) {
  $args{doodle} = $self;

  my $command = Doodle::Command->new(%args, name => 'create_schema');

  $self->commands->push($command);

  return $command;
}

method schema_delete(Any %args) {
  $args{doodle} = $self;

  my $command = Doodle::Command->new(%args, name => 'delete_schema');

  $self->commands->push($command);

  return $command;
}

method table_create(Any %args) {
  $args{doodle} = $self;

  my $command = Doodle::Command->new(%args, name => 'create_table');

  $self->commands->push($command);

  return $command;
}

method table_delete(Any %args) {
  $args{doodle} = $self;

  my $command = Doodle::Command->new(%args, name => 'delete_table');

  $self->commands->push($command);

  return $command;
}

method table_rename(Any %args) {
  $args{doodle} = $self;

  my $command = Doodle::Command->new(%args, name => 'rename_table');

  $self->commands->push($command);

  return $command;
}

method column_create(Any %args) {
  $args{doodle} = $self;

  my $command = Doodle::Command->new(%args, name => 'create_column');

  $self->commands->push($command);

  return $command;
}

method column_update(Any %args) {
  $args{doodle} = $self;

  my $command = Doodle::Command->new(%args, name => 'update_column');

  $self->commands->push($command);

  return $command;
}

method column_rename(Any %args) {
  $args{doodle} = $self;

  my $command = Doodle::Command->new(%args, name => 'rename_column');

  $self->commands->push($command);

  return $command;
}

method column_delete(Any %args) {
  $args{doodle} = $self;

  my $command = Doodle::Command->new(%args, name => 'delete_column');

  $self->commands->push($command);

  return $command;
}

method index_create(Any %args) {
  $args{doodle} = $self;

  my $command = Doodle::Command->new(%args, name => 'create_index');

  $self->commands->push($command);

  return $command;
}

method index_delete(Any %args) {
  $args{doodle} = $self;

  my $command = Doodle::Command->new(%args, name => 'delete_index');

  $self->commands->push($command);

  return $command;
}

method relation_create(Any %args) {
  $args{doodle} = $self;

  my $command = Doodle::Command->new(%args, name => 'create_relation');

  $self->commands->push($command);

  return $command;
}

method relation_delete(Any %args) {
  $args{doodle} = $self;

  my $command = Doodle::Command->new(%args, name => 'delete_relation');

  $self->commands->push($command);

  return $command;
}

1;
