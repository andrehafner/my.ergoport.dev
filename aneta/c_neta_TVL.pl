#!/usr/bin/perl
use CGI;
use DBI;
use Number::Format 'format_number';
use List::Util qw/sum/;
use File::Copy;
use File::Path;
use HTTP::CookieJar::LWP ();
use LWP::UserAgent       ();
use Number::Format 'format_number';
use Time::HiRes qw(gettimeofday);

my $timecode = gettimeofday;

#this code grabs the trailling number off the reference URL
my $q = CGI->new();
my $id = $q->param('a');

$id =~ s/[^0-9.]+//g;

#this is for testing so I can see outputs in the browser
$|=1;            # Flush immediately.
print "Content-Type: text/plain\n\n";



#while ($n < '10'){
# https://cardano-mainnet.blockfrost.io/api/v0/addresses/{address}/utxos/{asset}
#$cc = `curl -H "project_id: mainnetEs1txBn3nHm1IvNV1nJJhU2Mf99LwIjB" https://cardano-mainnet.blockfrost.io/api/v0/assets/asset1wnxwy544zu8fgyed5vkp2sf3t4t9aptfkc2z5x/addresses`;
$cc = `curl -X POST "https://koios.tosidrop.io/api/v0/address_assets" -H "Accept: application/json" -H "Content-Type: application/json" -d \'{"_addresses":["addr1w8p79rekquuw5kmdg4z36y9gpnm88k5huddwqluk9mjjeqgc3xmss"]}\'`;
#print $cc;
#exit;

# Open a file named "output.txt"; die if there's an error
#open my $fh,  '>>', "/usr/lib/cgi-bin/liso.txt" or die "Cannot open liso.txt: $!";
#print $fh $cc; # Print each entry in our array to the file
#print $fh "\n\n";
#close $fh; # Not necessary, but nice to do

#$cc =~ s/\"//g;
$wallet_id = $cc;

$wallet_id = '';
    if ( $cc =~ /balance\" \: \"(.+)\"\}/s ) {
      $wallet_id =  $1;
    }



print $wallet_id;
exit;
