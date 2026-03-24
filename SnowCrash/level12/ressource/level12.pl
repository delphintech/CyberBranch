#!/usr/bin/env perl
# localhost:4646
use CGI qw{param};
print "Content-type: text/html\n\n";

sub t {
  $nn = $_[1];			# arg2
  $xx = $_[0];			# arg1
  $xx =~ tr/a-z/A-Z/; 	# arg1 to upper
  $xx =~ s/\s.*//;		# delete first space and everyting after
  @output = `egrep "^$xx" /tmp/xd 2>&1`;	# egrep arg1 /tmp/xd
  foreach $line (@output) {
      ($f, $s) = split(/:/, $line);			# Split line between ":"
      if($s =~ $nn) {						# if scond part contient arg1
          return 1;							
      }
  }
  return 0;
}

sub n {
  if($_[0] == 1) {
      print("..");
  } else {
      print(".");
  }    
}

n(t(param("x"), param("y")));