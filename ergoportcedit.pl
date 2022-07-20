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
migoreng='$migoreng' where username='$name' and password=MD5('$pass');";

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


