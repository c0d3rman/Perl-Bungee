package deck;

use Moose;

has 'cards' => (
	traits => ['Array'],
	is => 'rw',
	isa => 'ArrayRef[card]',
	required => 1,
	default => sub { [] },
    handles => {map {$_ => $_} qw/push pop grep map shuffle/}

);


sub remove {
	my ($self,$card,$amount ) = @_;
	$amount ||= 1;
	$self->cards = [$self->grep(sub {$_->name ne $card->name or $amount-- <= 0}) ];
	 
}

sub toString {
    my ($self)=@_;
    local $,=') (';
	"(" . join (') (',$self->map(sub {$_->name})) . ")\n"
}


sub deal {
	my ($self,@players) = @_;
	for (1..5) {
			$_->hand->push($self->pop) for @players;
	}
}

1;