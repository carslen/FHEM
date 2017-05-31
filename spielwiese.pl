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