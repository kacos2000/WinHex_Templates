template "ReFS CheckPoint"

// Costas Katsavounidis - 2021 v.1
// kacos2000 [at] gmail.com
// https://github.com/kacos2000

// CheckPoint offsets can be obtained from the SuperBlock
// There are usually 2 CheckPoints in a Volume

// Reference:
// Forensic Analysis of the Resilient File System (ReFS) Version 3.4 Technical Report CS-2019-05
// https://opus4.kobv.de/opus4-fau/files/12526/refs_report.pdf

// To be applied to byte 0 of a SuperBlock

description "ReFS - CHKP CheckPoint"
applies_to disk
sector-aligned
read-only
requires 0 "43 48 4B 50"  //CHKP CheckPoint Signature

begin
    section "Page Header"
        char[4] "Signature"
        uint32  "Unknown" // Always 0x2
        move 4
	    little-endian hexadecimal uint32	"Volume signature (hex)"
        int64   "Virtual Allocator Clock"
        int64   "Tree Update Clock" 
        int64   "VCN 0 - CheckPoint Offset"
        int64   "VCN 1"
        int64   "VCN 2"
        int64   "VCN 3"
        int64   "Table Identifier (High)"
        int64   "Table Identifier (Low)"
    endSection

    Section "Main"
        move 4 // unknown
        uint16 "Major ReFS Version"
        uint16 "Minor ReFS Version"
        uint32 "Offset to self-descriptor" // from the start of the CheckPoint
        uint32 "Length of self-descriptor"
        int64   "Checkpoint virtual clock"
        int64   "Allocator virtual clock"
        hex 8   "Oldest log record reference"
        uint32  "Unknown"
        move 12
        uint32 "Unknown buffer offset"
        uint32 "Unknown buffer length"
        uint32  "Pointer Count"
    endSection
    section "Offsets from the start of the CheckPoint"  // Pointers from the start of the CheckPoint
        uint32  "=> Object ID Table ref"
        uint32  "=> Medium Allocator Table ref"
        uint32  "=> Container Allocator Table ref"
        uint32  "=> Schema Table ref #1"
        uint32  "=> Parent Child Table ref"
        uint32  "=> Object ID Table duplicate ref"
        uint32  "=> Block Reference Count Table ref"
        uint32  "=> Container Table ref"
        uint32  "=> Container Table duplicate ref"
        uint32  "=> Schema Table duplicate ref"
        uint32  "=> Container Index Table ref"
        uint32  "=> Integrity State Table ref"
        uint32  "=> Small Allocator Table ref"
    endSection
    section "Self-descriptor"
        move -200
        goto "Offset to self-descriptor"
        hex "Length of self-descriptor" "Self-descriptor (hex)"
    endSection
    // Self-descriptor
    // Tables
end
