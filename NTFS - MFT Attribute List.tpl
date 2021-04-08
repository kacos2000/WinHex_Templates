template "NTFS - MFT Attribute List"

// Costas Katsavounidis - 2021.1
// kacos2000 [at] gmail.com
// https://github.com/kacos2000
//
// To be applied to the start of an $Attribute_list Attribute

description "NTFS - MFT Attribute List"
applies_to file/disk 
read-only           
requires 0 "20 00 00 00"  //$Attribute_list attribute type Signature

begin            
    hex 4 "Attribute"
    ifEqual Attribute 0x20000000
		  move 20
   else 
        move -4
   endIf

   numbering 1 {
   section "Attribute #~"
        hex 4 "Attribute Type"
		  ifEqual "Attribute Type" 0xFFFFFFFF
				endSection
            end
        endIf
        uint16 "Record_length"
        ifEqual "Record_length" 0
            endSection
            end
        endIf
        uint8  "Stream_Name_Length"
        uint8  "Stream_Name_Offset"
        int64  "Start VCN"
        uint48 "Base Record Number"
        ifEqual "Base Record Number" 0
            endSection
            end
        else
        ifGreater "Base Record Number" 4294967295 // Limit to uint32
            endSection
            end
        endIf
        uint16 "Base Record Sequence Nr"
        uint16 "Attribute ID"
        ifGreater Stream_Name_Length 0
            move -26
            move Stream_Name_Offset
            string16 Stream_Name_Length "Stream Name"
				move -4
				move ((Stream_Name_Offset)*(-1))
            move ((Stream_Name_Length)*(-1))
            move Record_length
        else
            move -26
            move Record_length
        endIf
    endSection
}[32]
end