Template "NTFS - $EFS Stream"

// Costas Katsavounidis - 2021 v.1
// kacos2000 [at] gmail.com
// https://github.com/kacos2000

description "NTFS - $EFS Stream  (EFSRPC Metadata Version3)"
// 2.2.2.3  EFSRPC Metadata Version 3: 
// https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-EFSR/%5BMS-EFSR%5D.pdf

//Should be applied to the start of the Resident Content of
//a $Logged_Utility named stream $EFS
//
// Aplies to:
   requires 0 "2E617070785F" //.appx_
// requires 0 "2E7066696C65" //.pfile
read-only

begin
	section "Preamble"  //(0)
   	char[6]"Signature" //(6)
   	uint32 "Major Version" //(10)
   	uint32 "Minor Version" //(14)
		uint32 "ClearTextRedirectionLength" //(18)
		IfGreater ClearTextRedirectionLength 0
			char[ClearTextRedirectionLength] "ClearTextRedirectionString"
		EndIf
		uint32 "Total Header Length" //(22)
	endSection

	section "Header"
		uint32 "OriginalFileExtensionOffset" // (26) from the start of the header
		uint32 "OriginalFileExtensionLength" //(30) in bytes
		uint32 "PLOffset" // (34) from the start of the header
		uint32 "EncryptedDataOffset" //(38) from the start of the header
		int64  "OriginalFileSize" //(46) in bytes
		move 4
		uint32 "MetaDataOffset" //(54)
		uint32 "MetaDataLength" //(58) in bytes
		// Get the data
		ifGreater OriginalFileExtensionOffset 0
			goto OriginalFileExtensionOffset
		endIf
		string16 OriginalFileExtensionLength "Original File Extension Data"
		ifGreater PLOffset 0
			goto PLOffset
		endIf
		ifGreater (MetaDataOffset-PLOffset) 0
			hex (MetaDataOffset-PLOffset) "PLData"
		endIf
		ifGreater MetaDataOffset 0
			goto MetaDataOffset
		endIf
		hex MetaDataLength "MetaData"
	endSection
	
	ifGreater EncryptedDataOffset 0
		goto EncryptedDataOffset
		section "Encrypted Data"
			hex (OriginalFileSize-EncryptedDataOffset) "Encrypted Data"
		endSection
	endIf
end