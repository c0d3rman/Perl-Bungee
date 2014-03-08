package deck;

use Moose;

has 'cards' => (
	is => 'rw',
	isa => 'ArrayRef',
	required => 1,
	default => sub { [] },
	reader => 'read_cards',
	writer => 'write_cards',
	clearer => 'clear'
);

sub cards {
	my ($self, $write) = @_;
	$write ? $self->write_cards([$write]) : @{$self->read_cards};
}

sub add {
	my ($self,@cards)=@_;
	push @{$self->cards},@cards;
}

sub remove {
	my ($self,$card,$amount) = @_;
	$amount ||= 1;
	@{$self->cards} = grep {!$_->equals($card) || $amount-- <= 0} @{$self->cards};
	 
}

sub toString {
    my ($self)=@_;
   local $,=') (';
	"(" . join (') (',map {$_->name} $self->cards) . ")\n"
}

sub shuffle {
    my ($self)=@_;
    my @deck = $self->cards;
    my @newdeck;
    #splice (@{$self->cards}, 0 , scalar @{$self->cards});
    #$self->clear();
	push @newdeck, splice(@deck, rand() * @deck, 1) while (@deck);
    $self->cards(@newdeck);
    #push @{$self->cards}, splice(@deck, rand() * @deck, 1) while (@deck);
}

sub deal {
	my ($self,@players) = @_;
	for (1..5) {
			$_->deck->add(pop $self->cards) for @players;
	}
}

1;