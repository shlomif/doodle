package Doodle::Migration;

use 5.014;

use Data::Object 'Class', 'Doodle::Library';

use Carp;

# VERSION

# METHODS

method up(Doodle $d) {
  # this class is meant to be overwritten

  confess("This method is meant to be overwritten by the subclass");
}

method down(Doodle $d) {
  # this class is meant to be overwritten

  confess("This method is meant to be overwritten by the subclass");
}

1;
