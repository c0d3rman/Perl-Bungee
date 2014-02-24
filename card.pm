package card;

sub new {
	my ($class,$name)=@_;
	bless {name=>$name} ;
}

sub compare {
  my ($self,$other) = @_;
  $self->{name} eq $other->{name}; 
}

sub name {
  $_[0]->{name}
}

1;