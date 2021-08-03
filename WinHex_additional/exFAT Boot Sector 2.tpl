template "Boot Sector exFAT"

// Template by Christopher Taylor
//		taylormade@rocketmail.com


// Template for the Volume Boot Record of an exFAT Volume
// 		This template is far from complete and there are several sections
//		of unknown data that are just stepped over that need to be 
//		understood in the final version of this template

description "Describes Volume and Location of System Files"
applies_to disk
sector-aligned

requires 0x02	"90"
requires 0x03	"45 58 46 41 54" // ="EXFAT" at offset 3
requires 0x1FE "55 AA"

begin
	read-only hex 3 "JMP instruction"
	char[8]	"OEM"

	section	"Volume Information"
	move 53	//zeros
	uint32	"Partition Sector Offset"
	move 4
	int64	"Total Sectors in Volume"
	uint32	"FAT Location (Sector Number)"
	uint32	"Size of FAT (in Sectors)"
	uint32	"Bitmap Location (Sector Number)"
	uint32	"Number of Clusters"
	uint32	"Root Directory Location (Cluster Number)"
	hexadecimal uint32	"Volume Serial Number"
	read-only hex 2	"File System Version #"
	binary	"Volume Flags"
	uint8	"Active FAT"
	uint8	"Bytes per Sector (2^x)"
	uint8	"Sectors per Cluster (2^x)"
	uint8	"Number of FATs"
	read-only hex 1	"Drive Type"
	uint8	"Percentage of volume used"	
	move 7
	endsection
	read-only hex 48	"Boot Code"
	move 88	//zeros
	char[72]	"Boot Messages"
	read-only hex 118	"zeros"
	read-only hex 61	"FFs"
	read-only hex 3	"unidentified"

	endsection

	goto		0x1FE
	read-only hex 2 "Signature (55 AA)"
end