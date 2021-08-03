template "UFS1 Superblock BE"

// Created by Michele Larese on Dec 7, 2005
// X-Ways Software Technology AG

// The first superblock always starts at position 8192 of 
// an UFS partition. There will be a copy of it in every 
// cylinder group of the drive.

description "Raw content of the UFS1/2 superblock (big-endian)"
big-endian 
sector-aligned
applies_to disk
requires 0x55c "00 01 19 54"
begin
goto 0x055c
	hexadecimal uint32 "magic number"
goto 0
	uint32 "unused"
	uint32 "unused"
	uint32 "Offset to Superblock in CG"
	uint32 "Offset to Cylinder-block in CG"
	uint32 "Offset to inode-blocks CG"
	uint32 "Offset to first data after CG"
	uint32 "Cylinder group offset in cylinder"
	hexadecimal uint32 "used to calc mod fs_ntrak"
	UNIXDateTime "last time written -- time_t"
	uint32 "number of blocks in fs"
	uint32 "number of data blocks in fs"
	uint32 "number of cylinder groups"
	uint32 "size of basic blocks in fs"
	uint32 "size of frag blocks in fs"
	uint32 "number of frags in a block in fs"
	uint32 "minimum percentage of free blocks"
	uint32 "num of ms for optimal next block"
	uint32 "disk revolutions per second"
	hexadecimal uint32 "``blkoff'' calc of blk offsets"
	hexadecimal uint32 "``fragoff'' calc of frag offsets"
	uint32 "``lblkno'' calc of logical blkno"
	uint32 "``numfrags'' calc number of frags"
	uint32 "max number of contiguous blks"
	uint32 "max number of blks per cyl group"
	uint32 "block to frag shift"
	uint32 "fsbtodb and dbtofsb shift constant"
	uint32 "actual size of super block"
	uint32 "csum block offset"
	uint32 "csum block number"
	uint32 "value of NINDIR"
	uint32 "value of INOPB"
	uint32 "value of NSPF"
	uint32 "optimization preference, see below"
	uint32 "sectors/track including spares"
	uint32 "hardware sector interleave"
	uint32 "sector 0 skew, per track"
	hex 8 "file system id"
	uint32 "blk addr of cyl grp summary area"
	uint32 "size of cyl grp summary area"
	uint32 "cylinder group size"
	uint32 "tracks per cylinder"
	uint32 "sectors per track"
	uint32 "sectors per cylinder"
	uint32 "cylinders in file system"
	uint32 "cylinders per group"
	uint32 "inodes per cylinder group"
	uint32 "blocks per group * fs_frag"
	uint32 "number of directories"
	uint32 "number of free blocks"
	uint32 "number of free inodes"
	uint32 "number of free frags"
	uint8 "super block modified flag"
	uint8 "file system is clean flag"
	uint8 "mounted read-only flag"
	uint8 "currently unused flag"
	char[512] "name mounted on"
	uint32 "last cg searched"

numbering 1
{
	hexadecimal uint32 "list of fs_cs info buffers"
} [31]
	uint32 "max cluster"
	uint32 "cyl per cycle in postbl"
	hex 256 "old rotation block list head"
end