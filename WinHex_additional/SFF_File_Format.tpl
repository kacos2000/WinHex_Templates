template "SFF File Format"

// Template by  Ulf Zibis, Germany
//              email: Ulf.Zibis@gmx.de

// ***** Requires WinHex 10.52 or later *****

description "Structured Fax File format - http://delphi.pjh2.de/articles/graphic/sff_format.php"
// see also:  ftp://ftp.avm.de/develper/capispec/capi20/capi20-1.pdf

applies_to file
fixed_start 0

requires 0x0	"53 66 66 66"	// SFF file indication
requires 0x4	"01"		// version

begin
	read-only char[4]		"SFF_ID ('Sfff')"
	read-only hex 1			"Version (01)"
	read-only hex 1			"reserved"
	hexadecimal uint16		"User information"
	hexadecimal uint16		"PageCount"
	hexadecimal uint16		"OffsetFirstPageHeader"
	hexadecimal uint32		"OffsetLastPageHeader"
	hexadecimal uint32		"OffsetDocumentEnd"
	goto OffsetFirstPageHeader

	numbering 1

	{
	section	"Page Header ~"
	uint8			"PageHeaderID (254)"
	hexadecimal uint8	"PageHeaderLen (normaly 0x10)"
	uint8			"ResolutionVertical (0: 98 lpi 1: 196 lpi)"
	uint8			"ResolutionHorizontal (0: 203 dpi)"
	uint8			"Coding (0)"
	uint8			"reserved"
	uint16			"LineLength"
	uint16			"PageLength"
	hexadecimal uint32	"OffsetPreviousPage"
	hexadecimal uint32	"OffsetNextPage"
	hex 8			"PageData..."
	goto OffsetNextPage
	} [PageCount]

	endsection
end
