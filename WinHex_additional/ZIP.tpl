template "ZIP file"
description "Contains structure of ZIP file"
applies_to file
requires 0 "504B0304"

begin
	// File Information Stored in ZIP
    section "Compressed file local headers"
        numbering 0
        {
            section "File header"
                hex 4 Value            
                IfEqual Value 0x504B0304
            		move -4
                Else
                    ExitLoop
            	EndIf
                
            	hex 4	    "ZIP local file header signature (0x04034b50)"
            	hex 2	    "Version needed to extract"
            	hex 2	    "General purpose bit flag"
            	hex 2	    "Compression method"
            	DOSDateTime "Last mod file date/time"
                hex 4       "CRC 32"
            	uint32	    "Compressed size"
            	uint32	    "Uncompressed size"
            	uint16	    "Filename length"
                uint16	    "Extra field length"
            	string	    "Filename length"	"File name"
                hex	        "Extra field length"	"Extra field"
                move	    "Compressed size"	// to end of file data
            endsection
        }[100]        
    endsection
    
    move -4
    section "Central Directory"
        numbering 0
        {
            section "CD File Header"
                hex 4 Value1
                IfEqual Value1 0x504B0102
                    move -4
                Else
                    ExitLoop
                EndIf
                
                hex 4       "Central file header signature (0x02014b50)"
                hex 2	    "Version made by"
                hex 2	    "Version needed to extract"
                hex 2	    "General purpose bit flag"
                hex 2	    "Compression method"
                DOSDateTime "Last mod file date/time"
                hex 4       "CRC 32"
                uint32	    "Compressed size"
                uint32	    "Uncompressed size"
                uint16	    "Filename Length"
                uint16	    "ExtraField Length"
                uint16      "File comment length"
                uint16      "Disk number start"
                hex 2       "Internal file attributes"
                hex 4       "External file attributes"
                uint32      "Relative offset of local header"
                string	    "Filename Length"   "File name"
                string      "ExtraField Length" "Extra field"
                string      "File comment length"   "File comment"
            endsection
        }[100]      
    endsection
    
    move -4
    section "Additional data"
        hex 4  "End of central dir signature  (0x06054b50)"
        uint16 "Number of this disk"
        uint16 "Number of the disk with the start of the central directory"
        uint16 "Number of entries in the central dir on this disk"
        uint16 "Number of entries in the central dir"
        uint32 "Size of the central directory"
        uint32 "Offset of start of central directory with respect to the starting disk number"
        uint16 "Zipfile comment length"
        string "Zipfile comment length" "Zipfile comment"
    endsection
end