#!/usr/bin/perl

#use strict;
#use warnings;
use DBI; 
use HTTP::CookieJar::LWP ();
use LWP::UserAgent       ();
use Number::Format 'format_number';
use Time::HiRes qw(gettimeofday);
#use LWP::Protocol::https;
no warnings 'utf8';

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

#my $EURresult = '';
#my $YENresult = '';
 
$ua->agent('Mozilla/9.0');  
$ua->env_proxy;

my $timecode = gettimeofday;
$timecode = substr($timecode,0,-12);
$timecode = $timecode * 1000000000;
$timecodeSLOWMOVERS = $timecode - 3000000000;
#print $timecode;
#exit;


#EUR
my $response = $ua->get("https://www.google.com/finance/quote/USD-EUR");
#my $response = $ua->get("https://google.com");

my $Nresponse =  $response->decoded_content;

#let's wipe the previously stored file so we have clean results to search from
truncate '/usr/lib/cgi-bin/currency.txt', 0;

# Open a file named "output.txt"; die if there's an error
open my $fh,  '>', "/usr/lib/cgi-bin/currency.txt" or die "Cannot open currency.txt: $!";

# Loop over the array
foreach ($Nresponse)
{
    print $fh "$_\n"; # Print each entry in our array to the file
}
close $fh; # Not necessary, but nice to do

    my $file = '/usr/lib/cgi-bin/currency.txt';
    open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /(The last closing price<\/div><\/span><div class="P6K39c">................)/)
        {
         $EURresult = "$1";
        }
    }
    close(FH);

$EURresult =~ s/^.{55}//s;
$EURresult =~ s/\<.*//;




#JPY
$response = $ua->get("https://www.google.com/finance/quote/USD-JPY");

$Nresponse =  $response->decoded_content;

#let's wipe the previously stored file so we have clean results to search from
truncate '/usr/lib/cgi-bin/currency.txt', 0;

# Open a file named "currency.txt"; die if there's an error
open $fh,  '>', "/usr/lib/cgi-bin/currency.txt" or die "Cannot open currency.txt: $!";

# Loop over the array
foreach ($Nresponse)
{
    print $fh "$_\n"; # Print each entry in our array to the file
}
close $fh; # Not necessary, but nice to do

    open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /(The last closing price<\/div><\/span><div class="P6K39c">................)/)
        {
         $JPYresult = "$1";
        }
    }
    close(FH);

$JPYresult =~ s/^.{55}//s;
$JPYresult =~ s/\<.*//;




#CAD
$response = $ua->get("https://www.google.com/finance/quote/USD-CAD");

$Nresponse =  $response->decoded_content;

#let's wipe the previously stored file so we have clean results to search from
truncate '/usr/lib/cgi-bin/currency.txt', 0;

# Open a file named "currency.txt"; die if there's an error
open $fh,  '>', "/usr/lib/cgi-bin/currency.txt" or die "Cannot open currency.txt: $!";

# Loop over the array
foreach ($Nresponse)
{
    print $fh "$_\n"; # Print each entry in our array to the file
}
close $fh; # Not necessary, but nice to do

    open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /(The last closing price<\/div><\/span><div class="P6K39c">................)/)
        {
         $CADresult = "$1";
        }
    }
    close(FH);

$CADresult =~ s/^.{55}//s;
$CADresult =~ s/\<.*//;




#RUB
$response = $ua->get("https://www.google.com/finance/quote/USD-RUB");

$Nresponse =  $response->decoded_content;

#let's wipe the previously stored file so we have clean results to search from
truncate '/usr/lib/cgi-bin/currency.txt', 0;

# Open a file named "currency.txt"; die if there's an error
open $fh,  '>', "/usr/lib/cgi-bin/currency.txt" or die "Cannot open currency.txt: $!";

# Loop over the array
foreach ($Nresponse)
{
    print $fh "$_\n"; # Print each entry in our array to the file
}
close $fh; # Not necessary, but nice to do

    open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /(The last closing price<\/div><\/span><div class="P6K39c">................)/)
        {
         $RUBresult = "$1";
        }
    }
    close(FH);

$RUBresult =~ s/^.{55}//s;
$RUBresult =~ s/\<.*//;




#GBP
$response = $ua->get("https://www.google.com/finance/quote/USD-GBP");

$Nresponse =  $response->decoded_content;

#let's wipe the previously stored file so we have clean results to search from
truncate '/usr/lib/cgi-bin/currency.txt', 0;

# Open a file named "currency.txt"; die if there's an error
open $fh,  '>', "/usr/lib/cgi-bin/currency.txt" or die "Cannot open currency.txt: $!";

# Loop over the array
foreach ($Nresponse)
{
    print $fh "$_\n"; # Print each entry in our array to the file
}
close $fh; # Not necessary, but nice to do

    open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /(The last closing price<\/div><\/span><div class="P6K39c">................)/)
        {
         $GBPresult = "$1";
        }
    }
    close(FH);

$GBPresult =~ s/^.{55}//s;
$GBPresult =~ s/\<.*//;




#AUD
$response = $ua->get("https://www.google.com/finance/quote/USD-AUD");

$Nresponse =  $response->decoded_content;

#let's wipe the previously stored file so we have clean results to search from
truncate '/usr/lib/cgi-bin/currency.txt', 0;

# Open a file named "currency.txt"; die if there's an error
open $fh,  '>', "/usr/lib/cgi-bin/currency.txt" or die "Cannot open currency.txt: $!";

# Loop over the array
foreach ($Nresponse)
{
    print $fh "$_\n"; # Print each entry in our array to the file
}
close $fh; # Not necessary, but nice to do

    open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /(The last closing price<\/div><\/span><div class="P6K39c">................)/)
        {
         $AUDresult = "$1";
        }
    }
    close(FH);

$AUDresult =~ s/^.{55}//s;
$AUDresult =~ s/\<.*//;




#CHF
$response = $ua->get("https://www.google.com/finance/quote/USD-CHF");

$Nresponse =  $response->decoded_content;

#let's wipe the previously stored file so we have clean results to search from
truncate '/usr/lib/cgi-bin/currency.txt', 0;

# Open a file named "currency.txt"; die if there's an error
open $fh,  '>', "/usr/lib/cgi-bin/currency.txt" or die "Cannot open currency.txt: $!";

# Loop over the array
foreach ($Nresponse)
{
    print $fh "$_\n"; # Print each entry in our array to the file
}
close $fh; # Not necessary, but nice to do

    open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /(The last closing price<\/div><\/span><div class="P6K39c">................)/)
        {
         $CHFresult = "$1";
        }
    }
    close(FH);

$CHFresult =~ s/^.{55}//s;
$CHFresult =~ s/\<.*//;




#CNH
$response = $ua->get("https://www.google.com/finance/quote/USD-CNH");

$Nresponse =  $response->decoded_content;

#let's wipe the previously stored file so we have clean results to search from
truncate '/usr/lib/cgi-bin/currency.txt', 0;

# Open a file named "currency.txt"; die if there's an error
open $fh,  '>', "/usr/lib/cgi-bin/currency.txt" or die "Cannot open currency.txt: $!";

# Loop over the array
foreach ($Nresponse)
{
    print $fh "$_\n"; # Print each entry in our array to the file
}
close $fh; # Not necessary, but nice to do

    open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /(The last closing price<\/div><\/span><div class="P6K39c">................)/)
        {
         $CNHresult = "$1";
        }
    }
    close(FH);

$CNHresult =~ s/^.{55}//s;
$CNHresult =~ s/\<.*//;




#HKD
$response = $ua->get("https://www.google.com/finance/quote/USD-HKD");

$Nresponse =  $response->decoded_content;

#let's wipe the previously stored file so we have clean results to search from
truncate '/usr/lib/cgi-bin/currency.txt', 0;

# Open a file named "currency.txt"; die if there's an error
open $fh,  '>', "/usr/lib/cgi-bin/currency.txt" or die "Cannot open currency.txt: $!";

# Loop over the array
foreach ($Nresponse)
{
    print $fh "$_\n"; # Print each entry in our array to the file
}
close $fh; # Not necessary, but nice to do

    open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /(The last closing price<\/div><\/span><div class="P6K39c">................)/)
        {
         $HKDresult = "$1";
        }
    }
    close(FH);

$HKDresult =~ s/^.{55}//s;
$HKDresult =~ s/\<.*//;




#NZD
$response = $ua->get("https://www.google.com/finance/quote/USD-NZD");

$Nresponse =  $response->decoded_content;

#let's wipe the previously stored file so we have clean results to search from
truncate '/usr/lib/cgi-bin/currency.txt', 0;

# Open a file named "currency.txt"; die if there's an error
open $fh,  '>', "/usr/lib/cgi-bin/currency.txt" or die "Cannot open currency.txt: $!";

# Loop over the array
foreach ($Nresponse)
{
    print $fh "$_\n"; # Print each entry in our array to the file
}
close $fh; # Not necessary, but nice to do

    open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /(The last closing price<\/div><\/span><div class="P6K39c">................)/)
        {
         $NZDresult = "$1";
        }
    }
    close(FH);

$NZDresult =~ s/^.{55}//s;
$NZDresult =~ s/\<.*//;




#CNY
$response = $ua->get("https://www.google.com/finance/quote/USD-CNY");

$Nresponse =  $response->decoded_content;

#let's wipe the previously stored file so we have clean results to search from
truncate '/usr/lib/cgi-bin/currency.txt', 0;

# Open a file named "currency.txt"; die if there's an error
open $fh,  '>', "/usr/lib/cgi-bin/currency.txt" or die "Cannot open currency.txt: $!";

# Loop over the array
foreach ($Nresponse)
{
    print $fh "$_\n"; # Print each entry in our array to the file
}
close $fh; # Not necessary, but nice to do

    open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /(The last closing price<\/div><\/span><div class="P6K39c">................)/)
        {
         $CNYresult = "$1";
        }
    }
    close(FH);

$CNYresult =~ s/^.{55}//s;
$CNYresult =~ s/\<.*//;




#SEK
$response = $ua->get("https://www.google.com/finance/quote/USD-SEK");

$Nresponse =  $response->decoded_content;

#let's wipe the previously stored file so we have clean results to search from
truncate '/usr/lib/cgi-bin/currency.txt', 0;

# Open a file named "currency.txt"; die if there's an error
open $fh,  '>', "/usr/lib/cgi-bin/currency.txt" or die "Cannot open currency.txt: $!";

# Loop over the array
foreach ($Nresponse)
{
    print $fh "$_\n"; # Print each entry in our array to the file
}
close $fh; # Not necessary, but nice to do

    open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /(The last closing price<\/div><\/span><div class="P6K39c">................)/)
        {
         $SEKresult = "$1";
        }
    }
    close(FH);

$SEKresult =~ s/^.{55}//s;
$SEKresult =~ s/\<.*//;




#KRW
$response = $ua->get("https://www.google.com/finance/quote/USD-KRW");

$Nresponse =  $response->decoded_content;

#let's wipe the previously stored file so we have clean results to search from
truncate '/usr/lib/cgi-bin/currency.txt', 0;

# Open a file named "currency.txt"; die if there's an error
open $fh,  '>', "/usr/lib/cgi-bin/currency.txt" or die "Cannot open currency.txt: $!";

# Loop over the array
foreach ($Nresponse)
{
    print $fh "$_\n"; # Print each entry in our array to the file
}
close $fh; # Not necessary, but nice to do

    open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /(The last closing price<\/div><\/span><div class="P6K39c">................)/)
        {
         $KRWresult = "$1";
        }
    }
    close(FH);

$KRWresult =~ s/^.{55}//s;
$KRWresult =~ s/\<.*//;




#SGD
$response = $ua->get("https://www.google.com/finance/quote/USD-SGD");

$Nresponse =  $response->decoded_content;

#let's wipe the previously stored file so we have clean results to search from
truncate '/usr/lib/cgi-bin/currency.txt', 0;

# Open a file named "currency.txt"; die if there's an error
open $fh,  '>', "/usr/lib/cgi-bin/currency.txt" or die "Cannot open currency.txt: $!";

# Loop over the array
foreach ($Nresponse)
{
    print $fh "$_\n"; # Print each entry in our array to the file
}
close $fh; # Not necessary, but nice to do

    open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /(The last closing price<\/div><\/span><div class="P6K39c">................)/)
        {
         $SGDresult = "$1";
        }
    }
    close(FH);

$SGDresult =~ s/^.{55}//s;
$SGDresult =~ s/\<.*//;




#NOK
$response = $ua->get("https://www.google.com/finance/quote/USD-NOK");

$Nresponse =  $response->decoded_content;

#let's wipe the previously stored file so we have clean results to search from
truncate '/usr/lib/cgi-bin/currency.txt', 0;

# Open a file named "currency.txt"; die if there's an error
open $fh,  '>', "/usr/lib/cgi-bin/currency.txt" or die "Cannot open currency.txt: $!";

# Loop over the array
foreach ($Nresponse)
{
    print $fh "$_\n"; # Print each entry in our array to the file
}
close $fh; # Not necessary, but nice to do

    open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /(The last closing price<\/div><\/span><div class="P6K39c">................)/)
        {
         $NOKresult = "$1";
        }
    }
    close(FH);

$NOKresult =~ s/^.{55}//s;
$NOKresult =~ s/\<.*//;




#MXN
$response = $ua->get("https://www.google.com/finance/quote/USD-MXN");

$Nresponse =  $response->decoded_content;

#let's wipe the previously stored file so we have clean results to search from
truncate '/usr/lib/cgi-bin/currency.txt', 0;

# Open a file named "currency.txt"; die if there's an error
open $fh,  '>', "/usr/lib/cgi-bin/currency.txt" or die "Cannot open currency.txt: $!";

# Loop over the array
foreach ($Nresponse)
{
    print $fh "$_\n"; # Print each entry in our array to the file
}
close $fh; # Not necessary, but nice to do

    open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /(The last closing price<\/div><\/span><div class="P6K39c">................)/)
        {
         $MXNresult = "$1";
        }
    }
    close(FH);

$MXNresult =~ s/^.{55}//s;
$MXNresult =~ s/\<.*//;




#INR
$response = $ua->get("https://www.google.com/finance/quote/USD-INR");

$Nresponse =  $response->decoded_content;

#let's wipe the previously stored file so we have clean results to search from
truncate '/usr/lib/cgi-bin/currency.txt', 0;

# Open a file named "currency.txt"; die if there's an error
open $fh,  '>', "/usr/lib/cgi-bin/currency.txt" or die "Cannot open currency.txt: $!";

# Loop over the array
foreach ($Nresponse)
{
    print $fh "$_\n"; # Print each entry in our array to the file
}
close $fh; # Not necessary, but nice to do

    open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /(The last closing price<\/div><\/span><div class="P6K39c">................)/)
        {
         $INRresult = "$1";
        }
    }
    close(FH);

$INRresult =~ s/^.{55}//s;
$INRresult =~ s/\<.*//;




#ZAR
$response = $ua->get("https://www.google.com/finance/quote/USD-ZAR");

$Nresponse =  $response->decoded_content;

#let's wipe the previously stored file so we have clean results to search from
truncate '/usr/lib/cgi-bin/currency.txt', 0;

# Open a file named "currency.txt"; die if there's an error
open $fh,  '>', "/usr/lib/cgi-bin/currency.txt" or die "Cannot open currency.txt: $!";

# Loop over the array
foreach ($Nresponse)
{
    print $fh "$_\n"; # Print each entry in our array to the file
}
close $fh; # Not necessary, but nice to do

    open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /(The last closing price<\/div><\/span><div class="P6K39c">................)/)
        {
         $ZARresult = "$1";
        }
    }
    close(FH);

$ZARresult =~ s/^.{55}//s;
$ZARresult =~ s/\<.*//;




#TRY
$response = $ua->get("https://www.google.com/finance/quote/USD-TRY");

$Nresponse =  $response->decoded_content;

#let's wipe the previously stored file so we have clean results to search from
truncate '/usr/lib/cgi-bin/currency.txt', 0;

# Open a file named "currency.txt"; die if there's an error
open $fh,  '>', "/usr/lib/cgi-bin/currency.txt" or die "Cannot open currency.txt: $!";

# Loop over the array
foreach ($Nresponse)
{
    print $fh "$_\n"; # Print each entry in our array to the file
}
close $fh; # Not necessary, but nice to do

    open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /(The last closing price<\/div><\/span><div class="P6K39c">................)/)
        {
         $TRYresult = "$1";
        }
    }
    close(FH);

$TRYresult =~ s/^.{55}//s;
$TRYresult =~ s/\<.*//;



#BRL
$response = $ua->get("https://www.google.com/finance/quote/USD-BRL");

$Nresponse =  $response->decoded_content;

#let's wipe the previously stored file so we have clean results to search from
truncate '/usr/lib/cgi-bin/currency.txt', 0;

# Open a file named "currency.txt"; die if there's an error
open $fh,  '>', "/usr/lib/cgi-bin/currency.txt" or die "Cannot open currency.txt: $!";

# Loop over the array
foreach ($Nresponse)
{
    print $fh "$_\n"; # Print each entry in our array to the file
}
close $fh; # Not necessary, but nice to do

    open(FH, $file) or die("File $file not found");

    while(my $String = <FH>)
    {
        if($String =~ /(The last closing price<\/div><\/span><div class="P6K39c">................)/)
        {
         $BRLresult = "$1";
        }
    }
    close(FH);

$BRLresult =~ s/^.{55}//s;
$BRLresult =~ s/\<.*//;





#print "$EURresult\n";
#print "$JPYresult\n";
#print "$CADresult\n";
#print "$EURresult\n";
#print "$CADresult\n";
#print "$RUBresult\n";
#print "$GBPresult\n";
#print "$AUDresult\n";
#print "$CHFresult\n";
#print "$CNHresult\n";
#print "$HKDresult\n";
#print "$NZDresult\n";
#print "$CNYresult\n";
#print "$SEKresult\n";
#print "$KRWresult\n";
#print "$SGDresult\n";
#print "$NOKresult\n";
#print "$MXNresult\n";
#print "$INRresult\n";
#print "$ZARresult\n";
#print "$TRYresult\n";
#print "$BRLresult\n";


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

#wite the form data back to the database
my $sql = "UPDATE currencydata SET JPY='$JPYresult', EUR='$EURresult', CAD='$CADresult', RUB='$RUBresult', GBP='$GBPresult', AUD='$AUDresult', CHF='$CHFresult', CNH='$CNHresult', HKD='$HKDresult', NZD='$NZDresult', CNY='$CNYresult', SEK='$SEKresult', KRW='$KRWresult', SGD='$SGDresult', NOK='$NOKresult', MXN='$MXNresult', INR='$INRresult', ZAR='$ZARresult', TRY='$TRYresult', BRL='$BRLresult'  WHERE id='1';";

#prepare the query
my $sth = $dbh->prepare($sql);

#execute the query
$sth->execute();

print "all done\n\n";
exit;
