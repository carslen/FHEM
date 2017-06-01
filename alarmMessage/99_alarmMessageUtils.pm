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

sub alarmMessage_windowOpen($$) {
    # Diese Funktion sendet eine Benachrichtigung über offene Fenster per Telegramm, wenn die letzte Person das Haus verlässt, aber noch ein Fenster geöffnet ist.
    # notify reagiert auf Presence und tfk Events:
    # defmod notifyName notify sec..*(closed|open|tilted)|(Rolladen_.*|Jalousie_.*).(motor:.stop.*|set_.*|motor..down.*) { functionName($NAME,$EVENT) }
	my ($dev, $rawEvent) = @_;

    # Variablen / Dinge merken
    my @tfk = ("sec.tfk.eg.bad.links","sec.tfk.eg.bad.rechts","sec.tfk.eg.sz.li.01","sec.tfk.og.terrasse");
    print @tfk, "\n";
    print "blasfd $#tfk";

    my @family = ("Robin","Carsten","Zelmira");
    print @family, "\n";
    print $#family, "\n";

    foreach $name (@tfk){
        print $name, "\n";
    }

}


1;