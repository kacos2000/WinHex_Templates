template "BMP File Format (with Palette)"

// Template by Khomenko Volodymyr, Ukraine.

description "Structure of a BMP image file"
appliesto file

requires 0x00	"42 4D" 	// 'BM'

begin
	section	"BMP File Header"
		read-only char[2]	"BMP_ID"		// 00
		uint32	"File size"				// 02
		uint32	"Reserved"				// 06
		uint32  "ImageDataOffset"			// 0A
	endsection

	section	"BMP Info Header"
		uint32	"HeaderSize"				// 0E
		uint32	"Width"					// 12
		uint32	"Height"				// 16
		uint16	"Planes"				// 1A
		uint16	"BPP"					// 1C
		uint32	"CompessionMethod"			// 1E
		uint32	"ImageSize"				// 22
		uint32	"XPixelsPerMeter"			// 26
		uint32	"YPixelsPerMeter"			// 2A
		uint32	"PaletteSize"				// 2E
		uint32	"ColorsImportant"			// 32
	endsection

	section	"Palette(If PaletteSize=0 then no palette)"
		numbering 0

		{
			byte "B[~]"
			byte "G[~]"
			byte "R[~]"
			byte "A[~]"

		} [PaletteSize]
	endsection
end
