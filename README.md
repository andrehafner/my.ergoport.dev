# my.ergoport.dev
  
***site***  
https://my.ergoport.dev/  
***site***  

ergo (and eventually more) quick portfolio  

This project was written so that I could quickly get pricing for ERGO and Cardano crypto without using a wallet and manually adding it all together.  

It is essentially a bunch of linked perl scripts which output to a HTML  

example portfolio: https://my.ergoport.dev/cgi-bin/ergoport.pl?a=11  

It can run on anything that runs Perl and PerlCGI.  

I've tested on Windows (activeperl) and it is currently running on Linux VPS

To Do:
1. Fix bugs and css so this page can get bigger
2. Phone foramtting
3. Password Resets



I've also written individual html outputs of all the coins that that telegram and discord bots can grab quick pricing without having to prune or chomp anything. Users can simply do a GET command to the page and they get the pricing data accurate to the minute.
Example: https://my.ergoport.dev/cgi-bin/epAnetaBTC.pl  

will return:  
### CNETA/NETA Price Checker ###  
  
cNETA: $0.015364 in USD  
cNETA: 0.0286199143488895 in ADA  
  ADA: $0.536829 in USD\n  

 NETA: $0.005271 in USD  
 NETA: 0.00246984155247183 in ERG  
  ERG: $2.134145 in USD\n  

price updated on Jul 31, 2022 - Sun 18:11 UTC  
check out https://my.ergoport.dev  
example portfolio: https://my.ergoport.dev/cgi-bin/ergoport.pl?a=11  


Users can also send a var at the end of the URL to get the coin count price:  
https://my.ergoport.dev/cgi-bin/epAnetaBTC.pl?a=cneta1000  

will return:  

### CNETA/NETA Price Checker ###  
  
1000 cNeta x $0.015230 (cNeta Price) = $15.23 USD   
$15.23 USD / $0.521000 (ADA Price) = 29.232245681382 ADA  

cNETA: $0.015230 in USD  
cNETA: 0.029232245681382 in ADA  
  ADA: $0.521000 in USD  

 NETA: $0.005228 in USD  
 NETA: 0.00244145960804019 in ERG  
  ERG: $2.141342 in USD  

price updated on Aug 1, 2022 - Mon 3:42 UTC  
check out https://my.ergoport.dev  
example portfolio: https://my.ergoport.dev/cgi-bin/ergoport.pl?a=11  


The code for the GET programs are in Python and hosted here:  
Discord: https://replit.com/@andrehafner/myergoportdev?v=1  
Telegram: https://replit.com/@andrehafner/myergoportdev-telegram-bot?v=1  



