#!/usr/bin/perl

use CGI;

#this gets a value from the trailing URL so that we know where we can send them back to in the links at the bottom of the HTML below
my $q = CGI->new();
my $id = $q->param('a');

#html to print ontp the page
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
          <p id="bar__user">about@ubuntu: ~</p>
        </section>
        <!-- Terminal Body -->
        <section id="terminal__body">
          <div id="terminal__prompt">
            <span id="terminal__prompt--user">huh?@ubuntu:</span>
            <span id="terminal__prompt--location">~ <p> </span>

<span id="terminal__prompt--bling"><a href="https://my.ergoport.dev/cgi-bin/ergoportnewuser.pl"><font color=\"#ff3300\">create an ergoport account, click on me! </font color=\"#ff3300\"><br><br></span>


            <span id="terminal__prompt--bling"><font color=\"#08C7FF\">Why?</font color=\"#08C7FF\"><br>
I wanted a FAST way to view all my ERGO/Cardano assets in one shot<br>
without adding them up in a wallet or needing an extension<br><br>
I made this site in the worst way possible<br>
perl on the web also known as perlcgi!<br><br>
However, it is what I know (barely) and it allows me to <br>
grab things from DEXs and chop the heck out of them<br>
to give you what you see here!<br><br>

<font color=\"#08C7FF\"> What is this running on and how does it work?<br></font color=\"#ff3300\">
Linux VPM 4 core 8GB 160SSD (lets see if it keeps up)<br>
This app takes a read from ergodex every minute and caches it for your dashboard<br>
Passwords hashed w/MD5<br>
Your data is stored in a MySQL table<br>
<br>
All ergoport dashboards are public and viewable by URL and the number at the end of it!<br><br>

<font color=\"#08C7FF\">What's next?</font color=\"#08C7FF\"><br>
1. Fix bugs and css so this page can get bigger<br>
2. Phone foramtting<br>
3. Integrate Cardano coin/token info<br>
4. Password Resets<br>
<br>
I'm a css/html hack so I used (thanks!) <a href="https://github.com/fobabs/ubuntu-terminal" target="_blank"><font color=\"#ff3300\">FOBABS
<br><br></span>


            <span id="terminal__prompt--bling"> <font color=\"#ff3300\"> <a href="https://my.ergoport.dev/cgi-bin/ergoportedit.pl"><font color=\"#ff3300\">edit your data</a>  
 | <a href="https://my.ergoport.dev/cgi-bin/ergoport.pl?a=$id"><font color=\"#ff3300\">view you ergoport
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


#lets print this stuff!
print $html;

#buhbye
exit;
