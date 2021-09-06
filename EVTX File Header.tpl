Template "EVTX File Header"

// Costas Katsavounidis - 2021 v.1
// kacos2000 [at] gmail.com
// https://github.com/kacos2000

description "EVTX File Header"
// Ref: https://github.com/libyal/libevtx/blob/main/documentation/Windows%20XML%20Event%20Log%20(EVTX).asciidoc#2-file-header

read-only
requires 0 "456C6646696C6500"

begin
Section "EVTX File Header"
    char[8] "Signature" //Must be 0x456C6646696C6500
    int64  "First chunk number"
    int64  "Last chunk number"
    int64  "Next record identifier"
    uint32 "Header size"
    move 2
    uint16 "Major version"
    move -4
    uint16 "Minor version"
    move 3
    uint16 "Header block size"
    uint16 "Number of chunks"
    goto 120 
    uint32 "Flags"
    ifEqual Flags 1
        move -4
        Hex 1 "=> Is dirty"
        move 3
    else
    ifEqual Flags 2
        move -4
        Hex 1 "=> Is full"
        move 3
    endIf
    little-endian hex 4 "CRC32 (1st 120 bytes of Header)"
endSection
end