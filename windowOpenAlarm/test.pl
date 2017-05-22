		  	# my $setPosition = "rollladen.og.wz.balkontuer level: 80";
			my $setPosition = "set_on";

			#Fahrbefehl über FHEM oder Tastendruck?
			if($setPosition =~ /set_/) { 
				$setPosition = substr $setPosition, 4, ; #FHEM-Befehl
				if ($setPosition eq "on") {$setPosition = 100;}
				elsif ($setPosition eq "off") {$setPosition = 0;}
				#Fährt der Rolladen aufwärts, gibt es nichts zu tun...
				#if ($setPosition >= $position) {return "Nothing to do, moving upwards";}
			}

            print $setPosition;

$x = "10";
if( $x == 10 ){
	print 'Diese Ausgabe erscheint nur ';
	print 'wenn $x den Wert 10 enthaelt';
}
else{
	print 'Diese Anweisungen werden nur ausgeführt ';
	print 'wenn $x nicht gleich 10 ist';
}

# Datei: whiletestl
$i=1;
while( $i <= 5 ){
	print "\$i ist $i\n";
	$i++;
}