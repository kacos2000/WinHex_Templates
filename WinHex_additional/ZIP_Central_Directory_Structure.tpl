template "ZIP Central Directory Structure"

// Template by Trenton D. Adams
// Cf. ftp://ftp.uu.net/pub/archiving/zip/doc/appnote-970311-iz.zip

description "Central Directory structure layout for ZIP files."
applies_to file
multiple
requires 0 "504B0102"

begin
	// Central File Header
	hex 4	"Central file header signature (0x02014b50)"
	hex 2	"Version made by"
	hex 2	"Version needed to extract"
	hex 2	"General purpose bit flag"
	hex 2	"Compression method"
	DOSDateTime "Last modification file date/time"
	hex 4 "CRC 32"
	uint32 "Compressed size"
	uint32 "Uncompressed size"
	uint16 "Filename len"
	uint16 "Extra field len"
	uint16 "Comment len"
	uint16 "Disk start number"
	hex 2 "Internal file attr"
	hex 4 "External file attr"
	uint32 "Local header offset"
	string "Filename len" "File name"
	hex "Extra field len" "Extra field"
	string "Comment len" "File comments"
end