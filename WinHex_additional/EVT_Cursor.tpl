template "EVT Cursor"

// Template by Andreas Schuster
// andreas.schuster@telekom.de
// Version 1.0 - 20050301

// This record separates the latest event record from free space or the 
// oldest event record respective.
// Search for the "required" byte sequence shown below to locate the record.

description "Microsoft Windows Eventlog - Cursor Record"
applies_to file
requires 0 "28 00 00 00 11 11 11 11 22 22 22 22 33 33 33 33 44 44 44 44"
begin
	hexadecimal		uint32 		"Length1"
						hex 16 		"Magic"
										// offset of the first record
	hexadecimal		uint32		"OfsFirst"
										// offset 
	hexadecimal		uint32		"OfsNext"
						uint32		"NumNext"
						uint32		"NumFirst"
	hexadecimal		uint32 		"Length2"
end