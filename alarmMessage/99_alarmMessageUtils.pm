##############################################
# $Id: myUtilsTemplate.pm 7570 2015-01-14 18:31:44Z rudolfkoenig $
#
# Save this file as 99_myUtils.pm, and create your own functions in the new
# file. They are then available in every Perl expression.

package main;

use strict;
use warnings;
use POSIX;

sub
alarmMessageUtils_Initialize($$)
{
  my ($hash) = @_;
}

# Enter you functions below _this_ line.

sub openWindowAlarm() {
    # Diese Funktion sendet eine Benachrichtigung über offene Fenster per Telegramm, wenn die letzte Person das Haus verlässt, aber noch ein Fenster geöffnet ist.
    # notify reagiert auf Presence und tfk Events:
    # defmod notifyName notify sec..*(closed|open|tilted) { openWindowAlarm($NAME,$EVENT) }
	my ($dev, $rawEvent) = @_;

    #Variablen definieren
    my @tfk=devspec2array("subType=threeStateSensor");  # Welche Türfensterkontakte gibt es überhaupt
    my @windowOpen = undef;
    
    foreach(@tfk) {
        $state = ReadingsVal($_,"state","nA");
        if ($stage eq "open") {
            push(@windowOpen,$_);
        }
    }

print "Es sind $#windowOpen Fenster offen!";

}


sub homieReadingsAge() {
    #Variablen definieren
    my @homies = ("Carsten","Zelmira","Robin","Annika"); # Ggf. mittels devspec2array() füllen -> Sinnvolle Filter überlegen.
    my %homieReadingsAge = undef; # Hash array definieren, welches später Bewohner und Readingsage enthält.
    foreach(@homies){
        if (ReadingsVal($_,"state",nA) eq "absent") {
            $homie = $_;
            $age   = ReadingsAge($state);
            $homieReadingsAge{$homie} = "$age";
        }
    }
}


1;