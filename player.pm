package player;

sub new {
	my ($class,$name);
	bless {name=>$name,deck=>new deck()}
}

sub deck {
    $_[0]->{deck};
}

sub join {
	my ($self, $game) = @_;
	$game->players->add($self)
}
1;
