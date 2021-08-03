template "Reiser4 Node Header"

// Created by Jens Kirschner

// X-Ways Software Technology AG

// The internal tree nodes of Reiser4 all possess a node header.
// This is the node header defined by Reiser4 Format40, which is the
// currently only format definition


description "Node Header for Format40 of Reiser4"
//applies_to disk
sector-aligned

begin
	int16 "Plugin ID (0: Format40)"
	int16 "No. of items"
	int16 "Free space"
	int16 "Free space offset"
	char[4] "Node magic"
	hex 4 "MKFS ID"
	int64 "Flush ID"
	int16 "Flags"
	byte "Level"
	byte "Pad"
end