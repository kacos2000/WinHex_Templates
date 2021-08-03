template "UFS2 Superblock BE"

// Created by Michele Larese on Dec 7, 2005
// X-Ways Software Technology AG

// The first superblock always starts at position 65536, 131072
// or 262144 of an UFS partition. There will be a copy of it in 
// every cylinder group of the drive.

description "Raw content of the UFS2 superblock (big-endian)"
big-endian 
sector-aligned
applies_to disk
requires 0x55c "19 54 01 19"
begin
goto 0x055c
	hexadecimal uint32 "magic number"
goto 0
	hex 8 	"unused"
	uint32 	"Offset to Superblock in CG"
	uint32 	"Offset to Cylinder-block in CG"
	uint32 	"Offset to inode-blocks CG"
	uint32 	"Offset to first data after CG"
	hex 20 	"Unused"
	uint32 	"Number of cylinder groups"
	uint32 	"size of a block"
	uint32 	"size of fragment"
	uint32 	"number of frags in a blk"
	uint32 	"minimum % of free blocks"
	hex 8	"Unused"
	uint32	"Mask to calc blk address"
	uint32	"Mask to calc frag. address"
	uint32	"Shift to calc blk byte addr."
	uint32	"Shift to calc frag byte addr."
	uint32 	"Max number of contiguous blks"
	uint32	"Max number of blks per cyl group"
	uint32	"No. of convert bits blk <-> frag"
	uint32	"Mo. of convert bits frag <-> sector"
	uint32	"Size of Superblock"
	hex 8	"Unused"
	uint32	"No. of ind. addr. per frag"
	uint32	"No. of inodes per block in inode table"
	hex 4	"Unused"
	uint32	"Optimization technique"
	hex 12	"Unused"
	hex 8	"File System ID"
	hex 4	"Unused"
	uint32	"Size of cyl. grp. summary area"
	uint32	"Size of cyl. grp. descriptor"
	hex 20	"Unused"
	uint32	"Inodes per cylinder group"
	uint32	"Fragments per cyl. group"
	hex 16	"Unused"
	byte	"Super block modified flag"
	byte	"FS was clean when mounted"
	byte	"Mounted read only flag"
	byte	"Unused"
	char[468]	"Last mount point"
	char[32]	"Volume name"
	int64	"System UID"
	uint32	"Unused"
	uint32	"Last cylinder group searched"
	hex 272	"Unused"
	int64	"Location of superblock"
	int64	"Number of directorys"
	int64	"Number of free blocks"
	int64	"Number of free inodes"
	int64	"Number of free fragments"
	int64	"Number of free clusters"
	hex 24	"Unused"
	UNIXDateTime "last time written (refinement)"
	UNIXDateTime "last time written"	
	int64	"Number of fragments in FS"
	int64	"No of fragments that can store data"
	int64	"Frag. addr. of cyl. grp. sum. area"
	int64	"Blocks in proc. of being freed"
	uint32	"Inodes in proc. of being freed"
	numbering 1
	{
		int64	"inode addr. for snap inodes"
	} [10]
	uint32	"Expected average file size"
	uint32	"Expected no. of files per dir"
	hex 108	"Unused"
	hex 4	"flags"
	uint32	"Size of cluster summary area in grp. descr."	
	uint32	"Max length of internal symlink"
	hex 4	"Format of inodes"
	int64	"Max file size"
	hex 8	"Mask to calc offset in blk. for addr."
	hex 8	"Mask to calc offset in frag. for addr."
	hex 4	"File system state"
	hex 16	"Unused"
	hex 4 	"Magic number"


end