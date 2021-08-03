template "EVT Event"

// Template by Andreas Schuster
// andreas.schuster@telekom.de
// Version 1.0 - 20050301

description "Microsoft Windows Eventlog - Event Record"
applies_to file
requires 4 "4C 66 4C 65"
begin
	hexadecimal		uint32 		"Length1"
						char[4] 		"Magic"
						uint32		"RecordNumber"
						time_t		"TimeGenerated"
						time_t		"TimeWritten"
						section		"EventId"
							uint16		"Code"
							move -2
							uint_flex "16,17,18,19,20,21,22,23,24,25,26,27"	"Facility"
							move -4
							uint_flex "28"	"reserved"
							move -4
							uint_flex "29"	"Customer"
							move -4
							uint_flex "30,31"	"Severity"
						endsection
						uint16		"EventType"
						uint16		"NumInsertionStrings"
						uint16		"EventCategory"
						uint16		"reserved"
						uint32		"ClosingRecord"
						uint32		"OfsStrings"
						uint32		"LenSid"
						uint32		"OfsSid"
						uint32		"LenEventData"
						uint32		"OfsEventData"

						zstring16	"EventSource"
						zstring16	"ComputerName"

						IfGreater LenSid 0
							goto OfsSid
							hex LenSid	"SID"
						EndIf

						// Insertion Strings
						IfGreater NumInsertionStrings 0
							numbering 1
							{
								zstring16	"String ~"
							}[NumInsertionStrings]
						EndIf

						//Event Data
						IfGreater LenEventData 0
							goto OfsEventData
							hex LenEventData	"EventData (hex)"
							goto OfsEventData
							zstring	"EventData (ascii)"
						EndIf
						
						goto Length1
						move -4
	hexadecimal		uint32 		"Length2"
end