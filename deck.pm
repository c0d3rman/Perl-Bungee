package deck;

use Moose;

has 'cards' => (
	traits => ['Array'],
	is => 'rw',
	isa => 'ArrayRef[card]',
	required => 1,
	default => sub { [] },
    handles => {
          all_cards    => 'elements',
          add     => 'push',
          remove_top_card  => 'pop',
          cards_count => 'count',
          find_card => 'first_index',
          grep_deck => 'grep',
          map_deck => 'map',
          shuffle => 'shuffle'
    }
);


sub remove {
	my ($self,$card,$amount ) = @_;
	$amount ||= 1;
	$self->cards = [$self->grep_deck (sub {$_->name ne $card->name or $amount-- <= 0}) ];
	 
}

sub toString {
    my ($self)=@_;
    local $,=') (';
	"(" . join (') (',$self->map_deck(sub {$_->name})) . ")\n"
}


sub deal {
	my ($self,@players) = @_;
	for (1..5) {
			$_->hand->add($self->remove_top_card) for @players;
	}
}

1;