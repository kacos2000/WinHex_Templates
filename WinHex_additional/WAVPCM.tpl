template "WAV PCM File Format"

// Template by Khomenko Volodymyr, Ukraine.

description "Structure of a simple WAV-PCM (unpacked) audio file"
appliesto file

requires 0x00	"52 49 46 46" 	// 'RIFF'
requires 0x08	"57 41 56 45" 	// 'WAVE'
requires 0x0C	"66 6d 74 20" 	// 'fmt '

begin
	section	"RIFF block"
		read-only char[4]	"RIFF_ID"		// 00
		uint32	"Data size(filesize-8)"			// 04
		read-only char[4]	"RIFF_FORMAT"		// 08
	endsection

	section	"FMT block"
		read-only char[4]	"FMT_ID"		// 0C
		uint32	"FMT_SIZE"				// 10
		uint16	"wFormatTag"				// 14
		uint16	"nChannels"				// 16
		uint32	"nSamplesPerSec"			// 18
		uint32	"nAvrgBytesPerSec"			// 1C
		uint16	"nBlockAlign"				// 20
		uint16	"wBitsPerSample"			// 22

		// Skip bytes till begin of next block (in case of FMT_SIZE>16)
		move FMT_SIZE
		move -16
	endsection

	section	"DATA block"	
		read-only char[4]	"DATA_ID"
		uint32	"DATA_SIZE"
	endsection
end
