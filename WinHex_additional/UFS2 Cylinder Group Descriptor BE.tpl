template "UFS2 cylinder group descriptor"

// Created by Michele Larese on Dec 20, 2005
// X-Ways Software Technology AG

description "big-endian variant"
sector-aligned
big-endian
applies_to disk
requires 0x04 "00 09 02 55"
begin
	uint32	"unused"
	hex 4	"Magic signature"
	uint32	"unused"
	uint32	"Group number"
	uint32	"unused"
	uint32	"No. of fragments in group"
	uint32	"No. of directorys"
	uint32	"No. of free blocks"
	uint32	"No. of free inodes"
	uint32	"No. of free fragments"
	uint32	"Last block allocated"
	uint32	"Last fragment allocated"
	uint32	"Last inode allocated"
	hex 32	"Summary of available fragments"
	int64	"unused"
	uint32	"Position of inode bitmap"
	uint32	"Position of fragment bitmap"
	uint32	"Next available space"
	uint32	"Counts of available cluster"
	uint32	"Positon of block bitmap"
	uint32	"No. of blocks in group"
	uint32	"No. of inodes in group"
	uint32	"Last initialized inode"
	uint32	"unused"
	move 4
	UNIXDateTime	"Last time written"
end