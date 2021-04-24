template "VMDK Header"

// Costas Katsavounidis - 2021 v.1
// kacos2000 [at] gmail.com
// https://github.com/kacos2000

// To be applied to byte 0 of a vmdk file

description "VMDK Header"
applies_to file
requires 0 "4B 44 4D 56" // Signature: 'VMDK' in le
read-only

// Reference: https://www.vmware.com/support/developer/vddk/vmdk_50_technote.pdf

begin
    section "VMDK Header"
        hex 4 "File Signature"
        move -4
        little-endian char[4] "File Signature"
        uint32 "Version" // 1 or 2
        hex 4  "Flags"
        int64 "Capacity (Sectors)"
        int64 "Grain Size (Sectors - pow 2)"
        int64 "Descriptor Offset (sector)"
        int64 "Descriptor Size (sectors)"
        uint32 "Nr of # in a Grain Table"
        int64 "Offset to redundant level0 of Metadata"
        int64 "Offset to level0 of Metadata"
        int64 "Nr of Sectors occupied by Metadata"
        boolean "Unclean Shutdown"
        hex 1 "Single End of Line Ch (ASCII)"
        hex 1 "Non End of Line Ch (ASCII)"
        hex 1 "Double End of Line Ch 1 (ASCII)"
        hex 1 "Double End of Line Ch 2 (ASCII)"
        uint16 "Compression Algorithm"
        move 433 // Padding
    endSection
    ifEqual "Descriptor Offset (sector)" 1
        string 32 "Descriptor start"
    endIf
end
