template "UFS2 Inode"

// Created by Michele Larese on Dec 20, 2005
// X-Ways Software Technology AG

description "little-endian variant"
applies_to disk
multiple
begin
	octal uint16 "mode"
	uint16	"Link count"
	uint32	"User ID"
	uint32	"Group ID"
	uint32	"Inode block size"
	int64	"Size"
	int64	"Bytes held"
	move 4
	UNIXDateTime	"Access time"
	move 4
	UNIXDateTime	"Modified time"
	move 4
	UNIXDateTime	"Change time"
	move 4
	UNIXDateTime	"Create time"
	uint32	"Refinement mtime (ns)"
	uint32	"Refinement atime (ns)"
	uint32	"Refinement changetime (ns)"
	uint32	"Refinement createtime (ns)"
	uint32	"Generation no. (NFS)"
	uint32	"Kernel flags"
	uint32	"Status flags"
	uint32	"extended attribute flags"
	int64	"1. direct ext. attr. blk pointer"
	int64	"2. direct ext. attr. blk pointer"
numbering 1
{
	int64	"Direkt block ptr. [~]"
} [12]
	int64	"Indirect block ptr."
	int64	"Double indirect block ptr."
	int64	"Triple indirect block ptr."
goto 0
move 256
end
