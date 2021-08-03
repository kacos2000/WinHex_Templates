template "OLYMPUS WMA File Format"

// Template by Catalin GRIGORAS & Doug LACEY

description "Structure of an original OLYMPUS WMA audio file"
appliesto file

requires 0x00	"30 26 B2 75 8E 66 CF" 	// '0&≤uéfœ'
// requires 0x3A	"4F 00 4C 00 59 00 4D 00 50 00 55 00 53" 	// 'O.L.Y.M.P.U.S'
fixed_start 0x00

begin
	section	"WMA Structure"
		hex 6	"WMA File/Container Start (hex)"		// 00
		move -6
		read-only char[6]	"WMA File/Container Start (text)"		// 00
		move 52
		read-only char[13]	"Make"		// 00
		move 8
		read-only char[3]	"Codec"		// 00
		move 8
		read-only char[10]	"Model"		// 00
		move 16
		read-only char[12]	"Date START REC [yymmddhhmmss]"		// 00
		read-only char[12]	"Date STOP REC [yymmddhhmmss]"		// 00
		read-only char[6]	"Recording length [hhmmss]"		// 00
		move 66
		hex 1	"Sampling frequency"		// 00
		hex 1	"Bit rate"		// 00
		hex 1	"Channels"		// 00
		move 1169
		read-only char[100]	"WMA Audio Format"		// 00
		move 2
		hex 6	"WMA Audio Content Start (hex)"		// 00
		move -6
		read-only char[6]	"WMA Audio Content Start (text)"		// 00
	endsection
end
