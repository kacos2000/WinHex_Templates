template "dbf file header"

description "First 32 bytes of a dBase/xBase .dbf file"

appliesto file

requires 30 "00 00"

begin
	hex 1					"Version"
	byte [3] 		  	"Last update, format YYMMDD"
	uint32				"Number of records in file"
	uint16				"Length of header"
	uint16				"Data Record length"
	read-only hex 2	"(Reserved, fill with 0)"
	byte					"Incomplete transaction"
	byte					"Encryption flag"
	hex 12				"dBaseIV multi-user"
	byte					"Production index exists"
	byte					"dBaseIV language option"
	read-only hex 2	"(always 0x00)"
end