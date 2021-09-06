Template "EVTX Chunk Header"

// Costas Katsavounidis - 2021 v.1
// kacos2000 [at] gmail.com
// https://github.com/kacos2000

description "EVTX File Header"
// Ref: https://github.com/libyal/libevtx/blob/main/documentation/Windows%20XML%20Event%20Log%20(EVTX).asciidoc#3-chunk

read-only
requires 0 "456C6643686E6B00"

begin
Section "EVTX Chunk Header"
    char[8] "Signature" //Must be 0x456C6643686E6B00
    int64  "First event record number"
    int64  "Last event record number"
    int64  "First event record ID"
    int64  "Last event record ID"
    uint32 "Header size"
    uint32 "Last event record data offset"
    uint32 "Free space offset"
    hex 4  "CRC32 of the events records data"
    goto 120
    move 4
    hex 4  "CRC32 (1st 120 + 128-512 bytes of the chunk)"
endSection
end