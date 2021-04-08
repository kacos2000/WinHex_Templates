template "ETL Header (x64)"

// Template by Gabriele Zambelli (@gazambelli)
// Version 1.0 - 20181227

// https://docs.microsoft.com/en-us/windows/desktop/etw/eventtrace-header
// https://docs.microsoft.com/en-us/windows/desktop/etw/trace-logfile-header

// https://en.wikipedia.org/wiki/List_of_Microsoft_Windows_versions
// https://en.wikipedia.org/wiki/Windows_10_version_history
// https://windows10dll.nirsoft.net/tzres_dll.html

description "Header of .ETL log files created on a 64-bit OS"

applies_to file
read-only
fixed_start 0x80 //'aa' or 'Zb'

begin
		move -24
	section	"Event Trace Log Header (x64)"
		uint32     "BufferSize (Bytes)"
		uint8      "OS MajorVersion"
		uint8      "OS MinorVersion"
		move 2
		uint32     "OS Build Number"
		uint32     "NumberOfProcessors"
		FileTime   "EndTime (UTC)"
		uint32     "TimerResolution"
		uint32     "MaxFileSize (MB)"
		uint32     "LogFileMode"
		uint32     "BuffersWritten"
		uint32     "StartBuffers"
		uint32     "PointerSize"
		uint32     "EventsLost"
		uint32     "CPUSpeed (MHz)"
		int64      "LoggerName: pointerValue"
		int64      "LogFileName: pointerValue"
		move 4
		zstring16  "TimeZoneInformation"
		gotoex 0x80
		move 224
		FileTime   "BootTime (UTC)"
		int64      "PerfFreq"
		FileTime   "StartTime (UTC)"
		uint32     "ReservedFlags"
		uint32     "BuffersLost"
		zstring16  "SessionNameString"
		zstring16  "LogFileNameString"
	endsection

end
