template "Acronis - TIB File Header"

// Costas Katsavounidis - 2021 v0.1
// kacos2000 [at] gmail.com
// https://github.com/kacos2000

// To be applied on byte 0 of a .tib archive file

description "Acronis - TIB File Header"
applies_to file
requires 0 "CE 24 B9 A2" // Signature
read-only

// Reference: https://github.com/dennisss/acronis-tib

begin
    section "Acronis .tib file header"
    hex 4  "Signature"
    uint16 "Header Length"
    uint16 "Version (0=Win, 1=Mac)"
    hex 4  "Archive Key"
    hex 4  "Slice Key"
    hex 4  "Volume Key"
    uint32 "Sequence Nr"
    hex 4  "Header Checksum"
    uint32 "BlockSize" // Win: 32, Mac: 4096
    endSection
end