template "UFS1 Inode"

// Created by Michele Larese on Dec 20, 2005
// X-Ways Software Technology AG

description "big-endian variant"
applies_to disk
big-endian
multiple
begin
	octal uint16 "mode"
	uint16	"Link count"
	uint32	"unused"
	int64	"Size"
	UNIXDateTime	"Access time"
	uint32	"Refinement"
	UNIXDateTime	"Modified time"
	uint32	"Refinement"
	UNIXDateTime	"Change time"
	uint32	"Refinement"
numbering 1
{
	uint32	"Direkt block ptr. [~]"
} [12]
	uint32	"Indirect block ptr."
	uint32	"Double indirect block ptr."
	uint32	"Triple indirect block ptr."
	uint32	"Status flags"
	uint32	"Blocks held"
	uint32	"User ID"
	uint32	"Group ID"
goto 0
move 128
end
