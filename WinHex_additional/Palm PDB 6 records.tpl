template "Palm PDB 6 records"

// Template by  Ulf Zibis, Germany
//              email: Ulf.Zibis@gmx.de
//
// To be applied to Palm Database File.
// Shows the first 6 records if available.


// ***** Requires WinHex 10.52 or later *****

description "Palm Database File records"
applies_to file
fixed_start 0
big-endian

begin
	string 32		"Database name"
//	hex 2			"Attributes"
//	move -2
//	uint_flex "9"		"Read only flag (1)"
//	move -4
//	uint_flex "10"	"Dirty AppInfoArea flag (2)"
//	move -4
//	uint_flex "11"	"Backup flag (3)"
//	move -4
//	uint_flex "12"	"OK install new flag (4)"
//	move -4
//	uint_flex "13"	"Reset after install flag (5)"
//	move -4
//	uint_flex "14"	"Copy protect flag (6)"
//	move -2
//	string 2		"Version"
//	UNIXDateTime		"Create time"
//	UNIXDateTime		"Modify time"
//	UNIXDateTime		"Backup time"
//	uint32			"Modification number"
//	hexadecimal uint32	"AppInfo offset"
//	hexadecimal uint32	"SortInfo offset"
move 28
	char[4]			"Type"
	char[4]			"Creator"
//	uint32			"ID seed"
//	uint32			"Next RecordList"
move 8
	uint16			"Number of Records"


	section	"The first 6 records (only for PDB with 6 records):"

	section	"Record #1"

	goto 0x4e
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

	goto "Offset"
	hex 32			"Record (first 32 Bytes if available)"
	move -32
	char[32]		"Record as text"

	section	"Record #2"

	goto 0x56
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

	goto "Offset" 
	hex 32			"Record (first 32 Bytes if available)"
	move -32
	char[32]		"Record as text"

	section	"Record #3"

	goto 0x5e
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

	goto "Offset" 
	hex 32			"Record (first 32 Bytes if available)"
	move -32
	char[32]		"Record as text"

	section	"Record #4"

	goto 0x66
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

	goto "Offset" 
	hex 32			"Record (first 32 Bytes if available)"
	move -32
	char[32]		"Record as text"

	section	"Record #5"

	goto 0x6e
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

	goto "Offset" 
	hex 32			"Record (first 32 Bytes if available)"
	move -32
	char[32]		"Record as text"

	section	"Record #6"

	goto 0x76
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

	goto "Offset" 
	hex 17			"Record (first 17 Bytes if available)"
	move -17
	char[17]		"Record as text"

	endsection

end