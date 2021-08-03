template "FAT16 Entry"

// Template by Paul Mullen, 7/14/2000

description "Must start at start of FAT to get numbers right."
appliesto disk
sector-aligned

// requires 0 "F8 FF"	//first bytes of valid FAT16

// Further instructions:
// Specify a cluster number x as the "record #"
// and press ENTER. Then you will be given the
// number of the cluster following cluster x in
// the cluster chain of the corresponding file.

multiple

begin
	uint16	"Next cluster"
	move -2
	hex 2		"as hex (FF FF=End)"
end