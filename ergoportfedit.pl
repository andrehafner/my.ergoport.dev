#!/usr/bin/perl

use CGI;
use DBI;
use Number::Format 'format_number';
use List::Util qw/sum/;
use File::Copy;
use File::Path;

#get vars from ergoportedit.pl
$query = new CGI;
$name = $query->param("name");
$pass = $query->param("pass");

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


#prep connect to MySQL database
my $dbh   = DBI->connect ("DBI:mysql:database=$db:host=$host",
  $user,
  $password)
  or die "Can't connect to database: $DBI::errstr\n";

#prep mysql statment to get the user data that matches
my $sql = "SELECT * FROM userdata where username='$name' and password=MD5('$pass');";

#prepare the query
my $sth = $dbh->prepare($sql);

#execute the query
$sth->execute();

## Retrieve the results of a row of data and put in an array
$" = "<br>";
while ( my @row = $sth->fetchrow_array( ) )  {
  push(@array, @row);
};

#set var blank for checking if user exists
my $userid = '';

#set user to correct id in the mysql table if they exist
if ($array[1] eq $name && $array[2] ne ''){
$userid = $array[0];
}

#tell the user their pasword or id was wrong
else {
$|=1;            # Flush immediately.
print "Content-Type: text/plain\n\n";
print "WRONG PASSWORD OR USER, hit back and try again please!";
exit;
}

#if id and password matches it will continue here and let them edit their data
my $html = qq{Content-Type: text/html

<!DOCTYPE html>
<html>
  <head>

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

<span id="terminal__prompt--location">Fill in each field with the amount of tokens you are holding! <p><br></span>

            <input type="text" name="erg" maxlength="49" value="$array[3]">
            <label for="erg"><b>ERG</b><b><b><br></label>

            <input type="text" name="sigusd" maxlength="49" value="$array[4]">        
            <label for="sigusd"><b>SigUSD</b><b><b><br></label>

            <input type="text" name="sigrsv" maxlength="49" value="$array[5]">        
            <label for="sigrsv"><b>SigRSV</b><b><b><br></label>

            <input type="text" name="neta" maxlength="49" value="$array[6]">        
            <label for="neta"><b>NETA</b><b><b><br></label>

            <input type="text" name="etosi" maxlength="49" value="$array[7]">        
            <label for="etosi"><b>eTosi</b><b><b><br></label>

            <input type="text" name="ergopad" maxlength="49" value="$array[8]">        
            <label for="ergopad"><b>ERGOPAD</b><b><b><br></label>

            <input type="text" name="exile" maxlength="49" value="$array[9]">        
            <label for="exile"><b>EXILE</b><b><b><br></label>

            <input type="text" name="paideia" maxlength="49" value="$array[10]">        
            <label for="paideia"><b>PAIDEIA</b><b><b><br></label>

            <input type="text" name="terahertz" maxlength="49" value="$array[11]">        
            <label for="terahertz"><b>TERAHERTZ</b><b><b><br></label>

            <input type="text" name="egio" maxlength="49" value="$array[12]">        
            <label for="egio"><b>EGIO</b><b><b><br></label>

            <input type="text" name="comet" maxlength="49" value="$array[13]">        
            <label for="comet"><b>COMET</b><b><b><br></label>

            <input type="text" name="erdoge" maxlength="49" value="$array[14]">        
            <label for="erdoge"><b>ERDOGE</b><b><b><br></label>

            <input type="text" name="lunadog" maxlength="49" value="$array[15]">        
            <label for="lunadog"><b>LunaDog</b><b><b><br></label>

            <input type="text" name="migoreng" maxlength="49" value="$array[16]">        
            <label for="migoreng"><b>Mi Goreng</b><b><b><br></label>

<input type="hidden" name="name" maxlength="49" value="$name">
<input type="hidden" name="pass" maxlength="49" value="$pass">
<input type="hidden" name="id" maxlength="49" value="$array[0]">

            <label for="submit"><br><br><br><b>click below to commit changes!</b><br><br></label>
            <INPUT TYPE="submit" NAME="Submit" VALUE="commit">

          </div>
        </section>
      </div>
    </main>
  </body>
</html>
};

#lets print it on the page
print $html;

#exit
exit;


