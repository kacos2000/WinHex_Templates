template "Exfat Rcrd Type C0"
description "Parse Rcrd Type C0 - Data Stream Rcrd"
applies_to disk
"requires 11 0F"
multiple

begin
   hex 1			"Type Code"
	binary		"flags"
		move -1
		uint_flex "0" " | Allocation Possible 0-No 1-Yes"
		move -4
		uint_flex "1" " | No Fat Chain 0-Valid, 1-Invalid"
		move -4
		uint_flex "2" " | Reserved"
		move -4
		uint_flex "3" " | Reserved"
		move -4
		uint_flex "4" " | Reserved"
		move -4
		uint_flex "5" " | Reserved"
		move -4
		uint_flex "6" " | Reserved"
		move -4
		uint_flex "7" " | Reserved"
		move -3	
	hex 1 		"Reserved"
	byte			"Name Length"
	hex 2			"Filename hash"
	hex 2			"Reserved"
	int64			"Valid Data Length (64bit)"
	hex 4			"Reserved"
	hex 4			"1st Cluster Address (32bit)"
	int64			"Data Length"
end