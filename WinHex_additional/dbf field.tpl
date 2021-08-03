template "dbf field"

// Sample template by Paul Mullen, pcguru@the-answer.com

description "32 byte definition for each data field"

appliesto file

requires 10 00
multiple

begin
	char[10]				"Field Name (zero terminated)"
	read-only hex 1	"(zero terminator)"
	char[1]				"Field Type"
	int32					"offset from start of record"
	byte					"Field length (bytes)"
	byte					"Decimal places"
	read-only hex 2 	"(Reserved)"
	byte					"Work area ID"
	read-only hex 10	"(Reserved)"
	byte					"Used in production index"
end
