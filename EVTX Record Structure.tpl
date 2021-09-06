Template "EVTX Record Structure"

// Costas Katsavounidis - 2021 v.1
// kacos2000 [at] gmail.com
// https://github.com/kacos2000

description "EVTX Record Structure"
// Ref: https://svch0st.medium.com/event-log-tampering-part-2-manipulating-individual-event-logs-3de37f7e3a85

read-only
multiple
requires 0 "2A2A00"

begin
Section "EVTX Record Header"
    hex 4  "Signature" //Must be 0x2A2A00
    uint32 "Record_Size"
    int64 "Record ID"
    FileTime "Record Timestamp"
endSection

Section "EVTX Record XML"
    hex (Record_Size-28) "Record (Binary XML)"
endSection
Section "EVTX Record Footer"
    uint32 "Record Size (Copy)"
endSection
end