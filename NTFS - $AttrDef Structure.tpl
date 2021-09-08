Template "NTFS - $AttrDef Structure"

// Costas Katsavounidis - 2021 v.1
// kacos2000 [at] gmail.com
// https://github.com/kacos2000

description "NTFS - $AttrDef Metafile Structure"
// Ref: https://flatcap.org/linux-ntfs/ntfs/files/attrdef.html

read-only

begin

Numbering 1
{
    Section "Attribute #~"
        little-endian string16 64 "Attribute Label"
        uint32 "Attribute Type (Decimal)"
        move -4
        hex 4 "Attribute Type (Hex)"
        hex 4 "Display rule"
        hex 4 "Collation rule"
        ifEqual "Collation rule" 0x00000000
            move -4 
            hexadecimal uint32 "-> Binary"
        else
        ifEqual "Collation rule" 0x00000001
            move -4 
            hexadecimal uint32 "-> Filename"
        else
        ifEqual "Collation rule" 0x00000002
                move -4 
                hexadecimal uint32 "-> Unicode String"
            else
        ifEqual "Collation rule" 0x00000010
                move -4 
                hexadecimal uint32 "-> Unsigned Long"
            else
        ifEqual "Collation rule" 0x00000011
                move -4 
                hexadecimal uint32 "-> SID"
            else
        ifEqual "Collation rule" 0x00000012
                move -4 
                hexadecimal uint32 "-> Security Hash"
            else
        ifEqual "Collation rule" 0x00000013
                move -4 
                hexadecimal uint32 "-> Multiple Unsigned Longs"
        EndIf
        hex 4 "Flags"
        ifEqual "Flags" 0x02000000
                move -4 
                hexadecimal uint32 "-> Indexed"
            else
        ifEqual "Flags" 0x40000000
                move -4 
                hexadecimal uint32 "-> Always Resident"
            else
        ifEqual "Flags" 0x80000000
                move -4 
                hexadecimal uint32 "-> Allowed to be Non-Resident"
        EndIf
        int64 "Minimum Attribute Size"
        int64 "Maximum Attribute Size"
    endSection
}[16]

end