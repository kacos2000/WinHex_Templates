template "CDFS Directory Entries"

// Template by Christopher Taylor
//		taylormade@rocketmail.com


// Template for the Directory Entries on a CD
// 


description "ISO9660 Directory Entries containing ASCII Filenames"
applies_to disk
sector-aligned
multiple

begin

	uint8 "Record_Length"
	uint8 "Extended Attribute Record Length"
	uint32 "First Sector of file data or directory"
	move 4
	uint32 "Size in bytes of file data or directory"
	move 4
	uint8 "Years 1900+"
	uint8 "Month"
	uint8 "Day"
	uint8 "Hours"
	uint8 "Minutes"
	uint8 "Seconds"
	int8  "GMT offset, in 15-minute intervals"
	binary "Flags"

//      flags, with bits as follows:
//                 bit     value
//                 ------  ------------------------------------------
//                 0 (LS)  0 for a norma1 file, 1 for a hidden file
//                 1       0 for a file, 1 for a directory
//                 2       0 [1 for an associated file]
//                 3       0 [1 for record format specified]
//                 4       0 [1 for permissions specified]
//                 5       0
//                 6       0
//                 7 (MS)  0 [1 if not the final record for the file]

	hex 1 "Interleave Unit Size"
	hex 1 "Interleave Gap Size"
	int16 "Volume Sequence Number"
	move 2
	int8 "Filename_Length"

	string Filename_Length "Filename ASCII"
//	string16 (Filename_Length/2) "Filename Unicode"

	goto Record_Length

end