template "DOS exe header"
description "Header of DOS executables (IMAGE_DOS_HEADER)"
requires 0 "4D 5A"
hexadecimal

// based on
// http://www.delorie.com/djgpp/doc/exe/
// http://www.tavi.co.uk/phobos/exeformat.html

// 2017 fenugrec

begin
read-only uint16	signature
uint16	bytes_in_last_page
uint16	pages_in_file
uint16	num_relocs
uint16	header_paragraphs
uint16	min_extra_paragraphs
uint16	max_extra_paragraphs
uint16	initial_ss
uint16	initial_sp
uint16	cks
uint16	initial_ip
uint16	intial_cs
uint16	reloc_table_offset
uint16	overlay_number
end