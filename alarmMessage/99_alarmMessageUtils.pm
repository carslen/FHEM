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

sub openWindowAlarm($) {
    # Diese Funktion sendet eine Benachrichtigung über offene Fenster per Telegram, wenn die letzte Person das Haus verlässt, aber noch ein Fenster geöffnet ist.
    # Der Funktion openWindowAlarm muss ein Telegram Empfänger übergeben weden.
    #
    
    my ($recipient) = @_;

    #Variablen definieren
    #
    my @tfk=devspec2array("subType=threeStateSensor");  # Welche Türfensterkontakte gibt es überhaupt
    my @windowOpenNum = undef;
    my @windowOpenDev = undef;
    my @lastStanding  = undef;
    
    # Anzahl offener Fenster ermitteln
    #

    foreach(@tfk) {
        my $state = ReadingsVal($_,"state","nA");
        my $dev   = AttrVal($_,"alias", "nA");
        if ($state eq "open") {
            push(@windowOpenNum,$_);
            push(@windowOpenDev,$dev);
        }
    }
    my $message = "Es sind $#windowOpen Fenster offen! Bitte @windowOpenDev schließen."$lastStanding" hat als letztes das Haus verlassen.";
    Debug($message);
    # Benachrichtigung per Telegram
    #fhem{set TelegramBot msg Carsten_Lenz $message};


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