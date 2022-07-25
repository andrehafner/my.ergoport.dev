#!/usr/bin/perl

use CGI;
use DBI;
use Number::Format 'format_number';
use List::Util qw/sum/;

#code to check for errors printed on webpage
#$|=1;            # Flush immediately.
#print "Content-Type: text/plain\n\n";

#html to display user and pass for accessing edit dashboard
my $html = qq{Content-Type: text/html

<!DOCTYPE html>
<html>
  <head>

<form ACTION="ergoportfedit.pl" METHOD="post" enctype="multipart/form-data">

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
          <p id="bar__user">Login @ubuntu: ~</p>
        </section>
        <!-- Terminal Body -->
        <section id="terminal__body">
          <div id="terminal__prompt">
            <span id="terminal__prompt--user"> Access@ubuntu:</span>
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

#lets show this!
print $html;

#bye
exit;


