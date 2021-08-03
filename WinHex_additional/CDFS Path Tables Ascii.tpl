template "CDFS Path Tables"

// Template by Christopher Taylor
//		taylormade@rocketmail.com


// Template for the Path Tables of CDs
// 


description "ISO9660 Path Tables in ASCII (used to build folder tree structure)"
applies_to disk
sector-aligned
multiple

begin

{	section ""
	int8 "Name_Length"
	int8 "sectors in extended attribute record"
	int32 "first sector in the directory"
	int16 "record for parent directory"
	char["Name_Length"] "Folder Name"
// move over a padding byte if the name is an odd number of bytes long
	IfEqual (Name_Length%2) 1
		move 1
	EndIf

} [20]

end