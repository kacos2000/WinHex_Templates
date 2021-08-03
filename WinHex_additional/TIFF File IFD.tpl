template "TIFF File IFD"

// Template by  Ulf Zibis, Germany
//              email: Ulf.Zibis@gmx.de

// ***** Requires WinHex 10.52 or later *****

description "TIFF format V6.0 - Image File Directory (IFD)"
applies_to file

begin
	section	"Only for Intel little-endian byte order !"
	section	"Image File Directory (IFD):"
	uint16				"Number of Dir Entries"

	numbering 1

	{
	section	"Directory Entry ~"
	uint16			"Tag"
	uint16			"Type"
	uint32			"Count"
	uint32			"Value (if fits in 4 Bytes)"
	move -4
	hexadecimal uint32	"... or Offset"

	} [Number of Dir Entries]

	endsection

	hexadecimal uint32	"Offset of next IFD"
	section	"If 0:   No more IFDs"
end