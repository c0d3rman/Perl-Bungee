package deck;

sub new {
	my ($class,@cards)=@_;
	bless [@cards];
}

sub add {
	my ($self,@cards)=@_;
	push @$self,@cards;
}

sub remove {
	my ($self,$card,$amount) = @_;
	$amount ||= 1;
	@$self = grep {!$_->compare($card) || $amount-- <= 0} @$self;
	 
}

sub toString {
    my ($self)=@_;
   local $,=') (';
	"(" . join (') (',map {$_->name} @$self) . ")\n"
}

sub shuffle {
    my ($self)=@_;
    my @deck = @$self;
    splice (@$self, 0 , scalar @$self);
	push @$self, splice(@deck, rand() * @deck, 1) while (@deck);
}

sub deal {
	my ($self,@players) = @_;
	for (1..5) {
			$_->deck->add(pop @$self) for @players;
	}
}

1;