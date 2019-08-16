package Doodle::Statement;

use 5.014;

use Data::Object 'Class', 'Doodle::Library';

# VERSION

has cmd => (
  is => 'ro',
  isa => 'Command',
  req => 1
);

has sql => (
  is => 'ro',
  isa => 'Str',
  req => 1
);

1;
