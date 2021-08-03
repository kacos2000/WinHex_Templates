template "POS File Format 2.0"

// Template by Stefan Fleischmann
// Format 2.0 used by WinHex 11.8 and later.
// More detailed description of the POS file format
// available from http://www.winhex.com .

description "Structure of a WinHex position file (.pos)"
applies_to file
requires 0 "57 69 6E 48 65 78 20 50 6F 73 20 76 32 2E 30"

begin
	char[16]	"File signature"
	uint32		"Flags"
	int32		"# of positions"
	
	numbering 1
	{
	section	"Position #~"
	int64		"Offset (decimal)"
	int64		"Size (decimal)"
	FILETIME	"Recorded on"
	uint32	"RGB color"
	read-only uint16		"Description length"
	char[Description length] "Description"
	endsection
	} [# of positions]

	// some text strings for internal use may follow
	// ignored by this template
end