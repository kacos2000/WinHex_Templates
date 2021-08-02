template "ExFAT Directory Entries"

// Costas Katsavounidis - 2021 v.1c
// kacos2000 [at] gmail.com
// https://github.com/kacos2000

description "ExFAT Directory Entries"
// Ref: https://docs.microsoft.com/en-us/windows/win32/fileio/exfat-specification#6-directory-structure
applies_to disk
read-only

// requires 0 "81"
// requires 0 "82"
// requires 0 "83"
// requires 0 "85"
// requires 0 "05"
// requires 0 "A0"

begin
Section "Directory File Entry"
   hex 1		"Type Code"
	move -1
	binary[1] "Type Code binary"
		move -1
		uint_flex "0" " | Bit 0 - TypeCode"
		move -4
		uint_flex "1" " | Bit 1 - TypeCode"
		move -4
		uint_flex "2" " | Bit 2 - TypeCode"
		move -4
		uint_flex "3" " | Bit 3 - TypeCode"
		move -4
		uint_flex "4" " | Bit 4 - TypeCode"
		move -4
		uint_flex "5" " | Bit 5 - 0: Critical, 1: Benign" //TypeImportance
		move -4
		uint_flex "6" " | Bit 6 - 0: Primary, 1: Secondary" //TypeCategory
		move -4
		uint_flex "7" " | Bit 7 - 0: Not In Use, 1: In Use" //InUse
		move -3
ifEqual "Type Code" 0x81
	uint8 		"0: 1st bitmap, 1: 2nd bitmap"
	hex 18		"Reserved"
	uint32 		"First Cluster"
	int64			"Bitmap Data Length"
	end
else ifEqual "Type Code" 0x82
	hex 3 		"Reserved"
	little-endian hex 4	"Table checksum"
	hex 12 		"Reserved"
	uint32  		"FirstCluster"
	int64			"Up-Case Table Data Length"
	end
else ifEqual "Type Code" 0x83
	uint8	"Character Count"
	little-endian string16 "Character Count" "Volume Label"
	hex 8	"Reserved"
	end
else ifEqual "Type Code" 0x85
	move 0
else ifEqual "Type Code" 0x05
	move 0
else ifEqual "Type Code" 0xA0 //Volume GUID Directory Entry
	int8		"Number_of_Secondary_entries" //the valid value for this field is 0
	little-endian hex 2	"SetChecksum"
	little-endian hex 2	"General Primary Flags"
	GUID	   "Volume GUID"
	hex 10	"Reserved"
	end
else ifEqual "Type Code" 0xA1 //exFAT Padding Directory Entry
	end
else ifEqual "Type Code" 0xA2 //Windows CE Access Control Table Directory Entry 
	end
else
    end
endIF
	uint8	"Number_of_Secondary_entries"
	little-endian hex 2	"SetChecksum"
	binary[1] "File Attributes "
	move -1
	uint_flex "0" " | Bit 0 - Read Only"
	move -4
	uint_flex "1" " | Bit 1 - Hidden"
	move -4
	uint_flex "2" " | Bit 2 - System"
	move -4
	uint_flex "3" " | Bit 3 - Reserved1"
	move -4
	uint_flex "4" " | Bit 4 - Directory"
	move -4
	uint_flex "5" " | Bit 5 - Archive"
	move -4
	uint_flex "6,7,8,9,10,11,12,13,14,15" " | Bits 6-15 - Reserved2"
	move -2
	hex 2			"Reserved1"
    uint_flex "4,3,2,1,0" "|Bits  0 - 4  - Create DoubleSeconds (x2)" //two-second multiples
    move -4
    uint_flex "10,9,8,7,6,5" "|Bits  5 -10 - Create Minutes"
    move -4
    uint_flex "15,14,13,12,11" "|Bits 11-15 - Create Hour"
    move -4
    uint_flex "20,19,18,17,16" "|Bits 16-20 - Create Day"
    move -4
    uint_flex "24,23,22,21" "|Bits 21-24 - Create Month"
    move -4
    uint_flex "31,30,29,28,27,26,25" "|Bits 25-31 - Create Year (+1980)"
    move -4
	dosdatetime	"CreateTimestamp"
    uint_flex "4,3,2,1,0" "|Bits  0 - 4  - Modified DoubleSeconds (x2)" //two-second multiples
    move -4
    uint_flex "10,9,8,7,6,5" "|Bits  5 -10 - Modified Minutes"
    move -4
    uint_flex "15,14,13,12,11" "|Bits 11-15 - Modified Hour"
    move -4
    uint_flex "20,19,18,17,16" "|Bits 16-20 - Modified Day"
    move -4
    uint_flex "24,23,22,21" "|Bits 21-24 - Modified Month"
    move -4
    uint_flex "31,30,29,28,27,26,25" "|Bits 25-31 - Modified Year (+1980)"
    move -4
	dosdatetime "Last Modified Timestamp"
    uint_flex "4,3,2,1,0" "|Bits  0 - 4  - Accessed DoubleSeconds (x2)" //two-second multiples
    move -4
    uint_flex "10,9,8,7,6,5" "|Bits  5 -10 - Accessed Minutes"
    move -4
    uint_flex "15,14,13,12,11" "|Bits 11-15 - Accessed Hour"
    move -4
    uint_flex "20,19,18,17,16" "|Bits 16-20 - Accessed Day"
    move -4
    uint_flex "24,23,22,21" "|Bits 21-24 - Accessed Month"
    move -4
    uint_flex "31,30,29,28,27,26,25" "|Bits 25-31 - Accessed Year (+1980)"
    move -4
	dosdatetime	"Last Accessed Timestamp"
	byte			"Create 10ms Increment"
	byte			"Last Modified 10ms Increment"
    hex 1 "CreateUtcOffset (Hex)"
    move -1
	little-endian uint_flex "0,1,2,3,4,5,6"	"Bits 0-6 - CreateUtcOffset (15')" //15 minute interval
    move -4
    uint_flex "7"	"Bit 7 - CreateOffsetValid (1: Valid)"
	move -3
    hex 1 "LastModifiedUtcOffset (Hex)"
    move -1
	little-endian uint_flex "0,1,2,3,4,5,6"	"Bits 0-6 - LastModifiedUtcOffset  (15')" //15 minute interval
    move -4
    uint_flex "7"	"Bit 7 - LastModifiedOffsetValid (1: Valid)"
	move -3
    hex 1 "LastAccessedUtcOffset (Hex)"
    move -1
	little-endian uint_flex "0,1,2,3,4,5,6"	"Bits 0-6 - LastAccessedUtcOffset  (15')" //15 minute interval
    move -4
    uint_flex "7"	"Bit 7 - LastAccessedOffsetValid (1: Valid)"
	move -3
	hex 7	"Reserved2"
endsection

Section "Stream Extension"
   hex 1			"Type Code" // 0xC0 or 0x40
	move -1
	binary[1] "Type Code binary"
		move -1
		uint_flex "0" " | Bit 0 - TypeCode"
		move -4
		uint_flex "1" " | Bit 1 - TypeCode"
		move -4
		uint_flex "2" " | Bit 2 - TypeCode"
		move -4
		uint_flex "3" " | Bit 3 - TypeCode"
		move -4
		uint_flex "4" " | Bit 4 - TypeCode"
		move -4
		uint_flex "5" " | Bit 5 - 0: Critical, 1: Benign" //TypeImportance
		move -4
		uint_flex "6" " | Bit 6 - 0: Primary, 1: Secondary" //TypeCategory
		move -4
		uint_flex "7" " | Bit 7 - 0: Not In Use, 1: In Use" //InUse
		move -3
	binary[1]	"Secondary Flags"
		move -1
		uint_flex "0" " | AllocationPossible (0: No, 1: Yes)"
		move -4
		uint_flex "1" " | NoFatChain (0: Valid, 1: Invalid)"
		move -4
		uint_flex "2,3,4,5,6,7" " | Custom bits [2-7]"
		move -3	
	hex 1 		"Reserved1"
	byte			"Name Length"
	little-endian hex 2	"Name hash"
	hex 2			"Reserved2"
	int64		   "Valid Data Length"
	hex 4			"Reserved3"
	uint32		"First Cluster"
	int64			"Data Length"
endsection

numbering 1{
Section "File Name Directory Entry #~"
	hex 1			"Type Code" // 0xC1 or 0x41
	move -1
	binary[1] "Type Code binary"
		move -1
		uint_flex "0" " | Bit 0 - TypeCode"
		move -4
		uint_flex "1" " | Bit 1 - TypeCode"
		move -4
		uint_flex "2" " | Bit 2 - TypeCode"
		move -4
		uint_flex "3" " | Bit 3 - TypeCode"
		move -4
		uint_flex "4" " | Bit 4 - TypeCode"
		move -4
		uint_flex "5" " | Bit 5 - 0: Critical, 1: Benign" //TypeImportance
		move -4
		uint_flex "6" " | Bit 6 - 0: Primary, 1: Secondary" //TypeCategory
		move -4
		uint_flex "7" " | Bit 7 - 0: Not In Use, 1: In Use" //InUse
		move -3
	binary[1]		"Secondary Flags"
   little-endian string16 15 "Filename Unicode" 
endSection
}[(Number_of_Secondary_entries-1)]


end