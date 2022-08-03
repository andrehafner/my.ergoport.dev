#!/usr/bin/perl

use CGI;
use DBI;
use Number::Format 'format_number';
use List::Util qw/sum/;
use File::Copy;
use File::Path;

#this code grabs the trailling number off the reference URL
my $q = CGI->new();
my $id = $q->param('a');

#this is for testing so I can see outputs in the browser
$|=1;            # Flush immediately.
print "Content-Type: text/plain\n\n";

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

#prep the sql statement to get the price data
my $sql = "SELECT * FROM pricedata where id='1'";

#prepare the query
my $sth = $dbh->prepare($sql);

#execute the query
$sth->execute();

## Retrieve the results of a row of data and put in an array
$" = "<br>";
while ( my @row = $sth->fetchrow_array( ) )  {
  push(@array, @row);
};

#connect to MySQL database
  $dbh   = DBI->connect ("DBI:mysql:database=$db:host=$host",
  $user,
  $password)
  or die "Can't connect to database: $DBI::errstr\n";

#prep the  mysql statement to get specific userdata row
$sql = "SELECT * FROM userdata where id='11'";

#prepare the query
$sth = $dbh->prepare($sql);

#execute the query
$sth->execute();

## Retrieve the results of a row of data and put in an array
$" = "<br>";
while (my @row2 = $sth->fetchrow_array( ) )  {
  push(@array2, @row2);

};


#connect to MySQL database
  $dbh   = DBI->connect ("DBI:mysql:database=$db:host=$host",
  $user,
  $password)
  or die "Can't connect to database: $DBI::errstr\n";

#prep the  mysql statement to get specific userdata row
$sql = "SELECT * FROM currencydata where id='1'";

#prepare the query
$sth = $dbh->prepare($sql);

#execute the query
$sth->execute();

## Retrieve the results of a row of data and put in an array
$" = "<br>";
while (my @rowCUR = $sth->fetchrow_array( ) )  {
  push(@arrayCUR, @rowCUR);

};


#blank define of vars to use in if statments below
my $CHVAR = '';
my $CHVAR2 = '';
my $CHVAR3 = '';

my $erg = '';
my $sigusd = '';
my $sigrsv = '';
my $neta = '';
my $etosi = '';
my $ergopad = '';
my $exile = '';
my $paideia = '';
my $terahertz = '';
my $egio = '';
my $comet = '';
my $erdoge = '';
my $lunadog = '';
my $migoreng = '';

#cardano chain
my $cdog = '';
my $cnt = '';
my $hosky = '';
my $milk = '';
my $min = '';
my $meld = '';
my $lq = '';
my $dana = '';
my $pavia = '';
my $cneta = '';
my $ctosi = '';
my $ada = '';


my @array3 = @array2;
my @array4 = @array2;
my $totalsum = '';
my $totalsumERGO = '';
my $totalsumCARDANO = '';


#setting the dynamic vars to access speficic table data
$CHVAR = '1';
$CHVAR2 = '3';
$CHVAR3 = '3';
#math for the price calculation
$array3[$CHVAR2] = $array[$CHVAR] * $array2[$CHVAR2];
#lets do a rolling sum for all data totals
$totalsum = ($array3[$CHVAR2] + $totalsum);
$totalsumERGO = ($array3[$CHVAR2] + $totalsumERGO);
#lets get it down to 2 decimals
$array3[$CHVAR2] = sprintf("%.2f", $array3[$CHVAR2]);
#lets give it some commmas so it looks like a number
$array3[$CHVAR2] = format_number ($array3[$CHVAR2]);
$array2[$CHVAR2] = format_number ($array2[$CHVAR2]);
#lets get the main price to 6 decimals since some coins can be low cost
$array[$CHVAR] = sprintf("%.6f", $array[$CHVAR]);
#this is the HTML code that will be pasted below in the template
$erg = "$array[$CHVAR]";

$CHVAR = '11';
$CHVAR2 = '12';
$CHVAR3 = '12';
$array3[$CHVAR3] = $array[$CHVAR] * $array2[$CHVAR3];
$totalsum = ($array3[$CHVAR2] + $totalsum);
$totalsumERGO = ($array3[$CHVAR2] + $totalsumERGO);
$array3[$CHVAR3] = sprintf("%.2f", $array3[$CHVAR3]);
$array3[$CHVAR3] = format_number ($array3[$CHVAR3]);
$array2[$CHVAR2] = format_number ($array2[$CHVAR2]);
$array[$CHVAR] = sprintf("%.6f", $array[$CHVAR]);
$egio = "$array[$CHVAR]";

$CHVAR = '28';
$CHVAR2 = '28';
$CHVAR3 = '28';
$array3[$CHVAR3] = $array[$CHVAR] * $array2[$CHVAR3];
$totalsum = ($array3[$CHVAR2] + $totalsum);
$totalsumCARDANO = ($array3[$CHVAR2] + $totalsumCARDANO);
$array3[$CHVAR3] = sprintf("%.2f", $array3[$CHVAR3]);
$array3[$CHVAR3] = format_number ($array3[$CHVAR3]);
$array2[$CHVAR2] = format_number ($array2[$CHVAR2]);
$array[$CHVAR] = sprintf("%.6f", $array[$CHVAR]);
$ada = "$array[$CHVAR]";


my $ergADA = ($egio / $ada);

#price checker
my $fullid = $id;
my $idclean = $id;
$idclean =~ s/[^0-9.]+//g;
my $amountchecker = ($idclean * $egio);
my $amountcheckerTOKEN = ($amountchecker / $erg);
my $cleanERGcount = $idclean;


#currency converters
my $currency = "USD";
my $currencycolumn = "";

#if ($fullid =~ m/usd/) {
#$currency = "USD";
#$currencycolumn = "@arrayCUR[0]";      
#}

if ($fullid =~ m/jpy/) {
$currency = "JPY";
$currencycolumn = "@arrayCUR[1]";
$egio = ($egio * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}


if ($fullid =~ m/eur/) {
$currency = "EUR";
$currencycolumn = "@arrayCUR[2]";
$egio = ($egio * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/cad/) {
$currency = "CAD";
$currencycolumn = "@arrayCUR[3]";
$egio = ($egio * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/rub/) {
$currency = "RUB";
$currencycolumn = "@arrayCUR[4]";
$egio = ($egio * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/gbp/) {
$currency = "GBP";
$currencycolumn = "@arrayCUR[5]";
$egio = ($egio * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/aud/) {
$currency = "AUD";
$currencycolumn = "@arrayCUR[6]";
$egio = ($egio * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/chf/) {
$currency = "CHF";
$currencycolumn = "@arrayCUR[7]";
$egio = ($egio * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/cnh/) {
$currency = "CNH";
$currencycolumn = "@arrayCUR[8]";
$egio = ($egio * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/hkd/) {
$currency = "HKD";
$currencycolumn = "@arrayCUR[9]";
$egio = ($egio * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/nzd/) {
$currency = "NZD";
$currencycolumn = "@arrayCUR[10]";
$egio = ($egio * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/cny/) {
$currency = "CNY";
$currencycolumn = "@arrayCUR[11]";
$egio = ($egio * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/sek/) {
$currency = "SEK";
$currencycolumn = "@arrayCUR[12]";
$egio = ($egio * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/krw/) {
$currency = "KRW";
$currencycolumn = "@arrayCUR[13]";
$egio = ($egio * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/sgd/) {
$currency = "SGD";
$currencycolumn = "@arrayCUR[14]";
$egio = ($egio * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/nok/) {
$currency = "NOK";
$currencycolumn = "@arrayCUR[15]";
$egio = ($egio * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/mxn/) {
$currency = "MXN";
$currencycolumn = "@arrayCUR[16]";
$egio = ($egio * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/inr/) {
$currency = "INR";
$currencycolumn = "@arrayCUR[17]";
$egio = ($egio * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/zar/) {
$currency = "ZAR";
$currencycolumn = "@arrayCUR[18]";
$egio = ($egio * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/try/) {
$currency = "TRY";
$currencycolumn = "@arrayCUR[19]";
$egio = ($egio * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/brl/) {
$currency = "BRL";
$currencycolumn = "@arrayCUR[20]";
$egio = ($egio * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

#calcualte currency

my $adaERGTOTAL = ($ergADA * $cleanERGcount);

my $printamountchecker = "\n$idclean Egio x \$$egio (Egio Price $currency) = \$$amountchecker $currency \n\$$amountchecker $currency / \$$erg (ERG Price $currency) = $amountcheckerTOKEN ERG \nAlso = $adaERGTOTAL in ADA (no ErgoDex swap pool yet)\n";


$id =~ s/[^0-9.]+//g;
if( $id eq ''){
$printamountchecker = '';
}

$egioERG = ($egio / $erg);

print "### Egio Price Checker ###\n";
print $printamountchecker;
print "\n";
print "Egio: \$$egio in $currency";
print "\n";
print "Egio: $egioERG in ERG";
print "\n";
print "Egio: $ergADA in ADA";
print "\n";
print "ERG: \$$erg in $currency";
print "\n";
print "\n";
print "price updated on $array[16] UTC";
print "\n";
print "check out https://my.ergoport.dev";
print "\n";
print "example portfolio: https://my.ergoport.dev/cgi-bin/ergoport.pl?a=11";


#buhbye
exit;
