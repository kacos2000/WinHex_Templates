template "FAT32 Entry"

// Template by Stefan Fleischmann
// Based on template by Paul Mullen

description "Must start at start of FAT to get numbers right."
appliesto disk
sector-aligned

// requires 0 "F8 FF"	//first bytes of valid FAT32

// Further instructions:
// Specify a cluster number x as the "record #"
// and press ENTER. Then you will be given the
// number of the cluster following cluster x in
// the cluster chain of the corresponding file.

multiple

begin
	uint32	"Next cluster"
	move -4
	hex 4		"as hex (FF FF=End)"
end