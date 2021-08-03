template "AFP Datastream"

// IBM's Advanced Function Presentation Datastream

description	"IBM's AFP Datastream, with x'5A' Structured Fields"

applies_to    file
fixed_start   00
requires      00 "5A"
big-endian
multiple

begin
  section                   "Introducer"
    read-only hex 1             "Carriage Control, 5A = AFP"
    uint16                      "SF Length"
  endsection

  section                   "Structured Field Data"
    hex 3                       "SF Identifier"
    move -3
    read-only hex 1             "> Class Code, D3 = MO:DCA"
    hex 1                       "> Type Code"
    hex 1                       "> Category Code"  
    binary                      "Flags (SFI Ext/Segmentation)"
    read-only hex 2             "Reserved"
  endsection

  section                   "Entire MOD:CA Record"
    move -8
    read-only hex "SF Length"   "AFP Record"
  endsection

end
