template "ZIP Local File Header Structure"

// Template by Trenton D. Adams
// Cf. ftp://ftp.uu.net/pub/archiving/zip/doc/appnote-970311-iz.zip

description "Local File Header Structure for ZIP files"
applies_to file
multiple
requires 0 "504B0304"

begin
	// File Information Stored in ZIP
	hex 4	"ZIP file header signature (0x04034b50)"
	hex 2	"Version needed to extract"
	hex 2	"General purpose bit flag"
	hex 2	"Compression method"
	DOSDateTime "last mod file date/time"
   hex 4 "CRC 32"
	uint32	"Compressed size"
	uint32	"Uncompressed size"
	uint16	"Filename length"
   uint16	"Extra field length"
	string	"Filename length"	"Filename"
   hex	"Extra field length"	"Extra field"
   move	"Compressed size"	// to end of file data
end