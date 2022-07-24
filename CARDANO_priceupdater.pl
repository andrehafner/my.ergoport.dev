#!/usr/bin/perl

#use strict;
#use warnings;
use DBI; 
use HTTP::CookieJar::LWP ();
use LWP::UserAgent       ();
use Number::Format 'format_number';
use Time::HiRes qw(gettimeofday);
#use LWP::Protocol::https;

$|=1;            # Flush immediately.
#print "Content-Type: text/plain\n\n";


#time calculation
@months = qw(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec);
@weekDays = qw(Sun Mon Tue Wed Thu Fri Sat Sun);
($second, $minute, $hour, $dayOfMonth, $month, $yearOffset, $dayOfWeek, $dayOfYear, $daylightSavings) = localtime();
$year = 1900 + $yearOffset;
$the_time = "$months[$month] $dayOfMonth, $year - $weekDays[$dayOfWeek] $hour:$minute";


my $jar = HTTP::CookieJar::LWP->new;
my $ua  = LWP::UserAgent->new(
    cookie_jar        => $jar,
    protocols_allowed => ['http', 'https'],
    timeout           => 100,
);

 
$ua->agent('Mozilla/9.0');  
$ua->env_proxy;

my $timecode = gettimeofday;
$timecode = substr($timecode,0,-12);
$timecode = $timecode * 1000000000;
$timecodeSLOWMOVERS = $timecode - 3000000000;
#print $timecode;
#exit;

my $response = $ua->get("https://api-mainnet-prod.minswap.org/coinmarketcap/v2/pairs");

my $Nresponse =  $response->decoded_content;

#my $string =~ /\bb34b3ea80060ace9427bda98690a73d33840e27aaa8d6edb7f0c757a634e455441........................\b/;

#let's wipe the previously stored file so we have clean results to search from
truncate '/usr/lib/cgi-bin/cardano_prices.txt', 0;

# Open a file named "output.txt"; die if there's an error
open my $fh, '>', "/usr/lib/cgi-bin/cardano_prices.txt" or die "Cannot open cardano.txt: $!";

# Loop over the array
foreach ($Nresponse)
{
    print $fh "$_\n"; # Print each entry in our array to the file
}
close $fh; # Not necessary, but nice to do


#get the price of cadano from cointop app
my $adaPRICE = `cointop price --coin ADA`;
$adaPRICE =~ s/\$//;


#cNETA
sub main
{
    my $file = '/usr/lib/cgi-bin/cardano_prices.txt';
    open(FH, $file) or die("File $file not found");
      
    while(my $String = <FH>)
    {
        if($String =~ /(b34b3ea80060ace9427bda98690a73d33840e27aaa8d6edb7f0c757a634e455441","base_name":"anetaBTC","base_symbol":"cNETA","quote_id":"lovelace","quote_name":"Cardano","quote_symbol":"ADA","last_price":"..............................)/)
        {
         $cNETAresult = "$1";
        }
    }
    close(FH);




##cTOSI
    my $file = '/usr/lib/cgi-bin/cardano_prices.txt';
   open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /(a8a1dccea2e378081f2d500d98d022dd3c0bd77afd9dbc7b55a9d21b63544f5349","base_name":"","base_symbol":"","quote_id":"lovelace","quote_name":"Cardano","quote_symbol":"ADA","last_price":"..............................)/)
        {
           $cTOSIresult = "$1";
        }
    }
    close(FH);



##CDOG
    my $file = '/usr/lib/cgi-bin/cardano_prices.txt';
   open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /(d030b626219d81673bd32932d2245e0c71ae5193281f971022b23a78436172646f67656f","base_name":"Cardogeo","base_symbol":"CDOG","quote_id":"lovelace","quote_name":"Cardano","quote_symbol":"ADA","last_price":"..............................)/)
        {
           $CDOGresult = "$1";
        }
    }
    close(FH);


##CNT
    my $file = '/usr/lib/cgi-bin/cardano_prices.txt';
   open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /(2c96f49b6e6e32ae69a182e85b74db4edfc9539496a13ab76d1258fa434e54","base_name":"Cardano Native Token","base_symbol":"CNT","quote_id":"lovelace","quote_name":"Cardano","quote_symbol":"ADA","last_price":"..............................)/)
        {
           $CNTresult = "$1";
        }
    }
    close(FH);

#HOSKY
    my $file = '/usr/lib/cgi-bin/cardano_prices.txt';
   open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /(a0028f350aaabe0545fdcb56b039bfb08e4bb4d8c4d7c3c7d481c235484f534b59","base_name":"HOSKY Token","base_symbol":"HOSKY","quote_id":"lovelace","quote_name":"Cardano","quote_symbol":"ADA","last_price":"...............................)/)
        {
           $HOSKYresult = "$1";
        }
    }
    close(FH);

#MILK
    my $file = '/usr/lib/cgi-bin/cardano_prices.txt';
   open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /(8a1cfae21368b8bebbbed9800fec304e95cce39a2a57dc35e2e3ebaa4d494c4b","base_name":"MILK","base_symbol":"MILK","quote_id":"lovelace","quote_name":"Cardano","quote_symbol":"ADA","last_price":"............................)/)
        {
           $MILKresult = "$1";
        }
    }
    close(FH);


#MIN
    my $file = '/usr/lib/cgi-bin/cardano_prices.txt';
   open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /(29d222ce763455e3d7a09a665ce554f00ac89d2e99a1a83d267170c64d494e","base_name":"Minswap","base_symbol":"MIN","quote_id":"lovelace","quote_name":"Cardano","quote_symbol":"ADA","last_price":".................................)/)
        {
           $MINresult = "$1";
        }
    }
    close(FH);


#MELD
    my $file = '/usr/lib/cgi-bin/cardano_prices.txt';
   open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /(6ac8ef33b510ec004fe11585f7c5a9f0c07f0c23428ab4f29c1d7d104d454c44","base_name":"MELD","base_symbol":"MELD","quote_id":"lovelace","quote_name":"Cardano","quote_symbol":"ADA","last_price":".............................)/)
        {
           $MELDresult = "$1";
        }
    }
    close(FH);


#LQ
    my $file = '/usr/lib/cgi-bin/cardano_prices.txt';
   open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /(da8c30857834c6ae7203935b89278c532b3995245295456f993e1d244c51","base_name":"Liqwid DAO Token","base_symbol":"LQ","quote_id":"lovelace","quote_name":"Cardano","quote_symbol":"ADA","last_price":"............................)/)
        {
           $LQresult = "$1";
        }
    }
    close(FH);

#DANA
    my $file = '/usr/lib/cgi-bin/cardano_prices.txt';
   open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /(c88bbd1848db5ea665b1fffbefba86e8dcd723b5085348e8a8d2260f44414e41","base_name":"DANA","base_symbol":"DANA","quote_id":"lovelace","quote_name":"Cardano","quote_symbol":"ADA","last_price":".............................)/)
        {
           $DANAresult = "$1";
        }
    }
    close(FH);

#PAVIA
    my $file = '/usr/lib/cgi-bin/cardano_prices.txt';
   open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /(884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae5041564941","base_name":"PAVIA Token","base_symbol":"PAVIA","quote_id":"lovelace","quote_name":"Cardano","quote_symbol":"ADA","last_price":"..............................)/)
        {
           $PAVIAresult = "$1";
        }
    }
    close(FH);



}
main();

#remove leading set chars and then delete everything after the colon
$cNETAresult =~ s/^.{193}//s;
$cNETAresult =~ s/\".*//;

$cTOSIresult =~ s/^.{180}//s;
$cTOSIresult =~ s/\".*//;

$CDOGresult =~ s/^.{198}//s;
$CDOGresult =~ s/\".*//;

$CNTresult =~ s/^.{199}//s;
$CNTresult =~ s/\".*//;

$HOSKYresult =~ s/^.{196}//s;
$HOSKYresult =~ s/\".*//;

$MILKresult =~ s/^.{186}//s;
$MILKresult =~ s/\".*//;

$MINresult =~ s/^.{186}//s;
$MINresult =~ s/\".*//;

$MELDresult =~ s/^.{186}//s;
$MELDresult =~ s/\".*//;

$LQresult =~ s/^.{192}//s;
$LQresult =~ s/\".*//;

$DANAresult =~ s/^.{186}//s;
$DANAresult =~ s/\".*//;

$PAVIAresult =~ s/^.{196}//s;
$PAVIAresult =~ s/\".*//;



#multiply by ada USD to get USD cost
$cNETAresult = $cNETAresult * $adaPRICE;
$cTOSIresult = $cTOSIresult * $adaPRICE;
$CDOGresult = $CDOGresult * $adaPRICE;
$CNTresult = $CNTresult * $adaPRICE;
$HOSKYresult = $HOSKYresult * $adaPRICE;
$MILKresult = $MILKresult * $adaPRICE;
$MINresult = $MINresult * $adaPRICE;
$MELDresult = $MELDresult * $adaPRICE;
$LQresult = $LQresult * $adaPRICE;
$DANAresult = $DANAresult * $adaPRICE;
$PAVIAresult = $PAVIAresult * $adaPRICE;

#testing
#print $cNETAresult;
#print "\n";
#print $cTOSIresult;
#print "\n";
#print $CDOGresult;
#print "\n";
#print $CNTresult;
#print "\n";
#print $HOSKYresult;
#print "\n";
#print $MILKresult;
#print "\n";
#print $MINresult;
#print "\n";
#print $MELDresult;
#print "\n";
#print $LQresult;
#print "\n";
#print $DANAresult;
#print "\n";
#print $PAVIAresult;
#print "\n";
#print $adaPRICE;
#exit;


#this gets the mysql password from a file so we don't have to store it in the script
open my $fh, '<', '/usr/lib/cgi-bin/sql.txt' or die "Can't open file $!";
$password = do { local $/; <$fh> };

#remove white spaces in the file for some reason beyond me why it's doing that
$password =~ s/^\s+//;
$password =~ s/\s+$//;

#definition of variables
my $db="ergoport";
my $host="localhost";
my $user="root";


#connect to MySQL database
my $dbh   = DBI->connect ("DBI:mysql:database=$db:host=$host",
  $user,
  $password)
  or die "Can't connect to database: $DBI::errstr\n";

#write the form data back to the database
my $sql = "UPDATE pricedata SET cneta='$cNETAresult', ctosi='$cTOSIresult',CDOG='$CDOGresult',CNT='$CNTresult',HOSKY='$HOSKYresult',MILK='$MILKresult',MIN='$MINresult',MELD='$MELDresult',LQ='$LQresult',DANA='$DANAresult',PAVIA='$PAVIAresult',cdatarefreshdate='$the_time', ada='$adaPRICE' WHERE id='1';";

#prepare the query
my $sth = $dbh->prepare($sql);

#execute the query
$sth->execute();

print "all done\n\n";
exit;
