Template "NTFS - $R INDX Structure"

// Costas Katsavounidis - 2021 v.1
// kacos2000 [at] gmail.com
// https://github.com/kacos2000
// Extend/$Reparse Index ($R) entries

description "NTFS - $Reparse ($R) INDX Structure"

// Should be applied to the start of an
// $R INDX Header
//

requires 0 "494E4458" //INDX
read-only
multiple 4096

Begin
    Section "Index Header"
        char[4] "Signature"
        uint16 "Offset to FixUp Array"
        uint16 "Number_of_FixUps"
        int64 "Last $LogFile Sequence Number" // LSN
	    int64 "VCN of this INDX buffer"
     endSection

     Section "Index Node Header"   //starts at offset 24 (0x18)
        uint32 "Offset_to_Index_Entries" // Relative to the Node Header (offset 24)
        uint32 "Size of Index Node"      
        uint32 "Allocated_Size_of_Index_Node" // Starting from the Node Header (+24 should be 4096)
        uint32 "1 = Leaf Node"
        goto "Offset to FixUp Array"
	    uint16 "Update Sequence Nr."
	    move -2
        hex 2 "FixUp Value"
        Numbering 1 {
           hex 2 "FixUp ~"
        }[((Number_of_FixUps)-1)]
	endSection

	goto ((Offset_to_Index_Entries)+24)

	numbering 1 {
	Section "Index Node Entry ~"
	    uint16 "Offset to Data"
	    uint16 "Size of Data"
	    move 4 
	    uint16 "Size of Index Entry"
	    uint16 "Size of Index Key"
	    uint16 "Flags" // 0: Active, 2: Not Allocated (?)
	    move 2
	    hexadecimal uint32 "Reparse Tag"
	    uint48 "MFT Record Nr."
	    uint16 "MFT Record Seq. Nr."
	    move 4
	endSection	
	}[(((Allocated_Size_of_Index_Node)-(Offset_to_Index_Entries)-(24)) / 32)]
End