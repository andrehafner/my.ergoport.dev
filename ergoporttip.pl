#!/usr/bin/perl

use CGI;

#get the trailing var from the page that sent us here so that we know where to send them back to
my $q = CGI->new();
my $id = $q->param('a');

#prep the html!
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
          <p id="bar__user">tips@ubuntu: ~</p>
        </section>
        <!-- Terminal Body -->
        <section id="terminal__body">
          <div id="terminal__prompt">
            <span id="terminal__prompt--user">coffee@ubuntu:</span>
            <span id="terminal__prompt--location">~ <p> </span>

            <span id="terminal__prompt--bling"><br>Any tips are super appreciated!<br><br><br></span>
            <span id="terminal__prompt--bling">ergo wallet:<br>9eZPTmn8zp5GJ7KZwTo8cEuxNdezWaY3hBbLeWid7EAZedzb9tD<br></span>
            <span id="terminal__prompt--bling"><br>cardano wallet:<br>addr1qxwxpafgqasnddk8et6en0vn74awg4j0n2nfek6e62aywvgcwedk5s2s92dx7msutk33zsl92uh8uhahh305nz7pekjsz5l37w<br><br><br></span>



            <span id="terminal__prompt--bling"> <font color=\"#ff3300\"> <a href="https://my.ergoport.dev/cgi-bin/ergoportedit.pl"><font color=\"#ff3300\">edit your data</a>  
 | <a href="https://my.ergoport.dev/cgi-bin/ergoportabout.pl?a=$id"><font color=\"#ff3300\">about
 | <a href="https://my.ergoport.dev/cgi-bin/ergoportnewuser.pl"><font color=\"#ff3300\">create an ergoport
 | <a href="https://my.ergoport.dev/cgi-bin/ergoport.pl?a=$id"><font color=\"#ff3300\">view your ergoport
</span>

            <span id="terminal__prompt--cursor"></span>
          </div>
        </section>
      </div>
    </main>
  </body>
</html>
};

#print me!
print $html;

#exit
exit;
