#!/usr/bin perl -w
use strict;
my $tmp;
my $tmp2;
my $line;
my $lanesplit;
my $rank;
my $xcord;
my $ycord;
my $length;
my @splitname;
my @splitrank;
my @splitxcord;
my @splitycord;
my @splitl;

open $tmp, "<tmp.txt", or die "cant open $tmp";
open $tmp2, ">temp2.text", or die "cant open $tmp2";

print $tmp2 "region,rank,xcord,ycord,length\t\n";

while ($line = <$tmp>) {
    chomp $line;

    ($lanesplit, $rank, $xcord, $ycord, $length) = split(/\s/,$line);
    @splitname = split(/\:/, $lanesplit);
    @splitrank = split(/\=/, $rank);
    @splitxcord    = split(/\=/, $xcord);
    @splitycord    = split(/\=/, $ycord);
    @splitl    = split(/\=/, $length);
 
    print $tmp2 "$splitname[0],$splitrank[1],$splitxcord[1],$splitycord[1],$splitl[1]\n";

}

