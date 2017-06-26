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

@telegram = qw(191950828:Robin:@rlxe2 180623342:Carsten_Lenz:@clxe1 155309316:Zelmira_Lenz:@ZelmiraLenz);
print $telegram[1],"\n";
$search = qr/^[0-9]+/p;
#$temp = $telegram[1] =~ /$search/g;
if ($telegram[1] =~ /$search/g) {
	$temp = ${^MATCH};
}
print $temp,"\n";

my $str = '180623342:Carsten_Lenz:@clxe1';
my $regex = qr/^[0-9]+:/p;

if ( $str =~ /$regex/g ) {
  print "Whole match is ${^MATCH} and its start/end positions can be obtained via \$-[0] and \$+[0]\n";
  # print "Capture Group 1 is $1 and its start/end positions can be obtained via \$-[1] and \$+[1]\n";
  # print "Capture Group 2 is $2 ... and so on\n";
}

sec.tfk.eg.sz_li.*:(open|closed|tilted){
	my state1 = InternalVal("sec.tfk.eg.sz_li_01", "STATE", nA);;
	my state2 = InternalVal("sec.tfk.eg.sz_li_02", "STATE", nA);;
	if($NAME eq "sec.tfk.eg.sz_li_01" and $EVENT eq "open"){
		fhem("set FensterDummy open");;
	}
	elseif($NAME eq "sec.tfk.eg.sz_li_02" and $EVENT eq "open" and $state1 eq "closed"){
		fhem("set FensterDummy tilted");;
	}
	else{
		fhem("set FensterDummy closed");;
	}
}
