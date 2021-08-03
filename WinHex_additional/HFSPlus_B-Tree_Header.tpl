template "HFS+ B-Tree Header"
description "To be applied to the beginning of a B-Tree file"

//Template by Jens Kirschner, 2009


applies_to disk
sector-aligned
Big-Endian

begin
	section "Node Descriptor"
	   UInt32    "NextNode"
	   UInt32    "PreviousNode"
    	   Int8      "NodeType"
    	   UInt8     "HeightInTree"
    	   UInt16    "NumRecords"
    	   hex 2     "reserved"

	section "Header Record"
	   UInt16    "TreeDepth"
    	   UInt32    "RootNode"
    	   UInt32    "LeafRecords"
    	   UInt32    "FirstLeafNode"
    	   UInt32    "LastLeafNode"
    	   UInt16    "NodeSize"
    	   UInt16    "MaxKeyLength"
    	   UInt32    "TotalNodes"
   	   UInt32    "FreeNodes"
    	   hex 2     "reserved"
    	   UInt32    "ClumpSize"
    	   UInt8     "BTreeType"
    	   hex 1     "KeyCompareType"  //CF: Case Fold (case-insensitive); BC: Binary Compare (case-sensitive, HFSX only)
    	   hex 4     "attributes"
	   {
    	      hex 16    "reserved"
	   }[4]

	section "User Data Record"
	   {
    	      hex 16    "reserved"
	   }[8]

	section "Map Record"
	   {
    	      hex 16    "BitmapFirst256B"  //The Map Record is of varying size! I just fixed this to 256 Bytes for simplicity.
	   }[16]
end