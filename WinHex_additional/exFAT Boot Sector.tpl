template "Boot Sector exFAT"

// Template by Robert Shullich
// John Jay College of Criminal Justice

// To be applied to the first VBR sector of a exFAT-formatted logical drive.
// This template assumes a DD acquired image

description "BIOS parameter block (BPB) and more"
sector-aligned



begin
	read-only hex 3 "JMP instruction"
	char[8]	"OEM"

	goto     0x0040

	section				"exFAT BIOS Parameter Block"
	int64				"Partition Offset"
	int64				"Total Sectors in Volume"
	uint32				"FAT Offset (Offset of First FAT)"
	uint32				"FAT Length (in sectors)"
	uint32				"Cluster Heap Offset"
	uint32  			"Cluster Count"
	uint32				"Root Directory First Cluster"
	uint32				"Volume serial number (decimal)"
	move -4
	hex 4				"Volume serial number (hex)"
	hex 2				"File System Revision (MM.VV)"
	uint16				"Volume Flags"
	move -1
	uint_flex "0" "Bit 0 - Active FAT"
	move -4
	uint_flex "1" "Bit 1 - Volume Dirty"
	move -4
	uint_flex "2" "Bit 2 - Media Failure"
	move -4
	uint_flex "3" "Bit 3 - Clear to Zero"
	move -4
	uint_flex "4" "Bit 4 - Reserved"
	move -4
	uint_flex "5" "Bit 5 - Reserved"
	move -4
	uint_flex "6" "Bit 6 - Reserved"
	move -4
	uint_flex "7" "Bit 7 - Reserved"
	move -3
	uint8				"Bytes Per Sector"
	uint8				"Sectors Per Cluster"
	uint8				"Number of FATS"
	hex 1				"Drive Select (Hex)"
	uint8				"Percent in use"
	endsection

	section				"VBR Signature"
	goto		0x1FE
	read-only hex 2 "Signature (55 AA)"
	endsection
end