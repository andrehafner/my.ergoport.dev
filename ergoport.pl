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
#$|=1;            # Flush immediately.
#print "Content-Type: text/plain\n\n";

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
$sql = "SELECT * FROM userdata where id='$id'";

#prepare the query
$sth = $dbh->prepare($sql);

#execute the query
$sth->execute();

## Retrieve the results of a row of data and put in an array
$" = "<br>";
while (my @row2 = $sth->fetchrow_array( ) )  {
  push(@array2, @row2);

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

my @array3 = @array2;
my @array4 = @array2;
my $totalsum = '';


#statements to create HTML with price and count data for user, if no data is in the table then it returns nothing thus not showing up on the html output
if ($array2[3] ne ''){
#setting the dynamic vars to access speficic table data
$CHVAR = '1';
$CHVAR2 = '3';
$CHVAR3 = '3';
#math for the price calculation
$array3[$CHVAR2] = $array[$CHVAR] * $array2[$CHVAR2];
#lets do a rolling sum for all data totals
$totalsum = ($array3[$CHVAR2] + $totalsum);
#lets get it down to 2 decimals
$array3[$CHVAR2] = sprintf("%.2f", $array3[$CHVAR2]);
#lets give it some commmas so it looks like a number
$array3[$CHVAR2] = format_number ($array3[$CHVAR2]);
$array2[$CHVAR2] = format_number ($array2[$CHVAR2]);
#lets get the main price to 6 decimals since some coins can be low cost
$array[$CHVAR] = sprintf("%.6f", $array[$CHVAR]);
#this is the HTML code that will be pasted below in the template
$erg = "<span id=\"terminal__prompt--bling\">ERG USD:<font color=\"#3399ff\">\$$array[$CHVAR] </font color=\"#3399ff\">  TT:<font color=\"#ffff00\">$array2[$CHVAR2]</font color=\"#ffff00\"> TUSD:<font color=\"#33cc33\">\$$array3[$CHVAR3]<br></span>";

}

if ($array2[4] ne ''){
$CHVAR = '2';
$CHVAR2 = '4';
$CHVAR3 = '4';
$array3[$CHVAR3] = $array[$CHVAR] * $array2[$CHVAR3];
$totalsum = ($array3[$CHVAR2] + $totalsum);
$array3[$CHVAR3] = sprintf("%.2f", $array3[$CHVAR3]);
$array3[$CHVAR3] = format_number ($array3[$CHVAR3]);
$array2[$CHVAR2] = format_number ($array2[$CHVAR2]);
$array[$CHVAR] = sprintf("%.6f", $array[$CHVAR]);
$sigusd = "<span id=\"terminal__prompt--bling\">SIG USD:<font color=\"#3399ff\">\$$array[$CHVAR] </font color=\"#3399ff\"> TT:<font color=\"#ffff00\">$array2[$CHVAR2]</font color=\"#ffff00\"> TUSD:<font color=\"#33cc33\">\$$array3[$CHVAR3]<br></span>";
}

if ($array2[5] ne ''){
$CHVAR = '3';
$CHVAR2 = '5';
$CHVAR3 = '5';
$array3[$CHVAR3] = $array[$CHVAR] * $array2[$CHVAR3];
$totalsum = ($array3[$CHVAR2] + $totalsum);
$array3[$CHVAR3] = sprintf("%.2f", $array3[$CHVAR3]);
$array3[$CHVAR3] = format_number ($array3[$CHVAR3]);
$array2[$CHVAR2] = format_number ($array2[$CHVAR2]);
$array[$CHVAR] = sprintf("%.6f", $array[$CHVAR]);
$sigrsv = "<span id=\"terminal__prompt--bling\">SigRSV USD:<font color=\"#3399ff\">\$$array[$CHVAR] </font color=\"#3399ff\"> TT:<font color=\"#ffff00\">$array2[$CHVAR2]</font color=\"#ffff00\"> TUSD:<font color=\"#33cc33\">\$$array3[$CHVAR3]<br></span>";
}

if ($array2[6] ne ''){
$CHVAR = '4';
$CHVAR2 = '6';
$CHVAR3 = '6';
$array3[$CHVAR3] = $array[$CHVAR] * $array2[$CHVAR3];
$totalsum = ($array3[$CHVAR2] + $totalsum);
$array3[$CHVAR3] = sprintf("%.2f", $array3[$CHVAR3]);
$array3[$CHVAR3] = format_number ($array3[$CHVAR3]);
$array2[$CHVAR2] = format_number ($array2[$CHVAR2]);
$array[$CHVAR] = sprintf("%.6f", $array[$CHVAR]);
$neta = "<span id=\"terminal__prompt--bling\">NETA USD:<font color=\"#3399ff\">\$$array[$CHVAR] </font color=\"#3399ff\"> TT:<font color=\"#ffff00\">$array2[$CHVAR2]</font color=\"#ffff00\"> TUSD:<font color=\"#33cc33\">\$$array3[$CHVAR3]<br></span>";
}

if ($array2[7] ne ''){
$CHVAR = '5';
$CHVAR2 = '7';
$CHVAR3 = '7';
$array3[$CHVAR3] = $array[$CHVAR] * $array2[$CHVAR3];
$totalsum = ($array3[$CHVAR2] + $totalsum);
$array3[$CHVAR3] = sprintf("%.2f", $array3[$CHVAR3]);
$array3[$CHVAR3] = format_number ($array3[$CHVAR3]);
$array2[$CHVAR2] = format_number ($array2[$CHVAR2]);
$array[$CHVAR] = sprintf("%.6f", $array[$CHVAR]);
$etosi = "<span id=\"terminal__prompt--bling\">eTosiD USD:<font color=\"#3399ff\">\$$array[$CHVAR] </font color=\"#3399ff\"> TT:<font color=\"#ffff00\">$array2[$CHVAR2]</font color=\"#ffff00\"> TUSD:<font color=\"#33cc33\">\$$array3[$CHVAR3]<br></span>";
}

if ($array2[8] ne ''){
$CHVAR = '6';
$CHVAR2 = '8';
$CHVAR3 = '8';
$array3[$CHVAR3] = $array[$CHVAR] * $array2[$CHVAR3];
$totalsum = ($array3[$CHVAR2] + $totalsum);
$array3[$CHVAR3] = sprintf("%.2f", $array3[$CHVAR3]);
$array3[$CHVAR3] = format_number ($array3[$CHVAR3]);
$array2[$CHVAR2] = format_number ($array2[$CHVAR2]);
$array[$CHVAR] = sprintf("%.6f", $array[$CHVAR]);
$ergopad = "<span id=\"terminal__prompt--bling\">ERGOPAD USD:<font color=\"#3399ff\">\$$array[$CHVAR] </font color=\"#3399ff\"> TT:<font color=\"#ffff00\">$array2[$CHVAR2]</font color=\"#ffff00\"> TUSD:<font color=\"#33cc33\">\$$array3[$CHVAR3]<br></span>";
}

if ($array2[9] ne ''){
$CHVAR = '8';
$CHVAR2 = '9';
$CHVAR3 = '9';
$array3[$CHVAR3] = $array[$CHVAR] * $array2[$CHVAR3];
$totalsum = ($array3[$CHVAR2] + $totalsum);
$array3[$CHVAR3] = sprintf("%.2f", $array3[$CHVAR3]);
$array3[$CHVAR3] = format_number ($array3[$CHVAR3]);
$array2[$CHVAR2] = format_number ($array2[$CHVAR2]);
$array[$CHVAR] = sprintf("%.6f", $array[$CHVAR]);
$exile = "<span id=\"terminal__prompt--bling\">EXILE USD:<font color=\"#3399ff\">\$$array[$CHVAR] </font color=\"#3399ff\"> TT:<font color=\"#ffff00\">$array2[$CHVAR2]</font color=\"#ffff00\"> TUSD:<font color=\"#33cc33\">\$$array3[$CHVAR3]<br></span>";
}

if ($array2[10] ne ''){
$CHVAR = '9';
$CHVAR2 = '10';
$CHVAR3 = '10';
$array3[$CHVAR3] = $array[$CHVAR] * $array2[$CHVAR3];
$totalsum = ($array3[$CHVAR2] + $totalsum);
$array3[$CHVAR3] = sprintf("%.2f", $array3[$CHVAR3]);
$array3[$CHVAR3] = format_number ($array3[$CHVAR3]);
$array2[$CHVAR2] = format_number ($array2[$CHVAR2]);
$array[$CHVAR] = sprintf("%.6f", $array[$CHVAR]);
$paideia = "<span id=\"terminal__prompt--bling\">Paideia USD:<font color=\"#3399ff\">\$$array[$CHVAR] </font color=\"#3399ff\"> TT:<font color=\"#ffff00\">$array2[$CHVAR2]</font color=\"#ffff00\"> TUSD:<font color=\"#33cc33\">\$$array3[$CHVAR3]<br></span>";
}

if ($array2[11] ne ''){
$CHVAR = '10';
$CHVAR2 = '11';
$CHVAR3 = '11';
$array3[$CHVAR3] = $array[$CHVAR] * $array2[$CHVAR3];
$totalsum = ($array3[$CHVAR2] + $totalsum);
$array3[$CHVAR3] = sprintf("%.2f", $array3[$CHVAR3]);
$array3[$CHVAR3] = format_number ($array3[$CHVAR3]);
$array2[$CHVAR2] = format_number ($array2[$CHVAR2]);
$array[$CHVAR] = sprintf("%.6f", $array[$CHVAR]);
$terahertz = "<span id=\"terminal__prompt--bling\">Terahertz USD:<font color=\"#3399ff\">\$$array[$CHVAR] </font color=\"#3399ff\"> TT:<font color=\"#ffff00\">$array2[$CHVAR2]</font color=\"#ffff00\"> TUSD:<font color=\"#33cc33\">\$$array3[$CHVAR3]<br></span>";
}

if ($array2[12] ne ''){
$CHVAR = '11';
$CHVAR2 = '12';
$CHVAR3 = '12';
$array3[$CHVAR3] = $array[$CHVAR] * $array2[$CHVAR3];
$totalsum = ($array3[$CHVAR2] + $totalsum);
$array3[$CHVAR3] = sprintf("%.2f", $array3[$CHVAR3]);
$array3[$CHVAR3] = format_number ($array3[$CHVAR3]);
$array2[$CHVAR2] = format_number ($array2[$CHVAR2]);
$array[$CHVAR] = sprintf("%.6f", $array[$CHVAR]);
$egio = "<span id=\"terminal__prompt--bling\">EGIO USD:<font color=\"#3399ff\">\$$array[$CHVAR] </font color=\"#3399ff\"> TT:<font color=\"#ffff00\">$array2[$CHVAR2]</font color=\"#ffff00\"> TUSD:<font color=\"#33cc33\">\$$array3[$CHVAR3]<br></span>";
}

if ($array2[13] ne ''){
$CHVAR = '12';
$CHVAR2 = '13';
$CHVAR3 = '13';
$array3[$CHVAR3] = $array[$CHVAR] * $array2[$CHVAR3];
$totalsum = ($array3[$CHVAR2] + $totalsum);
$array3[$CHVAR3] = sprintf("%.2f", $array3[$CHVAR3]);
$array3[$CHVAR3] = format_number ($array3[$CHVAR3]);
$array2[$CHVAR2] = format_number ($array2[$CHVAR2]);
$array[$CHVAR] = sprintf("%.6f", $array[$CHVAR]);
$comet = "<span id=\"terminal__prompt--bling\">COMET USD:<font color=\"#3399ff\">\$$array[$CHVAR] </font color=\"#3399ff\"> TT:<font color=\"#ffff00\">$array2[$CHVAR2]</font color=\"#ffff00\"> TUSD:<font color=\"#33cc33\">\$$array3[$CHVAR3]<br></span>";
}

if ($array2[14] ne ''){
$CHVAR = '13';
$CHVAR2 = '14';
$CHVAR3 = '14';
$array3[$CHVAR3] = $array[$CHVAR] * $array2[$CHVAR3];
$totalsum = ($array3[$CHVAR2] + $totalsum);
$array3[$CHVAR3] = sprintf("%.2f", $array3[$CHVAR3]);
$array3[$CHVAR3] = format_number ($array3[$CHVAR3]);
$array2[$CHVAR2] = format_number ($array2[$CHVAR2]);
$array[$CHVAR] = sprintf("%.6f", $array[$CHVAR]);
$erdoge = "<span id=\"terminal__prompt--bling\">ERDOGE USD:<font color=\"#3399ff\">\$$array[$CHVAR] </font color=\"#3399ff\"> TT:<font color=\"#ffff00\">$array2[$CHVAR2]</font color=\"#ffff00\"> TUSD:<font color=\"#33cc33\">\$$array3[$CHVAR3]<br></span>";
}

if ($array2[15] ne ''){
$CHVAR = '14';
$CHVAR2 = '15';
$CHVAR3 = '15';
$array3[$CHVAR3] = $array[$CHVAR] * $array2[$CHVAR3];
$totalsum = ($array3[$CHVAR2] + $totalsum);
$array3[$CHVAR3] = sprintf("%.2f", $array3[$CHVAR3]);
$array3[$CHVAR3] = format_number ($array3[$CHVAR3]);
$array2[$CHVAR2] = format_number ($array2[$CHVAR2]);
$array[$CHVAR] = sprintf("%.6f", $array[$CHVAR]);
$lunadog = "<span id=\"terminal__prompt--bling\">LunaDog USD:<font color=\"#3399ff\">\$$array[$CHVAR] </font color=\"#3399ff\"> TT:<font color=\"#ffff00\">$array2[$CHVAR2]</font color=\"#ffff00\"> TUSD:<font color=\"#33cc33\">\$$array3[$CHVAR3]<br></span>";
}

if ($array2[16] ne ''){
$CHVAR = '15';
$CHVAR2 = '16';
$CHVAR3 = '16';
$array3[$CHVAR3] = $array[$CHVAR] * $array2[$CHVAR3];
$totalsum = ($array3[$CHVAR2] + $totalsum);
$array3[$CHVAR3] = sprintf("%.2f", $array3[$CHVAR3]);
$array3[$CHVAR3] = format_number ($array3[$CHVAR3]);
$array2[$CHVAR2] = format_number ($array2[$CHVAR2]);
$array[$CHVAR] = sprintf("%.6f", $array[$CHVAR]);
$migoreng = "<span id=\"terminal__prompt--bling\">Mi Goreng USD:<font color=\"#3399ff\">\$$array[$CHVAR] </font color=\"#3399ff\"> TT:<font color=\"#ffff00\">$array2[$CHVAR2]</font color=\"#ffff00\"> TUSD:<font color=\"#33cc33\">\$$array3[$CHVAR3]<br></span>";
}

#tell them how to view random ergoports if they enter the page with no number
my $explainhow = '';

if ($id eq ''){
$explainhow = "You didn't specify an ergoport!<br><br>Links in RED below:<br>1. Either create an ergoport<br>2. Or Edit your data to log in (it will take you to your ergoport after)<br>3. Or look at a random ergoport by adding a number to the end of the<br>URL in the toolbar (try with the number 10)!! <br><br>";
}

#putting the total sum of USD for a user into 2 decimals as well as comma
$totalsum = sprintf("%.2f", $totalsum);
$totalsum = format_number ($totalsum);

#the html that will be displayed in the page
my $html = qq{Content-Type: text/html

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Ubuntu Terminal</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="https://my.ergoport.dev/ergoport.css"/>
  </head>
  <body>
    <main id="container">
      <div id="terminal">
        <!-- Terminal Bar -->
        <section id="terminal__bar">
          <div id="bar__buttons">
            <button class="bar__button" id="bar__button--exit">&#10005;</button>
            <button class="bar__button">&#9472;</button>
            <button class="bar__button">&#9723;</button>
          </div>
          <p id="bar__user">USER ID $array2[0]@ubuntu: ~</p>
        </section>
        <!-- Terminal Body -->
        <section id="terminal__body">
          <div id="terminal__prompt">
            <span id="terminal__prompt--user">$array2[1]@ubuntu:</span>
            <span id="terminal__prompt--location">~ <p> </span>

            <span id="terminal__prompt--bling"><br>ERGO Data from Ergodex refreshed on: $array[7] UTC<br></span>
            <span id="terminal__prompt--bling"><br>In Order: Current USD Price, Total Tokens, Total USD in you Tokens<br><br><br></span>
$explainhow
$erg
$sigusd
$sigrsv
$neta
$etosi
$ergopad
$exile
$paideia
$terahertz
$egio
$comet
$erdoge
$lunadog
$migoreng
            <span id="terminal__prompt--bling"><br>Total USD: <font color=\"#ff007b\"> \$$totalsum <br><br></span>

<span id="terminal__prompt--bling"><br><font color=\"#ffffff\"><br> *share your ergoport by simply copying the link in your brower address bar!<br><br></span>


            <span id="terminal__prompt--bling"> <font color=\"#ff3300\"> <a href="https://my.ergoport.dev/cgi-bin/ergoportedit.pl"><font color=\"#ff3300\">edit your data</a>  
 | <a href="https://my.ergoport.dev/cgi-bin/ergoportabout.pl?a=$id"><font color=\"#ff3300\">about
 | <a href="https://my.ergoport.dev/cgi-bin/ergoportnewuser.pl"><font color=\"#ff3300\">create an ergoport
 | <a href="https://my.ergoport.dev/cgi-bin/ergoporttip.pl?a=$id"><font color=\"#ff3300\">tip me!
</span>

            <span id="terminal__prompt--cursor"></span>
          </div>
        </section>
      </div>
    </main>
  </body>
</html>
};

#lets print that HTML to the page
print $html;

#buhbye
exit;
