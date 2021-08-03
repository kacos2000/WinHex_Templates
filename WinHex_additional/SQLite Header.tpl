template "SQLite Header"

// Template by Terrance Maguire
// terrance.maguire@gmail.com
// Version 1.5 - 20180320

// Every SQLite file starts with the header record.
// The Database Header is 100 Bytes in Length
// This template follows Database Header Format from www.SQLite.org
// Select the File Mode in XWF

description "SQLite - Header Record"
fixed_start 0
requires 0 "53514C69746520666F726D6174203300"
big-endian
read-only
begin
   hex 16	        "SQLite Format 3 Header"			//00
	uint16				"Page Size in Bytes"		                    //16
	uint8				"Write Version (1 Journal 2 WAL >2 RO)"	//18
	uint8				"Read Version (1 Journal 2 WAL)"	//19
	move 4
	uint32				"File Change Counter (not used by WAL)" //24
	uint32           "Size of Database File in Pages"        //28
	uint32				"First Freelist Trunk Page"        //32
	uint32              "Total Freelist Pages"            //36
	move 4
	uint32             "Schema Format Number"   //44
	move 4
	uint32				"Auto vacuum largest b-tree page"	//52
	uint32              "Database Text Encoding"              //56
	move 4
	uint32              "Incremental vacuum mode (zero=no)" //64
	uint32              "Application ID"                        //68
	move 20
   uint32              "Version-Valid-for-Number"            //92
	uint32              "SQLite Version Number"               //96
end