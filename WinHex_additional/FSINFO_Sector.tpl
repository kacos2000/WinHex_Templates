template "FAT32 FSINFO Sector"

// Template by Stefan Fleischmann
// To be applied to sector 1 of a FAT32-formatted logical drive.
// Based on the information provided at
// http://hjem.get2net.dk/rune_moeller_barnkob/filesystems/fat32.html

description "Contains additional information about the volume"
appliesto disk
sector-aligned
requires 0x1E4 "72 72 41 61"
requires 0x1FE "55 AA"

begin
	hex 4		"Extended boot signature"
	goto		0x1E4
	hex 4 "FSINFO signature"

	int32		"Free cluster count (-1=unknown)"
	int32		"Next free cluster"
	// The number of the cluster that was most recently
	// allocated. Allows improved performance.

	goto 		0x1FE
	hex 2		"FSINFO ending signature"
end