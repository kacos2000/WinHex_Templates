template "PCAP-file"

// Template by Frank Weiss
// Federal Judicial Police BELGIUM - RCCU OVL

// To be applied to a PCAP-file

description "PCAP-file"
applies_to file
fixed_start 00
requires 0x00	"D4 C3 B2 A1" 					// magic number


begin
	section             "Global PCAP-header"
	hex 4               "Magic number"
	uint16              "Major version"		
	uint16              "Minor version"
	uint32              "UTC minus timezone used in the headers (sec)"
	uint32              "Accuracy of timestamp"
	uint32              "Maximum length of captured packets (bytes)"
	uint32              "Link-Layer Header Type"
	endsection
	
	{
	section             "Packet header & data"
	uint32              "Unix Epoch (sec)"
	move -4
	UNIXDateTime        "Unix Epoch"
	uint32              "Microseconds"
	uint32              "Packetsize on file (bytes)"
	uint32              "Packetsize on the wire (bytes)"
	hex "Packetsize on file (bytes)"         "Data"
	} [unlimited]
	
end