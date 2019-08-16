package Doodle::Column::Helpers;

use 5.014;

use Data::Object 'Role', 'Doodle::Library';

# VERSION

# BUILD
# METHODS

method binary(Any %args) {
  $self->type('binary');

  $self->data->set(%args) if %args;

  return $self;
}

method boolean(Any %args) {
  $self->type('boolean');

  $self->data->set(%args) if %args;

  return $self;
}

method char(Any %args) {
  $self->type('char');

  $self->data->set(%args) if %args;

  return $self;
}

method date(Any %args) {
  $self->type('date');

  $self->data->set(%args) if %args;

  return $self;
}

method datetime(Any %args) {
  $self->type('datetime');

  $self->data->set(%args) if %args;

  return $self;
}

method datetime_tz(Any %args) {
  $self->type('datetime_tz');

  $self->data->set(%args) if %args;

  return $self;
}

method decimal(Any %args) {
  $self->type('decimal');

  $self->data->set(%args) if %args;

  return $self;
}

method double(Any %args) {
  $self->type('double');

  $self->data->set(%args) if %args;

  return $self;
}

method enum(Any %args) {
  $self->type('enum');

  $self->data->set(%args) if %args;

  return $self;
}

method float(Any %args) {
  $self->type('float');

  $self->data->set(%args) if %args;

  return $self;
}

method primary() {
  $self->data->set(primary => 1);

  return $self;
}

method increments() {
  $self->data->set(increments => 1);

  $self->integer if $self->type !~ /integer/;

  return $self;
}

method increments_big(Any %args) {
  $self->integer_big(%args);
  $self->increments;

  return $self;
}

method increments_medium(Any %args) {
  $self->integer_medium(%args);
  $self->increments;

  return $self;
}

method increments_small(Any %args) {
  $self->integer_small(%args);
  $self->increments;

  return $self;
}

method integer(Any %args) {
  $self->type('integer');

  $self->data->set(%args) if %args;

  return $self;
}

method integer_big(Any %args) {
  $self->type('integer_big');

  $self->data->set(%args) if %args;

  return $self;
}

method integer_big_unsigned(Any %args) {
  $self->type('integer_big_unsigned');

  $self->data->set(%args) if %args;

  return $self;
}

method integer_medium(Any %args) {
  $self->type('integer_medium');

  $self->data->set(%args) if %args;

  return $self;
}

method integer_medium_unsigned(Any %args) {
  $self->type('integer_medium_unsigned');

  $self->data->set(%args) if %args;

  return $self;
}

method integer_small(Any %args) {
  $self->type('integer_small');

  $self->data->set(%args) if %args;

  return $self;
}

method integer_small_unsigned(Any %args) {
  $self->type('integer_small_unsigned');

  $self->data->set(%args) if %args;

  return $self;
}

method integer_tiny(Any %args) {
  $self->type('integer_tiny');

  $self->data->set(%args) if %args;

  return $self;
}

method integer_tiny_unsigned(Any %args) {
  $self->type('integer_tiny_unsigned');

  $self->data->set(%args) if %args;

  return $self;
}

method integer_unsigned(Any %args) {
  $self->type('integer_unsigned');

  $self->data->set(%args) if %args;

  return $self;
}

method json(Any %args) {
  $self->type('json');

  $self->data->set(%args) if %args;

  return $self;
}

method null(Any %args) {
  $self->data->set(%args, nullable => 1);

  return $self;
}

method not_null(Any %args) {
  $self->data->set(%args, nullable => 0);

  return $self;
}

method string(Any %args) {
  $self->type('string');

  $self->data->set(%args) if %args;

  return $self;
}

method text(Any %args) {
  $self->type('text');

  $self->data->set(%args) if %args;

  return $self;
}

method text_long(Any %args) {
  $self->type('text_long');

  $self->data->set(%args) if %args;

  return $self;
}

method text_medium(Any %args) {
  $self->type('text_medium');

  $self->data->set(%args) if %args;

  return $self;
}

method time(Any %args) {
  $self->type('time');

  $self->data->set(%args) if %args;

  return $self;
}

method time_tz(Any %args) {
  $self->type('time_tz');

  $self->data->set(%args) if %args;

  return $self;
}

method timestamp(Any %args) {
  $self->type('timestamp');

  $self->data->set(%args) if %args;

  return $self;
}

method timestamp_tz(Any %args) {
  $self->type('timestamp_tz');

  $self->data->set(%args) if %args;

  return $self;
}

method uuid(Any %args) {
  $self->type('uuid');

  $self->data->set(%args) if %args;

  return $self;
}

1;
