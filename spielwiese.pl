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

use List::UtilsBy qw(max_by);
my %height = (
    foo => 170,
    bar => 181,
    moo => 175,
);

my $highest = max_by { $height{$_} } keys %height;
print "$highest\n";
print "$height{ $highest }\n";

$contacts = qw(ReadingsVal ...);
@contacts = qw(191950828:Robin:@rlxe2 180623342:Carsten_Lenz:@clxe1 155309316:Zelmira_Lenz:@ZelmiraLenz);
foreach(@contacts) {
    print "\$_: $_\n";
    $contact =~ s/[@]\w+$/$_/;
    print "\$contact: $contact\n";
}


$_="Das ist ein einfacher Text";
$result1=/ist/;
$result2=/schwieriger Text/;
print "\$result1: $result1\n";
print "\$result2: $result2\n";
#
# Verwenden von Variablen in /.../
$substring="ein";
if( /$substring/ ){
print "\"ein\" ist Bestandteil von \$_ \n";
}

======================
my $str = '191950828:Robin:@rlxe2 180623342:Carsten_Lenz:@clxe1 155309316:Zelmira_Lenz:@ZelmiraLenz';
my $regex = qr/[@]\w+$/p;
print 
if ( $str =~ /$regex/ )