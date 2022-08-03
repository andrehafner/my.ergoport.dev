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


$CHVAR = '27';
$CHVAR2 = '27';
$CHVAR3 = '27';
$array3[$CHVAR3] = $array[$CHVAR] * $array2[$CHVAR3];
$totalsum = ($array3[$CHVAR2] + $totalsum);
$totalsumCARDANO = ($array3[$CHVAR2] + $totalsumCARDANO);
$array3[$CHVAR3] = sprintf("%.2f", $array3[$CHVAR3]);
$array3[$CHVAR3] = format_number ($array3[$CHVAR3]);
$array2[$CHVAR2] = format_number ($array2[$CHVAR2]);
$array[$CHVAR] = sprintf("%.6f", $array[$CHVAR]);
$ctosi = "$array[$CHVAR]";


$CHVAR = '5';
$CHVAR2 = '7';
$CHVAR3 = '7';
$array3[$CHVAR3] = $array[$CHVAR] * $array2[$CHVAR3];
$totalsum = ($array3[$CHVAR2] + $totalsum);
$totalsumCARDANO = ($array3[$CHVAR2] + $totalsumCARDANO);
$array3[$CHVAR3] = sprintf("%.2f", $array3[$CHVAR3]);
$array3[$CHVAR3] = format_number ($array3[$CHVAR3]);
$array2[$CHVAR2] = format_number ($array2[$CHVAR2]);
$array[$CHVAR] = sprintf("%.6f", $array[$CHVAR]);
$etosi = "$array[$CHVAR]";

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

if ($array2[28] ne ''){
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
}


my $ergADA = ($etosi / $ada);
my $ergADA2 = ($ctosi / $erg);


#price checker
my $fullid = $id;
my $idclean = $id;
$idclean =~ s/[^0-9.]+//g;
my $amountchecker = ($idclean * $etosi);
my $amountcheckerTOKEN = ($amountchecker / $erg);
my $amountchecker2 = ($idclean * $ctosi);
my $amountcheckerTOKEN2 = ($amountchecker2 / $ada);
my $cleanERGcount = $idclean;
my $cleanERGcount2 = $idclean;

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
$etosi = ($etosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}


if ($fullid =~ m/eur/) {
$currency = "EUR";
$currencycolumn = "@arrayCUR[2]";
$etosi = ($etosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/cad/) {
$currency = "CAD";
$currencycolumn = "@arrayCUR[3]";
$etosi = ($etosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/rub/) {
$currency = "RUB";
$currencycolumn = "@arrayCUR[4]";
$etosi = ($etosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/gbp/) {
$currency = "GBP";
$currencycolumn = "@arrayCUR[5]";
$etosi = ($etosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/aud/) {
$currency = "AUD";
$currencycolumn = "@arrayCUR[6]";
$etosi = ($etosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/chf/) {
$currency = "CHF";
$currencycolumn = "@arrayCUR[7]";
$etosi = ($etosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/cnh/) {
$currency = "CNH";
$currencycolumn = "@arrayCUR[8]";
$etosi = ($etosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/hkd/) {
$currency = "HKD";
$currencycolumn = "@arrayCUR[9]";
$etosi = ($etosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/nzd/) {
$currency = "NZD";
$currencycolumn = "@arrayCUR[10]";
$etosi = ($etosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/cny/) {
$currency = "CNY";
$currencycolumn = "@arrayCUR[11]";
$etosi = ($etosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/sek/) {
$currency = "SEK";
$currencycolumn = "@arrayCUR[12]";
$etosi = ($etosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/krw/) {
$currency = "KRW";
$currencycolumn = "@arrayCUR[13]";
$etosi = ($etosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/sgd/) {
$currency = "SGD";
$currencycolumn = "@arrayCUR[14]";
$etosi = ($etosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/nok/) {
$currency = "NOK";
$currencycolumn = "@arrayCUR[15]";
$etosi = ($etosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/mxn/) {
$currency = "MXN";
$currencycolumn = "@arrayCUR[16]";
$etosi = ($etosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/inr/) {
$currency = "INR";
$currencycolumn = "@arrayCUR[17]";
$etosi = ($etosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/zar/) {
$currency = "ZAR";
$currencycolumn = "@arrayCUR[18]";
$etosi = ($etosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/try/) {
$currency = "TRY";
$currencycolumn = "@arrayCUR[19]";
$etosi = ($etosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/brl/) {
$currency = "BRL";
$currencycolumn = "@arrayCUR[20]";
$etosi = ($etosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}


if ($fullid =~ m/jpy/) {
$currency = "JPY";
$currencycolumn = "@arrayCUR[1]";
$ctosi = ($ctosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}


if ($fullid =~ m/eur/) {
$currency = "EUR";
$currencycolumn = "@arrayCUR[2]";
$ctosi = ($ctosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/cad/) {
$currency = "CAD";
$currencycolumn = "@arrayCUR[3]";
$ctosi = ($ctosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/rub/) {
$currency = "RUB";
$currencycolumn = "@arrayCUR[4]";
$ctosi = ($ctosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/gbp/) {
$currency = "GBP";
$currencycolumn = "@arrayCUR[5]";
$ctosi = ($ctosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/aud/) {
$currency = "AUD";
$currencycolumn = "@arrayCUR[6]";
$ctosi = ($ctosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/chf/) {
$currency = "CHF";
$currencycolumn = "@arrayCUR[7]";
$ctosi = ($ctosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/cnh/) {
$currency = "CNH";
$currencycolumn = "@arrayCUR[8]";
$ctosi = ($ctosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/hkd/) {
$currency = "HKD";
$currencycolumn = "@arrayCUR[9]";
$ctosi = ($ctosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/nzd/) {
$currency = "NZD";
$currencycolumn = "@arrayCUR[10]";
$ctosi = ($ctosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/cny/) {
$currency = "CNY";
$currencycolumn = "@arrayCUR[11]";
$ctosi = ($ctosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/sek/) {
$currency = "SEK";
$currencycolumn = "@arrayCUR[12]";
$ctosi = ($ctosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/krw/) {
$currency = "KRW";
$currencycolumn = "@arrayCUR[13]";
$ctosi = ($ctosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/sgd/) {
$currency = "SGD";
$currencycolumn = "@arrayCUR[14]";
$ctosi = ($ctosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/nok/) {
$currency = "NOK";
$currencycolumn = "@arrayCUR[15]";
$ctosi = ($ctosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/mxn/) {
$currency = "MXN";
$currencycolumn = "@arrayCUR[16]";
$ctosi = ($ctosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/inr/) {
$currency = "INR";
$currencycolumn = "@arrayCUR[17]";
$ctosi = ($ctosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/zar/) {
$currency = "ZAR";
$currencycolumn = "@arrayCUR[18]";
$ctosi = ($ctosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/try/) {
$currency = "TRY";
$currencycolumn = "@arrayCUR[19]";
$ctosi = ($ctosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}

if ($fullid =~ m/brl/) {
$currency = "BRL";
$currencycolumn = "@arrayCUR[20]";
$ctosi = ($ctosi * $currencycolumn);
$erg = ($erg * $currencycolumn);
#$amountcheckerTOKEN = ($amountcheckerTOKEN * $currencycolumn);
$amountchecker = ($amountchecker * $currencycolumn);
}


#calcualte currency


my $adaERGTOTAL = ($ergADA * $cleanERGcount);
my $adaERGTOTAL2 = ($ergADA2 * $cleanERGcount2);




#price checker
my $idclean = $id;
$idclean =~ s/[^0-9.]+//g;
my $amountchecker = ($idclean * $etosi);
my $amountcheckerTOKEN = ($amountchecker / $erg);
#my $printamountchecker = "\n$idclean eTosi x \$$etosi (eTosi Price) = \$$amountchecker USD \n\$$amountchecker USD / \$$erg (ERG Price) = $amountcheckerTOKEN ERG \n";
my $printamountchecker = "\n$idclean eTosi x \$$etosi (eTosi Price $currency) = \$$amountchecker $currency \n\$$amountchecker $currency / \$$erg (ERG Price $currency) = $amountcheckerTOKEN ERG \nAlso = $adaERGTOTAL in ADA (no ErgoDex swap pool yet)\n";


#price checker
my $idclean2 = $id;
$idclean2 =~ s/[^0-9.]+//g;
my $amountchecker2 = ($idclean2 * $ctosi);
my $amountcheckerTOKEN2 = ($amountchecker2 / $ada);
#my $printamountchecker2 = "\n$idclean cTosi x \$$ctosi (cTosi Price) = \$$amountchecker2 USD \n\$$amountchecker2 USD / \$$ada (ADA Price) = $amountcheckerTOKEN2 ADA \n";
my $printamountchecker2 = "\n$idclean cTosi x \$$ctosi (cTosi Price $currency) = \$$amountchecker2 $currency \n\$$amountchecker2 $currency / \$$ada (ADA Price $currency) = $amountcheckerTOKEN2 ADA \nAlso = $adaERGTOTAL2 in ERG (no ErgoDex swap pool yet)\n";


$id =~ s/[^0-9.]+//g;
if( $id eq ''){
$printamountchecker = '';
$printamountchecker2 = '';
}

if (lc $fullid =~ 'ctosi'){
$printamountchecker = '';
}else{
$printamountchecker2 = '';
}


$ctosiADA = ($ctosi/$ada);
$etosiERG = ($etosi/$erg);

print "### cTosi/eTosi Price Checker ###\n";
print $printamountchecker;
print $printamountchecker2;
print "\n";
print "cTosi: \$$ctosi in $currency";
print "\n";
print "cTosi: $ctosiADA in ADA";
print "\n";
print "cTosi: $ergADA2 in ERG";
print "\n";
print " ADA: \$$ada in $currency";
print "\n";
print "\n";
print "eTosi: \$$etosi in $currency";
print "\n";
print "eTosi: $etosiERG in ERG";
print "\n";
print "eTosi: $ergADA in ADA";
print "\n";
print " ERG: \$$erg in $currency";
print "\n";
print "\n";
print "price updated on $array[16] UTC";
print "\n";
print "check out https://my.ergoport.dev";
print "\n";
print "example portfolio: https://my.ergoport.dev/cgi-bin/ergoport.pl?a=11";

#buhbye
exit;

