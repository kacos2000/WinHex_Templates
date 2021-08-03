template ".LNK FILE Record"
// Template by Steve Guty
// Gnostic Concepts

// To retrieve useful data from the .LNK file structure

description "to be applied to .LNK files to extract further data"

applies_to file
sector-aligned

begin
	section "File Header"
	char[4]	"Signature: L"
	hex 16	"GUID"
   	binary[1] "display flags"
	move -1
	uint_flex "2" "D$"  //flag for descriptor string entry
 	move -4
	uint_flex "3" "RP"  //flag for relative path entry
	move -4
	uint_flex "4" "WD"  //flag for working directory entry
	move -4
	uint_flex "5" "CL"  //flag for command line argument entry 
	move -4
	uint_flex "6" "CI"  //flag for custom icon entry	
	binary[2]"attributes"
	move 2
	Filetime "Create Time"
	Filetime "Last Modified Time"
	Filetime "Last Access Time"
	int32    "File Length"
	int32 	"Icon number"
	int32 	"ShowWnd value"
	int32 	"Hotkey"
	int64	   "Always zero"
	int16	   "Offset"
	move Offset
	endsection

	Section  "File locator table"
	int32 	"File locator table length"
	int32	   "Offset to end of table"
	uint_flex "1""Network_flag"
	move -4
	uint_flex "0""Local_flag"
	// bit zero indicates local drive availabilty, bit one network drive availability
	int32	   "Offset of local volume table"
	int32	   "Offset of local pathname"
	int32    "Offset of network volume info"
	int32    "Offset_extended_pathname"
	endsection
	
	IfEqual Local_flag 1
	section	"Local Volume Table"
	int32	   "Length of local volume table"
	int32	   "Volume type (2,6=removable,3=HD,4=network drive,5=CD/DVD)"
	hexadecimal uint32   "Volume serial number"
	int32	   "Offset to volume label"
	zstring	"Volume Label"
	zstring  "Local path"
	move 1
	endsection
	EndIf

	IfEqual Network_flag 1
	section  "Network Volume Table"
	int32	 "  Length of network volume table"
	move 4
	int32	   "Offset of network share name"
	move 8
	zstring  "Network share name"
	zstring 	"Extended Pathname"
	endsection
	Endif

	IfEqual D$ 1
		int16 	"Length_Desc$"
		char16[Length_Desc$] "Descriptor String"
	Endif
	
	IfEqual RP 1
		int16 	"Length_RelPath$"
		char16[Length_RelPath$] "Relative Path String"
	Endif
	
	IfEqual WD 1
		int16 	"Length_WDPath$"
		char16[Length_WDPath$] "Working Directory String"
	Endif
	
	IfEqual CL 1
		int16 	"Length_CMDLINE$"
		char16[Length_CMDLINE$] "Command Line String"
	Endif
	
	IfEqual CI 1
		int16 	"Length_Icon$"
		char16[Length_Icon$] "Icon String"
	Endif
end

