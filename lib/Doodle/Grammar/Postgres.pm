package Doodle::Grammar::Postgres;

use 5.014;

use Data::Object 'Class', 'Doodle::Library';

extends 'Doodle::Grammar';

# VERSION

has name => (
  def => 'postgres',
  mod => 1
);

# BUILD
# METHODS

method wrap(Str $arg) {
  return '"'. $arg .'"';
}

method type_binary(Column $col) {
  # return column type string

  return 'bytea';
}

method type_boolean(Column $col) {
  # return column type string

  return 'boolean';
}

method type_char(Column $col) {
  # return column type string

  my $size = $col->data->{size} || 1;

  return "char($size)";
}

method type_date(Column $col) {
  # return column type string

  return 'date';
}

method type_datetime(Column $col) {
  # return column type string

  return 'timestamp(0) without time zone';
}

method type_datetime_tz(Column $col) {
  # return column type string

  return 'timestamp(0) with time zone';
}

method type_decimal(Column $col) {
  # return column type string

  my $total = $col->data->{total} || 5;
  my $scale = $col->data->{places} || 2;

  return "decimal($total, $scale)";
}

method type_double(Column $col) {
  # return column type string

  return 'double precision';
}

method type_enum(Column $col) {
  # return column type string

  my $name = $col->name;
  my $options = $col->data->{options};

  $name = $self->wrap($name);
  $options = join ', ', map $self->wrap($_), @$options;

  return "varchar(225) check ($name in ($options))";
}

method type_float(Column $col) {
  # return column type string

  return $self->type_double($col);
}

method type_integer(Column $col) {
  # return column type string

  return $col->data->{increments} ? 'serial' : 'integer';
}

method type_integer_big(Column $col) {
  # return column type string

  return $col->data->{increments} ? 'bigserial' : 'bigint';
}

method type_integer_big_unsigned(Column $col) {
  # return column type string

  return $self->type_integer_big($col);
}

method type_integer_medium(Column $col) {
  # return column type string

  return $col->data->{increments} ? 'serial' : 'integer';
}

method type_integer_medium_unsigned(Column $col) {
  # return column type string

  return $self->type_integer_medium($col);
}

method type_integer_small(Column $col) {
  # return column type string

  return $col->data->{increments} ? 'smallserial' : 'smallint';
}

method type_integer_small_unsigned(Column $col) {
  # return column type string

  return $self->type_integer_small($col);
}

method type_integer_tiny(Column $col) {
  # return column type string

  return $col->data->{increments} ? 'smallserial' : 'smallint';
}

method type_integer_tiny_unsigned(Column $col) {
  # return column type string

  return $self->type_integer_tiny($col);
}

method type_integer_unsigned(Column $col) {
  # return column type string

  return $self->type_integer($col);
}

method type_json(Column $col) {
  # return column type string

  return 'json';
}

method type_string(Column $col) {
  # return column type string

  my $size = $col->data->{size} || 255;

  return "varchar($size)";
}

method type_text(Column $col) {
  # return column type string

  return 'text';
}

method type_text_long(Column $col) {
  # return column type string

  return 'text';
}

method type_text_medium(Column $col) {
  # return column type string

  return 'text';
}

method type_time(Column $col) {
  # return column type string

  return 'time(0) without time zone';
}

method type_time_tz(Column $col) {
  # return column type string

  return 'time(0) with time zone';
}

method type_timestamp(Column $col) {
  # return column type string

  my $default = 'default CURRENT_TIMESTAMP(0)';

  $default = "" if !$col->data->{use_current};

  return 'timestamp(0) without time zone' . ($default ? " $default" : '');
}

method type_timestamp_tz(Column $col) {
  # return column type string

  my $default = 'default CURRENT_TIMESTAMP(0)';

  $default = "" if !$col->data->{use_current};

  return 'timestamp(0) with time zone' . ($default ? " $default" : '');
}

method type_uuid(Column $col) {
  # return column type string

  return 'uuid';
}

method create_table(Command $cmd) {
  my $s = 'create {temporary} table {if_exists} {table} ({columns}{, constraints})';

  return $self->render($s, $cmd);
}

method delete_table(Command $cmd) {
  my $s = 'drop table {if_exists} {table}';

  return $self->render($s, $cmd);
}

method rename_table(Command $cmd) {
  my $s = 'alter table {table} rename to {new_table}';

  return $self->render($s, $cmd);
}

method create_column(Command $cmd) {
  my $s = 'alter table {table} add column {new_column}';

  return $self->render($s, $cmd);
}

method update_column(Command $cmd) {
  my $s = 'alter table {table} alter column {column_name} {column_change}';

  return $self->render($s, $cmd);
}

method delete_column(Command $cmd) {
  my $s = 'alter table {table} drop column {column_name}';

  return $self->render($s, $cmd);
}

method rename_column(Command $cmd) {
  my $s = 'alter table {table} rename column {column_name} to {new_column_name}';

  return $self->render($s, $cmd);
}

method create_index(Command $cmd) {
  my $s ='create {unique} index {index_name} on {table} ({index_columns})';

  return $self->render($s, $cmd);
}

method delete_index(Command $cmd) {
  my $s = 'drop index {index_name}';

  return $self->render($s, $cmd);
}

method create_relation(Command $cmd) {
  my $s ='alter table {table} add constraint {relation}';

  return $self->render($s, $cmd);
}

method delete_relation(Command $cmd) {
  my $s ='alter table {table} drop constraint {relation_name}';

  return $self->render($s, $cmd);
}

method render_increments(Column $col) {
  # not necessary as incrementing column type will be serial

  return ();
}

1;
