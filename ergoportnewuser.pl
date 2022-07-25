#!/usr/bin/perl

use CGI;
use DBI;
use Number::Format 'format_number';
use List::Util qw/sum/;

#helps me view errors on the webpage output
#$|=1;            # Flush immediately.
#print "Content-Type: text/plain\n\n";

#display new user input html
my $html = qq{Content-Type: text/html

<!DOCTYPE html>
<html>
  <head>

<form ACTION="ergoportcnewuser.pl" METHOD="post" enctype="multipart/form-data">

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
            <span id="terminal__prompt--user"> Create@ubuntu:</span>
            <span id="terminal__prompt--location">~ <p><br></span>

            <label for="name"><b>ergoport name</b></label>
            <input type="text" name="name" maxlength="49" value=""><br><br>

            <label for="pass"><b>access phrase</b></label>
            <input type="password" name="pass" maxlength="49" value=""><br>

            <label for="submit"><br><br><br><b>click access to proceed!</b><br><br></label>
            <INPUT TYPE="submit" NAME="Submit" VALUE="access edit page">

          </div>
        </section>
      </div>
    </main>
  </body>
</html>
};

#print it
print $html;

#bye!
exit;


