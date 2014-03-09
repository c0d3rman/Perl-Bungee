use card;
use deck;
use player;

my $deck = deck->new(
	cards => [map {card->new(name => $_)} ((1..9) x 5, (10) x 8, ("B") x 3)]
);
#create ordered deck
print $deck->toString;
print '-'x40,$/;

$deck->shuffle;
print $deck->toString;

my @players = map {new player (name => $_,hand =>deck->new)} qw/Yoni Osher Chami Itzik/;

$deck->deal(@players);

for (@players) {
  print $_->hand->toString;
  print "\n---------\n";
}

print $deck->toString;

