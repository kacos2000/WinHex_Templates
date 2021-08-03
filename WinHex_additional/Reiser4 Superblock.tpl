template "Reiser4 Superblock"

// Created by Jens Kirschner on Feb 16, 2005
// X-Ways Software Technology AG

// The superblock always starts at offset 0x10000 = 64 KB 

// Superblock as defined by Reiser4 Format40, which is the 
// currently only format definition

description "Superblock for Format40 of Reiser4"
applies_to disk
//sector-aligned
requires 0x0 "52 65 49 73 45 72 34"

begin
	section	"Master Reiser4 Superblock"
	char[16] "Magic string ReIsEr4"
	int16 "Disk Plugin (0: Format40)"
	int16 "Block size"
	hex 16 "UUID"
	char[16] "Label"
	int64 "Diskmap Block"
	endsection

	IfEqual "Disk Plugin (0: Format40)" 0

		goto "Block size"

		section "Format40 Superblock"	
		int64 "Block count" 
		int64 "Free block count"
		int64 "Root block #"
		int64 "Smallest free object ID"
		int64 "File count"
		int64 "Superblock flush count"
		hex 4 "UID"
		char[16] "Magic string ReIsEr40FoRmAt"
		int16 "Tree height"
		int16 "Formatting policy"
		int64 "Flags"
		char[432] "Not used"
		endsection
	endif
end