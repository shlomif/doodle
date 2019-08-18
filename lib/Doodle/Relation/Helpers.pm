package Doodle::Relation::Helpers;

use 5.014;

use Data::Object 'Role', 'Doodle::Library';

# VERSION

# METHODS

method on_delete(Str $action) {
  $self->data->{on_delete} = $action;

  return $self;
}

method on_update(Str $action) {
  $self->data->{on_update} = $action;

  return $self;
}

1;
