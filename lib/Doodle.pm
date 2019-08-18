package Doodle;

use 5.014;

use Data::Object 'Class', 'Doodle::Library';

with 'Doodle::Helpers';

use Data::Object::Space;

use Doodle::Command;
use Doodle::Schema;
use Doodle::Table;

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
