template "SHD spool shadow file"

// Costas Katsavounidis - 2021 v1.0
// kacos2000 [at] gmail.com
// https://github.com/kacos2000

// To be applied on byte 0 of a .SHD spool shadow file

description "Windows - SHD spool shadow file"
applies_to file
read-only

// Reference: https://www.codeproject.com/Articles/9720/The-Windows-NT-print-spool-shadow-file-format

begin
    section "SHD - Microsoft Windows Spool Shadow File"
    hex 4  "Signature"
    move -4
    ifEqual Signature 0x23510000
        big-endian hexadecimal uint32 "=> Windows 10"
        uint32 "Header Size (bytes)"
        hexadecimal uint16 "Status Flags (hex)"
        move 2 // unknown
        uint32 "Print Job ID"
        uint32 "Priority (99 highest)" // values: 1-99
        // offsets
        move 4
        uint32 "Username_offset"
        move 4
        uint32 "NotifyName_offset"
        move 4
        uint32 "DocumentName_offset"
        move 4
        uint32 "PrinterPort_offset"
        move 4
        uint32 "PrinterName_offset"
        move 4
        uint32 "DriverName_offset"
        move 4
        uint32 "DevMode_offset"
        move 4
        uint32 "PrintProcessorName_offset"
        move 4
        uint32 "DataType_offset"
        move 12
    else
    ifEqual Signature 0x4B490000
        big-endian hexadecimal uint32 "=> Windows 98"
        hexadecimal uint16 "Status Flags (hex)"
        move 2 // unknown
        uint32 "Print Job ID"
        uint32 "Priority (99 highest)" // values: 1-99
        // offsets
        uint32 "Username_offset"
        uint32 "NotifyName_offset"
        uint32 "DocumentName_offset"
        uint32 "PrinterPort_offset"
        uint32 "PrinterName_offset"
        uint32 "DriverName_offset"
        uint32 "DevMode_offset"
        uint32 "PrintProcessorName_offset"
        uint32 "DataType_offset"
        move 4
    else
    ifEqual Signature 0x66490000
        big-endian hexadecimal uint32 "=> Windows NT"
        hexadecimal uint16 "Status Flags (hex)"
        move 2 // unknown
        uint32 "Print Job ID"
        uint32 "Priority (99 highest)" // values: 1-99
        // offsets
        uint32 "Username_offset"
        uint32 "NotifyName_offset"
        uint32 "DocumentName_offset"
        uint32 "PrinterPort_offset"
        uint32 "PrinterName_offset"
        uint32 "DriverName_offset"
        uint32 "DevMode_offset"
        uint32 "PrintProcessorName_offset"
        uint32 "DataType_offset"
        move 4
    else
    ifEqual Signature 0x67490000
        big-endian hexadecimal uint32 "=> Win2000/XP"
        uint32 "Header Size (bytes)"
        hexadecimal uint16 "Status Flags (hex)"
        move 2 // unknown
        uint32 "Print Job ID"
        uint32 "Priority (99 highest)" // values: 1-99
        // offsets
        uint32 "Username_offset"
        uint32 "NotifyName_offset"
        uint32 "DocumentName_offset"
        uint32 "PrinterPort_offset"
        uint32 "PrinterName_offset"
        uint32 "DriverName_offset"
        uint32 "DevMode_offset"
        uint32 "PrintProcessorName_offset"
        uint32 "DataType_offset"
        move 4
    else
    ifEqual Signature 0x68490000
        big-endian hexadecimal uint32 "=> Windows 2003"
        uint32 "Header Size (bytes)"
        hexadecimal uint16 "Status Flags (hex)"
        move 2 // unknown
        uint32 "Print Job ID"
        uint32 "Priority (99 highest)" // values: 1-99
        // offsets
        uint32 "Username_offset"
        uint32 "NotifyName_offset"
        uint32 "DocumentName_offset"
        uint32 "PrinterPort_offset"
        uint32 "PrinterName_offset"
        uint32 "DriverName_offset"
        uint32 "DevMode_offset"
        uint32 "PrintProcessorName_offset"
        uint32 "DataType_offset"
        move 4
    endIf
   
    uint16 "Year"
    uint16 "Month"
    uint16 "Day of Week"
    uint16 "Day"
    uint16 "Hour (UTC)"
    uint16 "Minute"
    uint16 "Second"
    uint16 "Millisecond"
    move 8
    uint32 "SPL FileSize (bytes)"
    uint32 "SPL PageCount"
    goto DataType_offset
    string16 6 "SPL Data type"
    endSection

    section "Metadata"
    ifGreater "Username_offset" 0
        goto "Username_offset"
        string16 (NotifyName_offset-Username_offset) "Username"
    endIf
    ifGreater "NotifyName_offset" 0
        goto "NotifyName_offset"
        string16 (DocumentName_offset-NotifyName_offset) "Notifyname"
    endIf
    ifGreater "DocumentName_offset" 0
        goto "DocumentName_offset"
        string16 (PrinterName_offset-DocumentName_offset) "Document Name"
    endIf
    ifGreater "PrinterName_offset" 0
        goto "PrinterName_offset"
        string16 (DriverName_offset-PrinterName_offset) "Printer Name"
    endIf
    ifGreater "DriverName_offset" 0
        goto "DriverName_offset"
        string16 (PrintProcessorName_offset-DriverName_offset) "Driver Name"
    endIf
    endSection
end