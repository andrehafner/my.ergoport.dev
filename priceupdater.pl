#!/usr/bin/perl

#use strict;
#use warnings;
use DBI; 
use HTTP::CookieJar::LWP ();
use LWP::UserAgent       ();
use Number::Format 'format_number';
use Time::HiRes qw(gettimeofday);
#use LWP::Protocol::https;

#$|=1;            # Flush immediately.
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

my $response = $ua->get("https://api.ergodex.io/v1/amm/markets?from=1653075262280");
#my $response = $ua->get("https://google.com");

my $Nresponse =  $response->decoded_content;

#my $string =~ /\bb34b3ea80060ace9427bda98690a73d33840e27aaa8d6edb7f0c757a634e455441........................\b/;

#let's wipe the previously stored file so we have clean results to search from
truncate '/usr/lib/cgi-bin/ergo_prices.txt', 0;

# Open a file named "output.txt"; die if there's an error
open my $fh, '>', "/usr/lib/cgi-bin/ergo_prices.txt" or die "Cannot open ergo_prices.txt: $!";

# Loop over the array
foreach ($Nresponse)
{
    print $fh "$_\n"; # Print each entry in our array to the file
}
close $fh; # Not necessary, but nice to do


#get the price of cadano from cointop app
#my $adaPRICE = `cointop price --coin ADA`;
#$adaPRICE =~ s/\$//;


#ERG
sub main
{
    my $file = '/usr/lib/cgi-bin/ergo_prices.txt';
    open(FH, $file) or die("File $file not found");
      
    while(my $String = <FH>)
    {
        if($String =~ /("ERG","quoteId":"03faf2cb329f2e90d6d23b58d91bbb6c046aa143261cc21f52fbe2824bfcbf04","quoteSymbol":"SigUSD","lastPrice":................)/)
        {
         $ERGresult = "$1";
        }
    }
    close(FH);



#SIGRSV
    my $file = '/usr/lib/cgi-bin/ergo_prices.txt';
   open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /("ERG","quoteId":"003bd19d0187117f130b62e1bcab0939929ff5c7709f843c5c4dd158949285d0","quoteSymbol":"SigRSV","lastPrice":..................)/)
        {
           $SIGRSVresult = "$1";
        }
    }
    close(FH);

#NETA
    my $file = '/usr/lib/cgi-bin/ergo_prices.txt';
   open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /("ERG","quoteId":"472c3d4ecaa08fb7392ff041ee2e6af75f4a558810a74b28600549d5392810e8","quoteSymbol":"NETA","lastPrice":................)/)
        {
           $NETAresult = "$1";
        }
    }
    close(FH);


#ETOSI
    my $file = '/usr/lib/cgi-bin/ergo_prices.txt';
   open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /("ERG","quoteId":"94180232cc0d91447178a0a995e2c14c57fbf03b06d5d87d5f79226094f52ffc","quoteSymbol":"eTOSI","lastPrice":..................)/)
        {
           $ETOSIresult = "$1";
        }
    }
    close(FH);


#ERGOPAD
    my $file = '/usr/lib/cgi-bin/ergo_prices.txt';
   open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /("ERG","quoteId":"d71693c49a84fbbecd4908c94813b46514b18b67a99952dc1e6e4791556de413","quoteSymbol":"ergopad","lastPrice":..................)/)
        {
           $ERGOPADresult = "$1";
        }
    }
    close(FH);


#EXILE
    my $file = '/usr/lib/cgi-bin/ergo_prices.txt';
   open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /("ERG","quoteId":"007fd64d1ee54d78dd269c8930a38286caa28d3f29d27cadcb796418ab15c283","quoteSymbol":"EXLE","lastPrice":..................)/)
        {
           $EXILEresult = "$1";
        }
    }
    close(FH);


#PAIDEIA
    my $file = '/usr/lib/cgi-bin/ergo_prices.txt';
   open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /("ERG","quoteId":"1fd6e032e8476c4aa54c18c1a308dce83940e8f4a28f576440513ed7326ad489","quoteSymbol":"Paideia","lastPrice":..................)/)
        {
           $PAIDEIAresult = "$1";
        }
    }
    close(FH);


#TERAHERTZ
    my $file = '/usr/lib/cgi-bin/ergo_prices.txt';
   open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /("ERG","quoteId":"02f31739e2e4937bb9afb552943753d1e3e9cdd1a5e5661949cb0cef93f907ea","quoteSymbol":"Terahertz","lastPrice":..................)/)
        {
           $TERAHERTZresult = "$1";
        }
    }
    close(FH);


#EGIO
    my $file = '/usr/lib/cgi-bin/ergo_prices.txt';
   open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /("ERG","quoteId":"00b1e236b60b95c2c6f8007a9d89bc460fc9e78f98b09faec9449007b40bccf3","quoteSymbol":"EGIO","lastPrice":..................)/)
        {
           $EGIOresult = "$1";
        }
    }
    close(FH);


#COMET
    my $file = '/usr/lib/cgi-bin/ergo_prices.txt';
   open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /("ERG","quoteId":"0cd8c9f416e5b1ca9f986a7f10a84191dfb85941619e49e53c0dc30ebf83324b","quoteSymbol":"COMET","lastPrice":..................)/)
        {
           $COMETresult = "$1";
        }
    }
    close(FH);


#ERDOGE
    my $file = '/usr/lib/cgi-bin/ergo_prices.txt';
   open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /("ERG","quoteId":"36aba4b4a97b65be491cf9f5ca57b5408b0da8d0194f30ec8330d1e8946161c1","quoteSymbol":"Erdoge","lastPrice":..................)/)
        {
           $ERDOGEresult = "$1";
        }
    }
    close(FH);


#LUNADOG
    my $file = '/usr/lib/cgi-bin/ergo_prices.txt';
   open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /("ERG","quoteId":"5a34d53ca483924b9a6aa0c771f11888881b516a8d1a9cdc535d063fe26d065e","quoteSymbol":"LunaDog","lastPrice":..................)/)
        {
           $LUNADOGresult = "$1";
        }
    }
    close(FH);


#MIGORENG
    my $file = '/usr/lib/cgi-bin/ergo_prices.txt';
   open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /("ERG","quoteId":"0779ec04f2fae64e87418a1ad917639d4668f78484f45df962b0dec14a2591d2","quoteSymbol":"Mi Goreng ","lastPrice":..................)/)
        {
           $MIGORENGresult = "$1";
        }
    }
    close(FH);













}
main();

#remove leading set chars and then delete everything after the comma
$ERGresult =~ s/^.{118}//s;
$ERGresult =~ s/\,.*//;

$SIGRSVresult =~ s/^.{118}//s;
$SIGRSVresult =~ s/\,.*//;

$NETAresult =~ s/^.{116}//s;
$NETAresult =~ s/\,.*//;

$ETOSIresult =~ s/^.{117}//s;
$ETOSIresult =~ s/\,.*//;

$ERGOPADresult =~ s/^.{119}//s;
$ERGOPADresult =~ s/\,.*//;

$EXILEresult =~ s/^.{116}//s;
$EXILEresult =~ s/\,.*//;

$PAIDEIAresult =~ s/^.{121}//s;
$PAIDEIAresult =~ s/\,.*//;

$TERAHERTZresult =~ s/^.{121}//s;
$TERAHERTZresult =~ s/\,.*//;

$EGIOresult =~ s/^.{116}//s;
$EGIOresult =~ s/\,.*//;

$COMETresult =~ s/^.{117}//s;
$COMETresult =~ s/\,.*//;

$ERDOGEresult =~ s/^.{118}//s;
$ERDOGEresult =~ s/\,.*//;

$LUNADOGresult =~ s/^.{119}//s;
$LUNADOGresult =~ s/\,.*//;

$MIGORENGresult =~ s/^.{122}//s;
$MIGORENGresult =~ s/\,.*//;


$SIGRSVresult = $ERGresult / $SIGRSVresult;
$NETAresult = $ERGresult / $NETAresult;
$ETOSIresult = $ERGresult / $ETOSIresult;
$ERGOPADresult = $ERGresult / $ERGOPADresult;
$EXILEresult = $ERGresult / $EXILEresult;
$PAIDEIAresult = $ERGresult / $PAIDEIAresult;
$TERAHERTZresult = $ERGresult / $TERAHERTZresult;
$EGIOresult = $ERGresult / $EGIOresult;
$COMETresult = $ERGresult / $COMETresult;
$ERDOGEresult = $ERGresult / $ERDOGEresult;
$LUNADOGresult = $ERGresult / $LUNADOGresult;
$MIGORENGresult = $ERGresult / $MIGORENGresult;


print $ERGresult;
print "\n";
print $SIGRSVresult;
print "\n";
print $NETAresult;
print "\n";
print $ETOSIresult;
print "\n";
print $ERGOPADresult;
print "\n";
print $EXILEresult;
print "\n";
print $PAIDEIAresult;
print "\n";
print $TERAHERTZresult;
print "\n";
print $EGIOresult;
print "\n";
print $COMETresult;
print "\n";
print $ERDOGEresult;
print "\n";
print $LUNADOGresult;
print "\n";
print $MIGORENGresult;
print "\n";


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

#wite the form data back to the database
my $sql = "UPDATE pricedata SET erg='$ERGresult',ergopad='$ERGOPADresult', neta='$NETAresult', etosi='$ETOSIresult', sigrsv='$SIGRSVresult', sigusd='1', datarefreshdate='$the_time', exile='$EXILEresult', paideia='$PAIDEIAresult', terahertz='$TERAHERTZresult', egio='$EGIOresult', comet='$COMETresult', erdoge='$ERDOGEresult', lunadog='$LUNADOGresult', migoreng='$MIGORENGresult' WHERE id='1';";

#prepare the query
my $sth = $dbh->prepare($sql);

#execute the query
$sth->execute();

print "all done\n\n";
exit;
