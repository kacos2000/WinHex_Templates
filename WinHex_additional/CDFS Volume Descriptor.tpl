template "CDFS Volume Descriptor"

// Template by Christopher Taylor
//		taylormade@rocketmail.com


// Template for the volume descriptor found in sector 16 of CDs
// 


description "ISO9660 Volume Descriptor"
applies_to disk
sector-aligned
multiple

begin

	hex 1			"entry number"
	char[5] 		"Volume Descriptor Set Terminator"
	move 2
	char[32] 		"system identifier"
	char[32] 		"volume identifier"
	move 8
// the next several numbers are 'double ended' so we read the first part as a  
//  little-endian number and skip the next part which is the same number in
//  big-endian.  i.e.: 1 is written 0x10000001
	int32 			"total number of sectors"
	move 4
        move 32	// always zeros
	int16 			"volume set size"
	move 2
	int16 			"volume sequence number"
	move 2
        int16 			"sector size"
 	move 2
	int32 			"path table length in bytes"
	move 4
	little-endian int32	"sector containing first little endian path table"
	little-endian int32 	"sector containing second little endian path table"
	big-endian int32 	"sector containing first big endian path table"
	big-endian int32 	"sector containing second big endian path table"

	section 	"root directory record"   // 34 bytes total
	int8 "bytes in the record (which must be even)"
	int8 "sectors in extended attribute record"
	int32 "first sector of file data or directory"
	move 4
	int32 "bytes of file data or length of directory"
	move 4
	int8 "years since 1900"
	int8 "month"
	int8 "day"
	int8 "hour"
	int8 "minute"
	int8 "second"
	int8  "GMT offset, in 15-minute intervals"
	binary "flags"
	hex 1 "file unit size for an interleaved file"
	hex 1 "interleave gap size for an interleaved file"
	int16 "volume sequence number"
	move 2
	hex 1 "identifier length"
	hex 1 "identifier"

	Section "Identifiers - ASCII"
	string 128  	"volume set identifier"
	string 128  	"publisher identifier"
	string 128  	"data preparer identifier"
	string 128  	"application identifier"
	string 37  	"copyright file identifier"
	string 37  	"abstract file identifier"
	string 37  	"bibliographical file identifier"
	move -623

	section "Identifiers - Unicode"
	big-endian string16 64  	"volume set identifier"
	big-endian string16 64  	"publisher identifier"
	big-endian string16 64  	"data preparer identifier"
	big-endian string16 64  	"application identifier"
	big-endian string16 18  	"copyright file identifier"
	move 1
	big-endian string16 18  	"abstract file identifier"
	move 1
	big-endian string16 18  	"bibliographical file identifier"
	move 1

	section 	"volume creation"
	char[8] "yyyymmdd"
	char[8] "hhmmssss"
	int8    "GMT offset, in 15-minute intervals"

	section		"most recent modification"
	char[8] "yyyymmdd"
	char[8] "hhmmssss"
	int8    "GMT offset, in 15-minute intervals"

	section		"volume expires"
	char[8] "yyyymmdd"
	char[8] "hhmmssss"
	int8    "GMT offset, in 15-minute intervals"

	section		"volume effective from"
	char[8] "yyyymmdd"
	char[8] "hhmmssss"
	int8    "GMT offset, in 15-minute intervals"
 	
// to get to end of record
	move 2    // always 0x0100
	move 512  // reserved for application (but never used)
	move 653  // always 0x00

end