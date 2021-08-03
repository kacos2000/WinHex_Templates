template "Reiser4 Stat Data"

// Created by Jens Kirschner

// X-Ways Software Technology AG

description "To be applied to the beginning of a Reiser4 Stat Structure"
applies_to disk

begin
	//The first 2 Bytes contain one bit for each possible extension (1: Extension is present)
	uint_flex "0" "Light weight Stat"
	move -4
	uint_flex "1" "Unix Stat"
	move -4
	uint_flex "2" "Large times"
	move -4
	uint_flex "3" "Symlink included"
	move -4
	uint_flex "4" "Non-standard Plug-In"
	move -4
	uint_flex "5" "Flags present"
	move -4
	uint_flex "6" "Capabilities present"
	move -4
	uint_flex "7" "Cluster Stat"
	move -4
	uint_flex "8" "Crypto Stat"
	move -2

	//The next three fields are always present, but for light-weight files, they are the only ones!

	IfEqual "Light weight Stat" 1	
		section "Light weight Stat"
		octal uint16 "File mode (octal)"
		uint32 "Hard link count"
		int64 "FileSize"
	EndIf

	IfEqual "Unix Stat" 1
		section "Unix Stat"
		uint32 "Owner ID (uid)"
		uint32 "Group ID (gid)"
		UNIXDateTime "Access time"
		UNIXDateTime "Modification time"
		UNIXDateTime "Change time"
		int64 "Bytes used or device"
	EndIf

	IfEqual "Large times" 1 //Is this really the way this works?
		section "Large times"
		uint32 "Access time nano-seconds"
		uint32 "Modification time nano-seconds"
		uint32 "Change time nano-seconds"
	EndIf

	IfEqual "Symlink included" 1
		section "Symlink"
		char[FileSize] "Symlink target"
	EndIf

	IfEqual "Non-standard Plug-In" 1
		uint16 "Plug-in number"
		{
			move 4 //contents ... difficult
		}[Plug-in number]
	EndIf

//	IfEqual "Flags present" 1
//		hex 4 "Flags"
//	EndIf

//	IfEqual "Capabilities present" 1
//		hex 4 "Effective Capabilities"
//		hex 4 "Permitted Capabilities"
//	EndIf

//	IfEqual "Cluster Stat" 1
//		int64 "Cluster shift"
//	EndIf

//	IfEqual "Crypto Stat" 1
//		uint16 "Crypto-Key size"
//		hex "Crypto-Key size" "Key"
//	EndIf

end