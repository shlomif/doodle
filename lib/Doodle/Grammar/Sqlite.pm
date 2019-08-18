package Doodle::Grammar::Sqlite;

use 5.014;

use Data::Object 'Class', 'Doodle::Library';

extends 'Doodle::Grammar';

# VERSION

has name => (
  def => 'sqlite',
  mod => 1
);

# BUILD
# METHODS

method wrap(Str $arg) {
  return '"'. $arg .'"';
}

method type_binary(Column $col) {
  # return column type string

  return 'blob';
}

method type_boolean(Column $col) {
  # return column type string

  return 'tinyint(1)';
}

method type_char(Column $col) {
  # return column type string

  return 'varchar';
}

method type_date(Column $col) {
  # return column type string

  return 'date';
}

method type_datetime(Column $col) {
  # return column type string

  return 'datetime';
}

method type_datetime_tz(Column $col) {
  # return column type string

  return 'datetime';
}

method type_decimal(Column $col) {
  # return column type string

  return 'numeric';
}

method type_double(Column $col) {
  # return column type string

  return 'float';
}

method type_enum(Column $col) {
  # return column type string

  return 'varchar';
}

method type_float(Column $col) {
  # return column type string

  return 'float';
}

method type_integer(Column $col) {
  # return column type string

  return 'integer';
}

method type_integer_big(Column $col) {
  # return column type string

  return 'integer';
}

method type_integer_big_unsigned(Column $col) {
  # return column type string

  return 'integer';
}

method type_integer_medium(Column $col) {
  # return column type string

  return 'integer';
}

method type_integer_medium_unsigned(Column $col) {
  # return column type string

  return 'integer';
}

method type_integer_small(Column $col) {
  # return column type string

  return 'integer';
}

method type_integer_small_unsigned(Column $col) {
  # return column type string

  return 'integer';
}

method type_integer_tiny(Column $col) {
  # return column type string

  return 'integer';
}

method type_integer_tiny_unsigned(Column $col) {
  # return column type string

  return 'integer';
}

method type_integer_unsigned(Column $col) {
  # return column type string

  return 'integer';
}

method type_json(Column $col) {
  # return column type string

  return 'text';
}

method type_string(Column $col) {
  # return column type string

  return 'varchar';
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

  return 'time';
}

method type_time_tz(Column $col) {
  # return column type string

  return 'time';
}

method type_timestamp(Column $col) {
  # return column type string

  my $default = 'default CURRENT_TIMESTAMP';

  $default = "" if !$col->data->{use_current};

  return 'datetime' . ($default ? " $default" : '');
}

method type_timestamp_tz(Column $col) {
  # return column type string

  my $default = 'default CURRENT_TIMESTAMP';

  $default = "" if !$col->data->{use_current};

  return 'datetime' . ($default ? " $default" : '');
}

method type_uuid(Column $col) {
  # return column type string

  return 'varchar';
}

method create_table(Command $cmd) {
  my $s = 'create {temporary} table {if_not_exists} {table} ({columns}{, constraints})';

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

method create_index(Command $cmd) {
  my $s ='create {unique} index {index_name} on {table} ({index_columns})';

  return $self->render($s, $cmd);
}

method delete_index(Command $cmd) {
  my $s = 'drop index {index_name}';

  return $self->render($s, $cmd);
}

method render_increments(Column $col) {
  # not necessary as primary key is always auto-incremented

  return ();
}

1;
