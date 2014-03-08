package card;

use Moose;

has 'name' => (
      is  => 'rw',
      isa => 'Str',
  );

sub equals {
  my ($self,$other) = @_;
  $self->name eq $other->name; 
}

1;