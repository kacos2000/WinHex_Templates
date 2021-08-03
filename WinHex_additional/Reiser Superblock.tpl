template "ReiserFS Superblock"

// Created by Jens Kirschner on Oct 5, 2004
// X-Ways Software Technology AG

// The superblock always starts at offset 0x10000 = 64 KB regardless 
// of sector or block sizes on the system. 

description "To be applied to offset 0x10000 of a ReiserFS partition"
applies_to disk
sector-aligned
requires 0x34 "52 65 49 73 45 72" // Reiser magic "ReIsEr"

begin
	uint32	"Block count"
	uint32	"Free block count"
	uint32	"Root block #"
	uint32	"Journal block #"
	uint32	"Journal device #"
	uint32	"Journal size"
	uint32	"Max. transaction blocks"
	uint32	"Journal magic"
	uint32	"Max. batch blocks"
	uint32	"Max. commit age (secs)"
	uint32	"Max. transaction age (secs)"
	uint16	"Block size"
	uint16	"Max. size object ID array"
	uint16	"Curr. size object ID array"
	uint16	"State (1=clean)"
	char[10]	"Reiser Magic"
	uint16	"State (fsck)"
	uint32	"Hash function code"
	uint16	"Tree height"
	uint16	"No. of blocks for block bitmap"
	uint16	"Version"
	uint16	"Reserved for journal"

	uint32	"Inode generation"
	uint32	"Flags"
	hex 16	"UUID"
	char[16]	"Volume label"
end