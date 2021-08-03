template "ZIP Data Descriptor Structure"

// Template by Trenton D. Adams
// Cf. ftp://ftp.uu.net/pub/archiving/zip/doc/appnote-970311-iz.zip

description "Data Descriptor structure layout for ZIP files."
applies_to file
requires 0 "504B0708"

begin
	// Data Descriptor
	hex 4	"Data descriptor signature (0x08074b50)"
	hex 4	"CRC 32"
	uint32	"Compressed size"
	uint32	"Uncompressed size"
end