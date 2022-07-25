#!/usr/bin/perl

use CGI;
use DBI;
use Number::Format 'format_number';
use List::Util qw/sum/;
use File::Copy;
use File::Path;

#code to let me troubleshoot and print errors on web html generation
#$|=1;            # Flush immediately.
#print "Content-Type: text/plain\n\n";

#vars coming from the ergoportfedit.pl script
$query = new CGI;
$name = $query->param("name");
$pass = $query->param("pass");
$id = $query->param("id");
$erg = $query->param("erg");
$sigusd = $query->param("sigusd");
$sigrsv = $query->param("sigrsv");
$neta = $query->param("neta");
$etosi = $query->param("etosi");
$ergopad = $query->param("ergopad");
$exile = $query->param("exile");
$paideia = $query->param("paideia");
$terahertz = $query->param("terahertz");
$egio = $query->param("egio");
$comet = $query->param("comet");
$erdoge = $query->param("erdoge");
$lunadog = $query->param("lunadog");
$migoreng = $query->param("migoreng");
$cdog = $query->param("cdog");
$cnt = $query->param("cnt");
$hosky = $query->param("hosky");
$milk = $query->param("milk");
$min = $query->param("min");
$meld = $query->param("meld");
$lq = $query->param("lq");
$dana = $query->param("dana");
$pavia = $query->param("pavia");
$cneta = $query->param("cneta");
$ctosi = $query->param("ctosi");
$ada = $query->param("ada");

$ergPLUS = $query->param("ergPLUS");
$sigusdPLUS = $query->param("sigusdPLUS");
$sigrsvPLUS = $query->param("sigrsvPLUS");
$netaPLUS = $query->param("netaPLUS");
$etosiPLUS = $query->param("etosiPLUS");
$ergopadPLUS = $query->param("ergopadPLUS");
$exilePLUS = $query->param("exilePLUS");
$paideiaPLUS = $query->param("paideiaPLUS");
$terahertzPLUS = $query->param("terahertzPLUS");
$egioPLUS = $query->param("egioPLUS");
$cometPLUS = $query->param("cometPLUS");
$erdogePLUS = $query->param("erdogePLUS");
$lunadogPLUS = $query->param("lunadogPLUS");
$migorengPLUS = $query->param("migorengPLUS");
$cdogPLUS = $query->param("cdogPLUS");
$cntPLUS = $query->param("cntPLUS");
$hoskyPLUS = $query->param("hoskyPLUS");
$milkPLUS = $query->param("milkPLUS");
$minPLUS = $query->param("minPLUS");
$meldPLUS = $query->param("meldPLUS");
$lqPLUS = $query->param("lqPLUS");
$danaPLUS = $query->param("danaPLUS");
$paviaPLUS = $query->param("paviaPLUS");
$cnetaPLUS = $query->param("cnetaPLUS");
$ctosiPLUS = $query->param("ctosiPLUS");
$adaPLUS = $query->param("adaPLUS");

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


#lets add/subtract unless there is no value in the second box (this allows it to be empty instead of 0)
if ($ergPLUS ne ''){
$erg = ($erg + $ergPLUS);
}
if ($sigusdPLUS ne ''){
$sigusd = ($sigusd + $sigusdPLUS);
}
if ($sigrsvPLUS ne ''){
$sigrsv = ($sigrsv + $sigrsvPLUS);
}
if ($netaPLUS ne ''){
$neta = ($neta + $netaPLUS);
}
if ($etosiPLUS ne ''){
$etosi = ($etosi + $etosiPLUS);
}
if ($ergopadPLUS ne ''){
$ergopad = ($ergopad + $ergopadPLUS);
}
if ($exilePLUS ne ''){
$exile = ($exile + $exilePLUS);
}
if ($paideiaPLUS ne ''){
$paideia = ($paideia + $paideiaPLUS);
}
if ($terahertzPLUS ne ''){
$terahertz = ($terahertz + $terahertzPLUS);
}
if ($egioPLUS ne ''){
$egio = ($egio + $egioPLUS);
}
if ($cometPLUS ne ''){
$comet = ($comet + $cometPLUS);
}
if ($erdogePLUS ne ''){
$erdoge = ($erdoge + $erdogePLUS);
}
if ($lunadogPLUS ne ''){
$lunadog = ($lunadog + $lunadogPLUS);
}
if ($migorengPLUS ne ''){
$migoreng = ($migoreng + $migorengPLUS);
}
if ($cdogPLUS ne ''){
$cdog = ($cdog + $cdogPLUS);
}
if ($cntPLUS ne ''){
$cnt = ($cnt + $cntPLUS);
}
if ($hoskyPLUS ne ''){
$hosky = ($hosky + $hoskyPLUS);
}
if ($milkPLUS ne ''){
$milk = ($milk + $milkPLUS);
}
if ($minPLUS ne ''){
$min = ($min + $minPLUS);
}
if ($meldPLUS ne ''){
$meld = ($meld + $meldPLUS);
}
if ($lqPLUS ne ''){
$lq = ($lq + $lqPLUS);
}
if ($danaPLUS ne ''){
$dana = ($dana + $danaPLUS);
}
if ($paviaPLUS ne ''){
$pavia = ($pavia + $paviaPLUS);
}
if ($cnetaPLUS ne ''){
$cneta = ($cneta + $cnetaPLUS);
}
if ($ctosiPLUS ne ''){
$ctosi = ($ctosi + $ctosiPLUS);
}
if ($adaPLUS ne ''){
$ada = ($ada + $adaPLUS);
}

#prep mysql statment to write values to the database
my $sql = "update userdata set erg='$erg',
sigusd='$sigusd',
sigrsv='$sigrsv',
neta='$neta',
etosi='$etosi',
ergopad='$ergopad',
exile='$exile',
paideia='$paideia',
terahertz='$terahertz',
egio='$egio',
comet='$comet',
erdoge='$erdoge',
lunadog='$lunadog',
migoreng='$migoreng',
CDOG='$cdog',
CNT='$cnt',
HOSKY='$hosky',
MILK='$milk',
MIN='$min',
MELD='$meld',
LQ='$lq',
DANA='$dana',
PAVIA='$pavia',
cneta='$cneta',
ctosi='$ctosi',
ada='$ada' where username='$name' and password=MD5('$pass');";

#prepare the query
my $sth = $dbh->prepare($sql);

#execute the query
$sth->execute();


#html to display on the page
my $html = qq{Content-Type: text/html

<!DOCTYPE html>
<html>
  <head>
<meta http-equiv=\"refresh\" content=\"1; url=https://my.ergoport.dev/cgi-bin/ergoport.pl?a=$id\">
<form ACTION="ergoportcedit.pl" METHOD="post" enctype="multipart/form-data">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Ergoport</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="https://my.ergoport.dev/ergoport.css"/>
<link rel="icon" href="https://my.ergoport.dev/ergoport.ico">
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
          <p id="bar__user">Initial @ubuntu: ~</p>
        </section>
        <!-- Terminal Body -->
        <section id="terminal__body">
          <div id="terminal__prompt">
            <span id="terminal__prompt--user">Edit Port@ubuntu:</span>
            <span id="terminal__prompt--location">~ <p><br></span>

<span id="terminal__prompt--bling"><br>Updated - redirecting...</span>

          </div>
        </section>
      </div>
    </main>
  </body>
</html>
};

#lets print it!
print $html;

#bye bye bye
exit;


