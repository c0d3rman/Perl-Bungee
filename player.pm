package player;
use Moose;

has 'name' => (is  => 'rw', isa => 'Str');
has 'hand' => (is  => 'rw', isa => 'deck');



sub join {
	my ($self, $game) = @_;
	$game->players->add($self)
}
1;
