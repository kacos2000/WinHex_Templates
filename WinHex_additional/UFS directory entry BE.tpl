template "UFS directory entry"

// Created by Michele Larese on Dec 20, 2005
// X-Ways Software Technology AG

description "big-endian variant"
applies_to disk
big-endian
multiple
begin
	uint32	"Inode"
	uint16	"Length of entry"
	uint8	"File type (4:dir,8:file,10:link)"
	uint8	"Length of string"
	char[Length of string]	"name"
goto 0
move "Length of entry"
end