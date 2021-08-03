template "Reiser4 Directory Entries"

// Created by Jens Kirschner

// X-Ways Software Technology AG

// Reiser directory entries are slightly problematic. While
// the numbers displayed by this template are ok, the names
// are stored backwards and the template does not deal with
// that too lightly... Requires a bit of work to get used to...

description "Reads Reiser4 directories"

begin
	uint16 NoOfEntries

	{
		section "Entry ~"
		char[7] NamePartOne
		uint_flex "0" "1=name directly after key"
		move -3
		char[8] NamePartTwo
		char[8] NamePartThree
		uint16 "Offset to key ~"
	}[NoOfEntries]


	section "Keys (some with filenames)"
	{
		section "Key ~"
		goto "Offset to key ~"

    int64 "Key: Locality"
    move -8 //Locality in more detail
    uint_flex "31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4" "Parent ID/Major Locality (28-bit)"
    move -4
    uint_flex "3,2,1,0" "Type/Minor Locality"
    move 4
	
		int64 "Key: Ordering"

    int64 "Key: Object ID"
    move -8 //Object ID in more detail

    uint32 "Object ID (32-bit)"
    uint_flex "31,30,29,28" "Controversial Band"

		IfEqual "1=name directly after key" 1
			zstring "Full Filename"
		Endif
	}[NoOfEntries]
end