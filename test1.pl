use card;
use deck;
use player;

my $deck = deck->new(
	map {card->new($_)} ((1..9) x 5, (10) x 8, ("B") x 3)
);
#create ordered deck
print $deck->toString;
print '-'x40,$/;

$deck->shuffle;
print $deck->toString;

my @players = map {new player ($_)} qw/Yoni Osher Chami Itzik/;

$deck->deal(@players);

for (@players) {
  print $_->deck->toString;
  print "\n---------\n";
}

print $deck->toString;

