template "Palm PDB"

// Template by  Ulf Zibis, Germany
//              email: Ulf.Zibis@gmx.de
//
// To be applied to Palm Database File.


// ***** Requires WinHex 10.52 or later *****

description "Palm Database File"
applies_to file
fixed_start 0
big-endian

begin
	string 32		"Database name"
	hex 2			"Attributes"
	move -2
	uint_flex "9"		"Read only flag (1)"
	move -4
	uint_flex "10"	"Dirty AppInfoArea flag (2)"
	move -4
	uint_flex "11"	"Backup flag (3)"
	move -4
	uint_flex "12"	"OK install new flag (4)"
	move -4
	uint_flex "13"	"Reset after install flag (5)"
	move -4
	uint_flex "14"	"Copy protect flag (6)"
	move -2
	string 2		"Version"
	UNIXDateTime		"Create time"
	UNIXDateTime		"Modify time"
	UNIXDateTime		"Backup time"
	uint32			"Modification number"
	hexadecimal uint32	"AppInfo offset"
	hexadecimal uint32	"SortInfo offset"
	char[4]			"Type"
	char[4]			"Creator"
	uint32			"ID seed"
	uint32			"Next RecordList"
	uint16			"Number of Records"


	numbering 1

	{
	section	"Record Header #~"
	hexadecimal uint32	"Offset"
	uint_flex "7"		"Delete flag"
	move -4
	uint_flex "6"		"Dirty flag"
	move -4
	uint_flex "5"		"Busy flag"
	move -4
	uint_flex "4"		"Secret flag"
	move -4
	uint_flex "3,2,1,0"	"Category nr."
	move -3
	hex 3			"Unique ID (hex)"
	move -3
	uint_flex "7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8,23,22,21,20,19,18,17,16"
				"Unique ID"
	move -1

//  the following works only once. Sorry !
//	section	"Record #~"
//	goto Offset
//	string 32		"Record"
//  following calculation not provided by WinHex. Sorry !
//	goto 0x4e*~

	} [Number of Records]

	endsection

	read-only hex 2		"Padding"

//  The optional AppInfo block and SortInfo block are not valid,
//  if the respective offsets above are zero ! If these blocks
//  are shorter than 32 Bytes, the remaining Bytes are also not valid.

	goto "AppInfo offset"
	hex 32			"AppInfo (if Offset not 0) (1. 32 Bytes)"
	move -32
	char[64]		"AppInfo (first 64 Characters)"
	goto "SortInfo offset"
	hex 32			"SortInfo (if Offset not 0) (1. 32 Bytes)"
	move -32
	char[64]		"SortInfo (first 64 Characters)"
end