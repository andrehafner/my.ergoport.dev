#!/usr/bin/perl

#use strict;
#use warnings;
use DBI; 
use HTTP::CookieJar::LWP ();
use LWP::UserAgent       ();
use Number::Format 'format_number';
use Time::HiRes qw(gettimeofday);
#use LWP::Protocol::https;

$|=1;            # Flush immediately.
print "Content-Type: text/plain\n\n";


#time calculation
@months = qw(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec);
@weekDays = qw(Sun Mon Tue Wed Thu Fri Sat Sun);
($second, $minute, $hour, $dayOfMonth, $month, $yearOffset, $dayOfWeek, $dayOfYear, $daylightSavings) = localtime();
$year = 1900 + $yearOffset;
$theTime = "$months[$month] $dayOfMonth, $year - $weekDays[$dayOfWeek] $hour:$minute";

my $jar = HTTP::CookieJar::LWP->new;
my $ua  = LWP::UserAgent->new(
    cookie_jar        => $jar,
    protocols_allowed => ['http', 'https'],
    timeout           => 100,
);
 
$ua->agent('Mozilla/9.0');  
$ua->env_proxy;

my $timecode = gettimeofday;
$timecode = substr($timecode,0,-12);
$timecode = $timecode * 1000000000;
$timecodeSLOWMOVERS = $timecode - 3000000000;
#print $timecode;
#exit;

my $response = $ua->get("https://api.ergodex.io/v1/amm/pool/9916d75132593c8b07fe18bd8d583bda1652eed7565cf41a4738ddd90fc992ec/chart?from=$timecode");
my $response1 = $ua->get("https://api.ergodex.io/v1/amm/pool/d7868533f26db1b1728c1f85c2326a3c0327b57ddab14e41a2b77a5d4c20f4b2/chart?from=$timecode");
my $response2 = $ua->get("https://api.ergodex.io/v1/amm/pool/7d2e28431063cbb1e9e14468facc47b984d962532c19b0b14f74d0ce9ed459be/chart?from=$timecode");
my $response3 = $ua->get("https://api.ergodex.io/v1/amm/pool/b6b38cae74e4754ae70a7c4335a9150449e47cb7421394016ab73c5c22a1a9dc/chart?from=$timecode");
my $response4 = $ua->get("https://api.ergodex.io/v1/amm/pool/1d5afc59838920bb5ef2a8f9d63825a55b1d48e269d7cecee335d637c3ff5f3f/chart?from=$timecode");
my $response5 = $ua->get("https://api.ergodex.io/v1/amm/pool/a62a1603bae6c0d293f7b954672de6fa8eae9793d433cb02ee49dce736da54ac/chart?from=$timecodeSLOWMOVERS");
my $response6 = $ua->get("https://api.ergodex.io/v1/amm/pool/666be5df835a48b99c40a395a8aa3ea6ce39ede2cd77c02921d629b9baad8200/chart?from=$timecodeSLOWMOVERS");
my $response7 = $ua->get("https://api.ergodex.io/v1/amm/pool/0b36eb5086ba1d258341723fa4768acaa3804fba982641a00941d5aad2107f50/chart?from=$timecodeSLOWMOVERS");
my $response8 = $ua->get("https://api.ergodex.io/v1/amm/pool/9c1d78e53e7812df96bbb09b757ee1e059c5a298d85789b5c82a7222c34e8f61/chart?from=$timecodeSLOWMOVERS");
my $response9 = $ua->get("https://api.ergodex.io/v1/amm/pool/1f01dc8e29806d96ca0b79f8e798cd8cfce51c0e676aaedf6ab3464b37da9dfd/chart?from=$timecodeSLOWMOVERS");
my $response10 = $ua->get("https://api.ergodex.io/v1/amm/pool/3d4fdb931917647f4755ada29d13247686df84bd8aea060d22584081bd11ba69/chart?from=$timecodeSLOWMOVERS");
my $response11 = $ua->get("https://api.ergodex.io/v1/amm/pool/c1b9c430249bd97326042fdb09c0fb6fe1455d498a20568cc64390bfeca8aff2/chart?from=$timecodeSLOWMOVERS");
my $response12 = $ua->get("https://api.ergodex.io/v1/amm/pool/fff5e73c7c8c61335d8c4ab18a2d09029e1c9131ed195c4e0ceccf9dd0c03d7f/chart?from=$timecodeSLOWMOVERS");


my $Nresponse =  $response->decoded_content;
my $Nresponse1 = $response1->decoded_content;
my $Nresponse2 = $response2->decoded_content;
my $Nresponse3 = $response3->decoded_content;
my $Nresponse4 = $response4->decoded_content;
my $Nresponse5 = $response5->decoded_content;
my $Nresponse6 = $response6->decoded_content;
my $Nresponse7 = $response7->decoded_content;
my $Nresponse8 = $response8->decoded_content;
my $Nresponse9 = $response9->decoded_content;
my $Nresponse10 = $response10->decoded_content;
my $Nresponse11 = $response11->decoded_content;
my $Nresponse12 = $response12->decoded_content;


$Nresponse = substr($Nresponse,-20);
$Nresponse1 = substr($Nresponse1,-20);
$Nresponse2 = substr($Nresponse2,-20);
$Nresponse3 = substr($Nresponse3,-20);
$Nresponse4 = substr($Nresponse4,-20);
$Nresponse5 = substr($Nresponse5,-20);
$Nresponse6 = substr($Nresponse6,-20);
$Nresponse7 = substr($Nresponse7,-20);
$Nresponse8 = substr($Nresponse8,-20);
$Nresponse9 = substr($Nresponse9,-20);
$Nresponse10 = substr($Nresponse10,-20);
$Nresponse11 = substr($Nresponse11,-20);
$Nresponse12 = substr($Nresponse12,-20);


$Nresponse =~ s/.*:\s*//;
$Nresponse1 =~ s/.*:\s*//;
$Nresponse2 =~ s/.*:\s*//;
$Nresponse3 =~ s/.*:\s*//;
$Nresponse4 =~ s/.*:\s*//;
$Nresponse5 =~ s/.*:\s*//;
$Nresponse6 =~ s/.*:\s*//;
$Nresponse7 =~ s/.*:\s*//;
$Nresponse8 =~ s/.*:\s*//;
$Nresponse9 =~ s/.*:\s*//;
$Nresponse10 =~ s/.*:\s*//;
$Nresponse11 =~ s/.*:\s*//;
$Nresponse12 =~ s/.*:\s*//;


$Nresponse = substr($Nresponse,0,-2);
$Nresponse1 = substr($Nresponse1,0,-2);
$Nresponse2 = substr($Nresponse2,0,-2);
$Nresponse3 = substr($Nresponse3,0,-2);
$Nresponse4 = substr($Nresponse4,0,-2);
$Nresponse5 = substr($Nresponse5,0,-2);
$Nresponse6 = substr($Nresponse6,0,-2);
$Nresponse7 = substr($Nresponse7,0,-2);
$Nresponse8 = substr($Nresponse8,0,-2);
$Nresponse9 = substr($Nresponse9,0,-2);
$Nresponse10 = substr($Nresponse10,0,-2);
$Nresponse11 = substr($Nresponse11,0,-2);
$Nresponse12 = substr($Nresponse12,0,-2);


$Nresponse1 = ($Nresponse / $Nresponse1);
$Nresponse2 = ($Nresponse / $Nresponse2);
$Nresponse3 = ($Nresponse / $Nresponse3);
$Nresponse4 = ($Nresponse / $Nresponse4);
$Nresponse5 = ($Nresponse / $Nresponse5);
$Nresponse6 = ($Nresponse / $Nresponse6);
$Nresponse7 = ($Nresponse / $Nresponse7);
$Nresponse8 = ($Nresponse / $Nresponse8);
$Nresponse9 = ($Nresponse / $Nresponse9);
$Nresponse10 = ($Nresponse / $Nresponse10);
$Nresponse11 = ($Nresponse / $Nresponse11);
$Nresponse12 = ($Nresponse / $Nresponse12);


#$Nresponse = sprintf("%.4f", $Nresponse);
#$Nresponse1 = sprintf("%.4f", $Nresponse1);
#$Nresponse2 = sprintf("%.4f", $Nresponse2);
#$Nresponse3 = sprintf("%.4f", $Nresponse3);
#$Nresponse4 = sprintf("%.4f", $Nresponse4);

#this is where the database password is loacted
#my $dbpasswordretreive =  'E:\dbaccess\employer.txt';
my $dbpasswordretreive = 'XXXX';

#get db password
#my $password = do {
#  local $/ = undef;
#  open my $fh, "<", $dbpasswordretreive
#  or die "could not open $dbpasswordretreive: $!";
#  <$fh>;
#};


#definition of variables
my $db="ergoport";
my $host="localhost";
my $user="root";


#connect to MySQL database
my $dbh   = DBI->connect ("DBI:mysql:database=$db:host=$host",
  $user,
  $dbpasswordretreive)
  or die "Can't connect to database: $DBI::errstr\n";

#wite the form data back to the database
my $sql = "UPDATE pricedata SET erg='$Nresponse',ergopad='$Nresponse1', neta='$Nresponse2', etosi='$Nresponse3', sigrsv='$Nresponse4', sigusd='1', datarefreshdate='$theTime', exile='$Nresponse5', paideia='$Nresponse6', terahertz='$Nresponse7', egio='$Nresponse8', comet='$Nresponse9', erdoge='$Nresponse10', lunadog='$Nresponse11', migoreng='$Nresponse12' WHERE id='1';";

#prepare the query
my $sth = $dbh->prepare($sql);

#execute the query
$sth->execute();

print "all done\n\n";
exit;
