template "EVT Header"

// Template by Andreas Schuster
// andreas.schuster@telekom.de
// Version 1.0 - 20050301

// Every EVT file starts with the header record.
// CAVE: Data is not valid if the DIRTY flag is set!
//       Look for the "Cursor" instead.

description "Microsoft Windows Eventlog - Header Record"
applies_to file
fixed_start 0
requires 0 "30 00 00 00 4C 66 4C 65"
begin
	hexadecimal		uint32 		"Length1"
						char[4] 		"Magic"
						uint32		"unknown1"
						uint32		"unknown2"
	hexadecimal		uint32		"OfsFirst"
	hexadecimal		uint32		"OfsNext"
						uint32		"NumNext"
						uint32		"NumFirst"
						uint32		"Filesize"
						section		"Flags"
							hex 4		"Overview"
							move -4
							uint_flex "0"		"DIRTY"
							move -4
							uint_flex "1"		"WRAPPED"
							move -4
							uint_flex "2"		"LOGFULL"
							move -4
							uint_flex "3"		"PRIMARY"
						endsection
	decimal 			uint32		"Retention"
	hexadecimal		uint32 		"Length2"
end