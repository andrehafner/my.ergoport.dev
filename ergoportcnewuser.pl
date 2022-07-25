#!/usr/bin/perl

use CGI;
use DBI;
use Number::Format 'format_number';
use List::Util qw/sum/;
use File::Copy;
use File::Path;

#code to error test via web browser
#$|=1;            # Flush immediately.
#print "Content-Type: text/plain\n\n";

#get vars from ergoportnewuser.pl file
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

#prep mysql statement to see if this person exists already
my $sql = "SELECT * FROM userdata where username='$name';";

#prepare the query
my $sth = $dbh->prepare($sql);

#execute the query
$sth->execute();

## Retrieve the results of a row of data and put in an array
$" = "<br>";
while ( my @row = $sth->fetchrow_array( ) )  {
  push(@array, @row);
};

#set var for checking if someone exists
my $userid = '';

#check to see if the username exists
if ($array[1] eq $name){
$|=1;            # Flush immediately.
print "Content-Type: text/plain\n\n";
print "USER ALREADY EXISTS, hit back and try again please!";
exit;
}


#prep mysql statment to write data as a new user entry into mysql table
$sql = "insert into userdata (username, password) VALUES ('$name',MD5('$pass'));";

#prepare the query
$sth = $dbh->prepare($sql);

#execute the query
$sth->execute();

## Retrieve the results of a row of data and put in an array
$" = "<br>";
while ( @row = $sth->fetchrow_array( ) )  {
  push(@array, @row);
};


#html to display and redirect the user to the edit dashboard
my $html = qq{Content-Type: text/html

<!DOCTYPE html>
<html>
  <head>
<meta http-equiv=\"refresh\" content=\"3; url=https://my.ergoport.dev/cgi-bin/ergoportedit.pl\">
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
            <span id="terminal__prompt--user">Create Port@ubuntu:</span>
            <span id="terminal__prompt--location">~ <p><br></span>

<span id="terminal__prompt--bling"><br>Done - redirecting to login...</span>

          </div>
        </section>
      </div>
    </main>
  </body>
</html>
};

#print it!
print $html;

#goodbye
exit;

