package Doodle::Table::Helpers;

use 5.014;

use Data::Object 'Role', 'Doodle::Library';

# VERSION

# METHODS

method binary(Str $name, Any %args) {
  my $column = $self->column($name);

  $column->binary(%args);

  return $column;
}

method boolean(Str $name, Any %args) {
  my $column = $self->column($name);

  $column->boolean(%args);

  return $column;
}

method char(Str $name, Any %args) {
  my $column = $self->column($name);

  $column->char(%args);

  return $column;
}

method date(Str $name, Any %args) {
  my $column = $self->column($name);

  $column->date(%args);

  return $column;
}

method datetime(Str $name, Any %args) {
  my $column = $self->column($name);

  $column->datetime(%args);

  return $column;
}

method datetime_tz(Str $name, Any %args) {
  my $column = $self->column($name);

  $column->datetime_tz(%args);

  return $column;
}

method decimal(Str $name, Any %args) {
  my $column = $self->column($name);

  $column->decimal(%args);

  return $column;
}

method double(Str $name, Any %args) {
  my $column = $self->column($name);

  $column->double(%args);

  return $column;
}

method enum(Str $name, Any %args) {
  my $column = $self->column($name);

  $column->enum(%args);

  return $column;
}

method float(Str $name, Any %args) {
  my $column = $self->column($name);

  $column->float(%args);

  return $column;
}

method increments_big(Str $name, Any %args) {
  my $column = $self->column($name);

  $column->increments_big(%args);

  return $column;
}

method increments_medium(Str $name, Any %args) {
  my $column = $self->column($name);

  $column->increments_medium(%args);

  return $column;
}

method increments_small(Str $name, Any %args) {
  my $column = $self->column($name);

  $column->increments_small(%args);

  return $column;
}

method integer(Str $name, Any %args) {
  my $column = $self->column($name);

  $column->integer(%args);

  return $column;
}

method integer_big(Str $name, Any %args) {
  my $column = $self->column($name);

  $column->integer_big(%args);

  return $column;
}

method integer_big_unsigned(Str $name, Any %args) {
  my $column = $self->column($name);

  $column->integer_big_unsigned(%args);

  return $column;
}

method integer_medium(Str $name, Any %args) {
  my $column = $self->column($name);

  $column->integer_medium(%args);

  return $column;
}

method integer_medium_unsigned(Str $name, Any %args) {
  my $column = $self->column($name);

  $column->integer_medium_unsigned(%args);

  return $column;
}

method integer_small(Str $name, Any %args) {
  my $column = $self->column($name);

  $column->integer_small(%args);

  return $column;
}

method integer_small_unsigned(Str $name, Any %args) {
  my $column = $self->column($name);

  $column->integer_small_unsigned(%args);

  return $column;
}

method integer_tiny(Str $name, Any %args) {
  my $column = $self->column($name);

  $column->integer_tiny(%args);

  return $column;
}

method integer_tiny_unsigned(Str $name, Any %args) {
  my $column = $self->column($name);

  $column->integer_tiny_unsigned(%args);

  return $column;
}

method integer_unsigned(Str $name, Any %args) {
  my $column = $self->column($name);

  $column->integer_unsigned(%args);

  return $column;
}

method json(Str $name, Any %args) {
  my $column = $self->column($name);

  $column->json(%args);

  return $column;
}

method morphs(Str $name) {
  my $type = "${name}_type";
  my $fkey = "${name}_fkey";

  my $type_column = $self->string($type);
  my $fkey_column = $self->integer($fkey);

  return [$type_column, $fkey_column];
}

method primary(Str $name, Any %args) {
  my $column = $self->column($name);

  $column->increments->primary;

  return $column;
}

method string(Str $name, Any %args) {
  my $column = $self->column($name);

  $column->string(%args);

  return $column;
}

method temporary() {
  $self->data->{temporary} = 1;

  return $self;
}

method if_exists() {
  $self->data->{if_exists} = 1;

  return $self;
}

method if_not_exists() {
  $self->data->{if_not_exists} = 1;

  return $self;
}

method text(Str $name, Any %args) {
  my $column = $self->column($name);

  $column->text(%args);

  return $column;
}

method text_long(Str $name, Any %args) {
  my $column = $self->column($name);

  $column->text_long(%args);

  return $column;
}

method text_medium(Str $name, Any %args) {
  my $column = $self->column($name);

  $column->text_medium(%args);

  return $column;
}

method time(Str $name, Any %args) {
  my $column = $self->column($name);

  $column->time(%args);

  return $column;
}

method time_tz(Str $name, Any %args) {
  my $column = $self->column($name);

  $column->time_tz(%args);

  return $column;
}

method timestamp(Str $name, Any %args) {
  my $column = $self->column($name);

  $column->timestamp(%args);

  return $column;
}

method timestamp_tz(Str $name, Any %args) {
  my $column = $self->column($name);

  $column->timestamp_tz(%args);

  return $column;
}

method timestamps() {
  my $created_at = $self->datetime('created_at')->null;
  my $updated_at = $self->datetime('updated_at')->null;
  my $deleted_at = $self->datetime('deleted_at')->null;

  return [$created_at, $updated_at, $deleted_at];
}

method timestamps_tz() {
  my $created_at = $self->datetime_tz('created_at')->null;
  my $updated_at = $self->datetime_tz('updated_at')->null;
  my $deleted_at = $self->datetime_tz('deleted_at')->null;

  return [$created_at, $updated_at, $deleted_at];
}

method no_morphs(Str $name) {
  my $type = "${name}_type";
  my $fkey = "${name}_fkey";

  my $type_column = $self->string($type)->delete;
  my $fkey_column = $self->integer($fkey)->delete;

  return [$type_column, $fkey_column];
}

method no_timestamps() {
  my $created_at = $self->column('created_at')->delete;
  my $updated_at = $self->column('updated_at')->delete;
  my $deleted_at = $self->column('deleted_at')->delete;

  return [$created_at, $updated_at, $deleted_at];
}

method uuid(Str $name, Any %args) {
  my $column = $self->column($name);

  $column->uuid(%args);

  return $column;
}

1;
