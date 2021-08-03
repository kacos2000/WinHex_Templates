template "Exfat Rcrd Type 82"
description "Parse Rcrd Type 82 - Up-Case Table"
applies_to disk
"requires 11 0F"
multiple

begin
   hex 1			"Type Code 82"
	hex 3 		"Reserved"
	hex 4			"Table checksum"
	hex 12 		"Reserved"
	hex 4 		"Starting Cluster O/S"
	int64			"Up-Case Table Length"
end