template "Exfat Rcrd Type C1"
description "Parse Rcrd Type C1 - Filename Rcrd"
applies_to disk
"requires 11 0F"
multiple

begin
   hex 1			"Type Code"
	binary		"Secondary Flag"
	move -1
	uint_flex "0" " | Bit 0 - Allocated"
	move -4
	uint_flex "1" " | Bit 1 - No FAT Chain"
	move -3
	char16[15]	"Filename Unicode 14 characters"
end