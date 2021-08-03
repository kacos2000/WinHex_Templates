template "POS File Format 1.1"

// Template by Stefan Fleischmann
// Format 1.1 used by WinHex 8.7 through 11.7.
// More detailed description of the POS file format
// available from http://www.winhex.com .

description "Structure of an outdated WinHex position file (.pos)"
applies_to file
requires 0 "57 69 6E 48 65 78 20 50 6F 73 20 76 31 2E 31"

begin
	char[16]	"File signature"
	int32		"# of positions"
	
	numbering 1
	{
	section	"Position #~"
	int64		"Offset (decimal)"
	FILETIME	"Recorded on"
	read-only byte		"Description length"
	char[Description length] "Description"
	endsection
	} [# of positions]

	// some text strings for internal use may follow
	// ignored by this template
end