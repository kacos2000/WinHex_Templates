template "HFS+ Catalog Key"
description "Includes following file or folder record"

// Starts with parent folder's CNID and name of the file or folder

big-endian
applies_to disk

begin
	UInt16	keyLength
	UInt32	parentID
	UInt16	NodeNameLen    
	String16	NodeNameLen nodeName

	Int16	recordType

	IfEqual	recordType 1
		section	"Folder Record"
		UInt16	flags
		UInt32	valence
		uint32	folderID
		AppleDateTime	createDate
		AppleDateTime	contentModDate
		AppleDateTime	attributeModDate
		AppleDateTime	accessDate
		AppleDateTime	backupDate

		// HFSPlusBSDInfo permissions
		UInt32	ownerID
		UInt32	groupID
		UInt8	adminFlags
		UInt8	ownerFlags
		octal	UInt16	fileMode
		UInt32	"iNodeNum or linkCount or rawDevice"

		hex 20	FolderUserInfo
		hex 20	ExtendedFolderFinderInfo

		UInt32	textEncoding
		UInt32	reserved
	Else
		section	"File Record"
		UInt16	flags
		UInt32	reserved
		uint32	fileID
		AppleDateTime	createDate
		AppleDateTime	contentModDate
		AppleDateTime	attributeModDate
		AppleDateTime	accessDate
		AppleDateTime	backupDate

		// HFSPlusBSDInfo permissions
		UInt32	ownerID
		UInt32	groupID
		UInt8	adminFlags
		UInt8	ownerFlags
		octal	UInt16	fileMode
		UInt32	"iNodeNum or linkCount or rawDevice"

		hex 20	UserInfo
		hex 20	FinderInfo

		section	"dataFork"
		Int64	logicalSize
		UInt32	clumpSize
		UInt32	totalBlocks
		{
		UInt32	startBlock
		UInt32	blockCount
		}[8]

		section "resourceFork"
		Int64	logicalSize
		UInt32	clumpSize
		UInt32	totalBlocks
		{
		UInt32	startBlock
		UInt32	blockCount
		}[8]
	EndIf
end