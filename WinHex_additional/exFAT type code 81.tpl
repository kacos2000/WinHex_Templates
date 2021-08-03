template "Exfat Rcrd Type 81"
description "Parse Rcrd Type 81 - Bitmap"
applies_to disk
"requires 11 0F"
multiple

begin
   hex 1			"Type Code 81 or 03"
	binary 		"0-1st bitmap, 1-2nd bitmap"
	hex 18		"Reserved"
	hex 4 		"Staring Cluster O/S"
	int64			"Bitmap Length"
end