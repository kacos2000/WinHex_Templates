template "HFS+ Index Node"
description "To be applied to the beginning of an index node in a HFS+ special file"

//Template by Jens Kirschner, 2009

applies_to disk
sector-aligned
Big-Endian

begin
	section "Node Descriptor"
	   UInt32    "NextNode"
	   UInt32    "PreviousNode"
    	Int8     "NodeType"
    	UInt8     "HeightInTree"
    	UInt16    "NumRecords"
    	hex 2     "reserved"

	section "First Pointer"
		UInt16	keyLength
		UInt32	parentID
		UInt16	NameLen    
		String16	NameLen Name
		UInt32	NodeNumber

end