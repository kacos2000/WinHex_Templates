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
	section "Preamble"  
   	    char[6]"Signature" 
   	    uint32 "Major Version" 
   	    uint32 "Minor Version" 
	    uint32 "ClearTextRedirectionLength" 
	    IfGreater ClearTextRedirectionLength 0
		    string16 ClearTextRedirectionLength "ClearTextRedirectionString"
	    EndIf
	    uint32 "Total Header Length"
	endSection

	section "Header"
		uint32 "OriginalFileExtensionOffset" // from the start of the header
		uint32 "OriginalFileExtensionLength" // in bytes
		uint32 "Publishing_License_Data_Offset" // from the start of the header
		uint32 "EncryptedDataOffset" // from the start of the header
		int64  "OriginalFileSize" // in bytes
		move 4
		uint32 "MetaDataOffset" //
		uint32 "MetaDataLength" // in bytes
		// Get the data
		ifGreater OriginalFileExtensionOffset 0
			goto OriginalFileExtensionOffset
		endIf
		string16 OriginalFileExtensionLength "Original File Extension Data"
		ifGreater Publishing_License_Data_Offset 0
			goto Publishing_License_Data_Offset
		endIf
		ifGreater (MetaDataOffset-Publishing_License_Data_Offset) 0
			hex (MetaDataOffset-Publishing_License_Data_Offset) "Publishing License Data" // "Rights Management Services Publishing License, defined in [MS-RMPR] section 2.2.9.7"
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