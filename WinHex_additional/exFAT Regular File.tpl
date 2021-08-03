template "Exfat Reg File 85,C0,C1"
description "Parse Dir File Rcrd Set 85,C0,C1"
applies_to disk
//requires 0x01 0x85    // ="Directory Entry Information"
//requires 0x21 0xC1	 // ="Stream Directory Information"
//requires 0x41 0xC0 	 // ="First Entry of Filename"
multiple

begin
   	hex 1			"Type Code"
		move -1
		uint_flex "0" " | Type Code bit"
		move -4
		uint_flex "1" " | Type Code bit"
		move -4
		uint_flex "2" " | Type Code bit"
		move -4
		uint_flex "3" " | Type Code bit"
		move -4
		uint_flex "4" " | Type Code bit"
		move -4
		uint_flex "5" " | Bit 5 - 0-Critical, 1-Benign"
		move -4
		uint_flex "6" " | Bit 6 - 0-Primary, 1-Secondary"
		move -4
		uint_flex "7" " | Bit 7 - 0-Not In Use, 1-In Use"
		move -3
	hex 1			"count of 2nd-ary entries"
	hex 2			"checksum"
	binary		"Flags"
	move -1
	uint_flex "0" " | Bit 0 - Read Only"
	move -4
	uint_flex "1" " | Bit 1 - Hidden"
	move -4
	uint_flex "2" " | Bit 2 - System"
	move -4
	uint_flex "3" " | Bit 3 - Reserved"
	move -4
	uint_flex "4" " | Bit 4 - Directory"
	move -4
	uint_flex "5" " | Bit 5 - Archive"
	move -4
	uint_flex "6" " | Bit 6 - Reserved"
	move -4
	uint_flex "7" " | Bit 7 - Reserved"
	move -3
	binary		"Bits 8-15 Reserved"
	hex 2			"Reserved"
	dosdatetime			"Created Time Stamp"
	move -4	
	hex 4					"Create Time hex value"
	dosdatetime 		"Last Modified Time Stamp"
	move -4				
	hex 4					"Last Modified Time hex value"	
	dosdatetime			"Last Access Time Stamp"
	move -4			
	Hex 4					"Last Access Time hex value"
	byte			"Creation 0-199 Micro Seconds"
	byte			"Last Modified 0-199 Micro seconds"
	hex 1			"CR Time Zone Code"
	hex 1			"Mod Time Zone Code"
	hex 1			"Acc Time Zone Code"
	hex 7			"Reserved"

endsection
   hex 1			"Type Code C0"
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
	byte			"Length"
	hex 2			"Filename hash"
	hex 2			"Reserved"
	int64			"Valid Data Length 64bit"
	hex 4			"Reserved"
	hex 4			"1st Cluster Address 32bit"
	int64			"Data Length 64bit"

endsection
	{
	hex 1			"Type Code"
	binary		"Secondary Flag"
	    move -1
	    uint_flex "0" " | Bit 0 - Allocated"
	    move -4
	    uint_flex "1" " | Bit 1 - No FAT Chain"
	    move -3
	    char16[15]	"Filename Unicode 14 characters" 
		}



end