template "ReFS SuperBlock"

// Costas Katsavounidis - 2021
// kacos2000 [at] gmail.com
// https://github.com/kacos2000


// First SuperBlock starts at Cluster 30
// There are 2 Additional copies of the SuperBlock at 3rd and 2nd last clusters of the Volume

// To be applied to byte 0 of a SuperBlock

description "ReFS - SUPB SuperBlock"
applies_to disk
sector-aligned
read-only
requires 0 "53 55 50 42"  //SUPB SuperBlock Signature

begin
    section "Page Header"
    char[4] "Signature"
    uint32  "Unknown" // Always 0x2
    move 4
	hex 4	"Volume signature (hex)"
    hex 8   "Virtual Allocator Clock"
    hex 8   "Tree Update Clock" 
    //int64   "VCN 0" // SuperBlock start offset
    int64   "Superblock start (offset)" // offset sector from start of Volume
    //int64   "VCN 1"
    //int64   "VCN 2"
    //int64   "VCN 3"
    //int64   "Table Identifier (High)"
    //int64   "Table Identifier (Low)"
    move 40
    endSection

    Section "GUID"
    guid    "Guid"
    endSection
    Section "Volume Signature: x1 -bxor x2 -bxor .."
    move -16
    // GUID = 4* DWORDS (x1.. x4) 
    // In Powershel => Volume Signature = (x1 -bxor x2 -bxor x3 -bxor x4).ToString('X')
    uint32 "x1"
    uint32 "x2"
    uint32 "x3"
    uint32 "x4"
    move 8
    int64   "Superblock version"
    
    Section "References"
    uint32  "Offset to first CheckPoint entry"
    uint32  "Nr of CheckPoints"
    uint32  "Offset to Self-Descriptor"
    uint32  "Length of Self-Descriptor" 
    goto    "Offset to first CheckPoint entry"
    int64   "CheckPoint #1 offset (sector)" // offset sector from start of Volume
    int64   "CheckPoint #2 offset (sector)" // offset sector from start of Volume
    endSection
end

