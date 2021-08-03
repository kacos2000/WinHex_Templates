template "ZIP End of Central Directory Structure"

// Template by Trenton D. Adams
// Cf. ftp://ftp.uu.net/pub/archiving/zip/doc/appnote-970311-iz.zip

description "End of Central Directory structure layout for ZIP files."
applies_to file
requires 0 "504B0506"

begin
	// End of Central Dir
	hex 4 "End of central dir signature (0x06054b50)"
	uint16 "Disk # (spanned)"
	uint16 "First disk #"
	uint16 "Total num entries on this disk"
	uint16 "Total ZIP entries on all disks"
	uint32 "Central directory size"
	uint32 "Central directory byte offset"
	uint16 "ZIP file comment len"
	string "ZIP file comment len" "ZIP file comment"
end