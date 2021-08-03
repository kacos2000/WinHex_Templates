template "Exfat Rcrd Type A0"
description "Parse Rcrd Type A0 - GUID Rcrd"
applies_to disk
"requires 11 0F"
multiple

begin
   hex 1			"Type Code"
	int8			"Seconard Count"
	hex 2			"Set Checksum"
	binary [4]	"Primary Flags"
	hex 16		"Volume GUID"
	hex 10		"Reserved"

end