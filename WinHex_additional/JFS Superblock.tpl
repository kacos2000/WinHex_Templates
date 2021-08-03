template "JFS Superblock"

// Created by Jens Kirschner
// X-Ways Software Technology AG

description "JFS Superblock for Linux"
applies_to disk
//sector-aligned
requires 0x0 "4A 46 53 31" //JFS1

begin
	char[4] "Magic string JFS1"
	uint32		"Version number"

	int64			"Sector count"
	uint32		"Block size"
	uint16		"log2 of block size"
	uint16		"log2 (bl.size/sect.size)"
	uint32		"Sector size"
	uint16		"log2 of sector size"
	uint16		"Padding"
	uint32		"Allocation group size"
	uint32		"Flags"
	uint32		"File system state"
	uint32		"Compression"

	section "Secondary aggregate inode table"
	uint32		"Start block"
	uint32		"Length"

	section "Secondary aggregate inode map"
	uint32		"Start block"
	uint32		"Length"

	Section "Log"
	uint32		"Device address"
	uint32		"Serial no"
	uint32		"Start block"
	uint32		"Length"

	section "fsck work space"
	uint32		"Start block"
	uint32		"Length"
	endsection

	UNIXDateTime "Last update"
	uint32		"Last update nanosec"

	uint32		"fsck log length"
	byte			"Current fsck log"

	char[11]	"Volume name"

	int64			"extendfs size"
	section "extendfs fsck"
	uint32		"Start block"
	uint32		"Length"
	section "extendfs log"
	uint32		"Start block"
	uint32		"Length"
	endsection

	char[16]	"Volume UUID (ASCII)"
	move -16
	hex 16 		"Volume UUID (hex)"

	char[16]	"Volume label"

	char[16]	"Log dev UUID (ASCII)"
	move -16
	hex 16 		"Log dev UUID (hex)"

end