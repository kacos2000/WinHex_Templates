template "Reiser4 Item Header (Large Keys)"

// Created by Jens Kirschner

// X-Ways Software Technology AG

// The internal tree nodes of Reiser4 contain as many items as stated
// in the appropriate field of the node header. Each item then possesses
// an item header, located at the END of the node!

// This is the item header defined by Reiser4 Format40, which is the
// currently only format definition


description "Item Header for Format40 of Reiser4, using large keys"
//applies_to disk
multiple

begin
	//due to uint_flex's limitation to 32-bit integers, only the first
	//28 bits of the Locality and the first 32 bits of the Object ID
	//can be displayed in detail - this is rarely an issue, though.

	int64 "Key: Locality"
	move -8 //Locality in more detail
	uint_flex "31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4" "Parent ID/Major Locality (28-bit)"
	move -4
	uint_flex "3,2,1,0" "Type/Minor Locality"
	move 4

	//Ordering: The only component missing for the "small key" variant
	int64 "Key: Ordering"
	
	int64 "Key: Object ID"
	move -8 //Object ID in more detail

	uint32 "Object ID (32-bit)"
	uint_flex "31,30,29,28" "Controversial Band"


	int64 "Key: Offset"

	uint16 "Item body offset"
	uint16 "Flags"
	uint16 "Plugin ID"
end