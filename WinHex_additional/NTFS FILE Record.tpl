template "NTFS FILE Record"

// Template by Jens Kirschner
// X-Ways Software Technology AG

// To be applied to the NTFS Master File Table's (MFT's) FILE records.

description "To be applied to records in the Master File Table"
applies_to disk
sector-aligned
multiple

begin
	char[4]	"Signature: FILE"
	uint16	"Offset to update sequence"
	uint16	"Update sequence size in words"
	int64		"Logfile sequence number"
	uint16	"Sequence number (reuse count)"
	uint16 	"Hard link count"
	uint16	"Offset to the first attribute"
	hex 2		"Flags"
	uint32	"Real size of the FILE record"
	uint32	"Allocated size of the record"
	int64		"Base record (0: itself)"
	uint16	"ID of next attribute"
	IfEqual "Offset to the first attribute" 56
		move 2
		uint32 "ID of this record"
	EndIf
	goto "Offset to update sequence"
	hex 2		"Update sequence number"
	hex 4 "Update sequence array"
	
	goto "Offset to the first attribute"

	{
		endsection

		hexadecimal uint32 "Attribute type"
		IfEqual "Attribute type" 4294967295
			ExitLoop
		EndIf
		uint16 "Length of the attribute"
		move 2
		IfEqual "Attribute type" 16 //Attribute type 0x10: Standard Information
			move 16
			FileTime "Creation in UTC"
			FileTime "Modification in UTC"
			FileTime "Record change in UTC"
			FileTime "Last access in UTC"
			move -48
		EndIf
		IfEqual "Attribute type" 48 //Attribute type 0x30: Filename
			move 16
			uint32	"Parent FILE record"
			move 2
			uint16	"Parent reuse count"
			move 56
			uint8 "Namelength"
			move 1
			char16[Namelength] "Filename"
			move -82
			move (Namelength*(-2))
		EndIf
		move "Length of the attribute"
		move -8

		IfEqual "Length of the attribute" 0
			ExitLoop
		EndIf
	}[20] //arbitrary number to avoid infinite loops

	Goto 0
	Move 1024
end