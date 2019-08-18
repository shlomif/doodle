package Doodle::Schema::Helpers;

use 5.014;

use Data::Object 'Role', 'Doodle::Library';

# VERSION

# METHODS

method if_exists() {
  $self->data->{if_exists} = 1;

  return $self;
}

method if_not_exists() {
  $self->data->{if_not_exists} = 1;

  return $self;
}

1;
