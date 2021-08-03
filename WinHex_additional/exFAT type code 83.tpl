template "Exfat Rcrd Type 83"
description "Parse Rcrd Type 83 - Volume Label"
applies_to disk
"requires 11 0F"
multiple

begin
   hex 1			"Type Code 83 or 03"
	hex 1			"Vol Label Unicode Length"
	char16[11]	"Volume Label"
	hex 8			"Reserved"
end