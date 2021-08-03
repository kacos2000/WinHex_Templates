template "UFS1 cylinder group descriptor"

// Created by Michele Larese on Dec 20, 2005
// X-Ways Software Technology AG

description "big-endian variant"
big-endian
sector-aligned
applies_to disk
requires 0x04 "00 09 02 55"

begin
	uint32	"unused"
	hex 4	"Magic signature"
	UNIXDateTime	"Last time written"
	uint32	"Group no."
	uint16	"No. of cylinders in group"
	uint16	"No. of inodes in group"
	uint32	"No. of fragments in group"
	uint32	"No. of directorys"
	uint32	"No. of free blocks"
	uint32	"No. of free inodes"
	uint32	"No. of free fragments"
	uint32	"Last block allocated"
	uint32	"Last fragment allocated"
	uint32	"Last inode allocated"
	hex 32	"Summary of available fragments"
	uint32	"No. of free blocks in each cylinder"
	uint32	"Free block position table"
	uint32	"Position of Inode bitmap"
	uint32	"Position of fragment bitmap"
	uint32	"Next available space in descriptor"
	uint32	"Counts of available clusters"
	uint32	"Position of block bitmap"
	uint32	"No. of blocks in group"
end