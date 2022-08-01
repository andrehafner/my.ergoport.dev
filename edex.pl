#!/usr/bin/perl
print "content-type:text/html; charset=utf-8\n\n";

#$|=1;            # Flush immediately.
#print "Content-Type: text/plain\n\n";

my $filename = "/usr/lib/cgi-bin/ergodextester.txt";
open(my $fh, '<', $filename);
while (my $line = <$fh>) {
chomp $line;
print "$line\n";
print "<br>";
}

exit;
