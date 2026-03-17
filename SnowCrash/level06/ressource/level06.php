#!/usr/bin/php
<?php
	function y($m) { 
		# replace . by x
		$m = preg_replace("/\./", " x ", $m); 
		# replace @ by y
		$m = preg_replace("/@/", " y", $m); 
		return $m; 
	}

	function x($y, $z) {
		# get file content given as arguments
		$a = file_get_contents($y);	
		# find regex matching in a '[x <content>]` replace it by y(<content>) and runs it
		# Backthick are interpreted as shell command 
		# the y function is called on the result of the shell command
		$a = preg_replace("/(\[x (.*)\])/e", "y(\"\\2\")", $a);
		# Replace [ with ( and ] with )
		$a = preg_replace("/\[/", "(", $a); $a = preg_replace("/\]/", ")", $a); 
		return $a;
	}

	$r = x($argv[1], $argv[2]); print $r; 
?>