package Doodle;

use 5.014;

use Data::Object 'Class', 'Doodle::Library';

use Doodle::Command;
use Doodle::Schema;
use Doodle::Table;

use Data::Object::Space;

# VERSION

has commands => (
  is => 'ro',
  isa => 'Commands',
  bld => 'new_commands',
  lzy => 1
);

# BUILD

fun new_commands($self) {
  return do('array', []);
}

# METHODS

method table(Str $name, Any %args) {
  $args{doodle} = $self;

  my $table = Doodle::Table->new(%args, name => $name);

  return $table;
}

method schema(Str $name, Any %args) {
  $args{doodle} = $self;

  my $schema = Doodle::Schema->new(%args, name => $name);

  return $schema;
}

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

method statements(Grammar $grammar) {
  my $statements = do('array', []);

  for my $command ($self->commands->list) {
    $statements->push($grammar->execute($command));
  }

  return $statements;
}

method build(Grammar $grammar, CodeRef $callback) {
  my $statements = $self->statements($grammar);

  for my $statement ($statements->list) {
    $callback->($statement);
  }

  return;
}

method grammar(Str $type) {
  my $class = join '::', __PACKAGE__, 'Grammar', ucfirst $type;

  my $space = Data::Object::Space->new($class);

  my $grammar = $space->build;

  return $grammar;
}

1;
