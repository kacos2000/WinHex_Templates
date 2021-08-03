template "TIFF File Format"

// Template by  Ulf Zibis, Germany
//              email: Ulf.Zibis@gmx.de

// ***** Requires WinHex 10.52 or later *****

description "TIFF format V6.0 - http://partners.adobe.com/asn/developer/PDFS/TN/TIFF6.pdf"
applies_to file
fixed_start 0

requires 0x2	"2A 00"	// TIFF file indication

begin
	section	"Only for Intel little-endian byte order !"
	endsection
	read-only char[2]		"Byte order (II for Intel)"
	read-only uint16		"TIFF file indicator (42)"
	read-only hexadecimal uint32	"1._Image_File_Directory"
	goto 1._Image_File_Directory

	section	"1. Image File Directory (IFD):"
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
	section	"If >0:  use template 'TIFF File IFD'"
end