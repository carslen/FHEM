my $shutter = leer123;
if (!$shutter){
    print "Kein Rollladen definiert";
    }
    elsif ($shutter eq "leer") {
        print "Rollladen leer";
    }
    else {
        print "$shutter";
    };

my $reading = "set_33";
my $out = index($reading,"set_");
print $out;

my @tfk=devspec2array("subType=threeStateSensor");
my @windowOpen = undef;

foreach(@tfk) {
    $state = ReadingsVal($_,"state","nA");
    if ($stage eq "open"){
        push(@windowOpen,$_);
    }
}

print "Es sind $#windowOpen Fenster offen!";

{devspec2array("NAME=sec.tfk.og*:FILTER=state=open")}
{@devices = devspec2array("subType=threeStateSensor");; foreach(@devices){print $_,"\n";;};;}

my @homies = ("Carsten","Zelmira","Robin","Annika");
my %readingsage = undef;
foreach(@homies){
    if (ReadingsVal($_,"state",nA) eq "absent") {
        $homie = $_;
        $age   = ReadingsAge($state);
        $readingsage{$homie} = "$age";
    }
}
print %ages;

my @homies = ("Carsten","Zelmira","Robin","Annika");
my $age  = "100";
my %ages = undef;
foreach(@homies){
    $homie = $_;
    $age   = --$age;
    $ages{$homie} = "$age";
    if ($age > "97"){
        print "Der Mitbewohner $homie ist zuhause","\n";
    }
    else {
        print "Der Mitbewohner $homie ist nicht zuhause", "\n";
    }

}
print %ages;

use List::Util qw(max);
my %height = (
    foo => 170,
    bar => 181,
    moo => 175,
);

my $highest = max values %height;
 
print "$highest\n";

foreach $entry (%height){
    if ((value "$entry") = "$highest"){
        $match = key $entry;
        print "match ist $match";
    }
}