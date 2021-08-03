template "NTFS Data Runs"

//template by Jens Kirschner
//X-Ways Software Technology AG

description "To be applied to beginning of data runs"
applies_to disk

begin

{
	uint_flex "3,2,1,0" "ClusterCountSize"
	move -4
	uint_flex "7,6,5,4" "ClusterStartSize"
	move -3

	ifequal ClusterCountSize 0
		ExitLoop
	endif

	ifGreater ClusterCountSize 4
		section "Unsupported value in Data Run"
		ExitLoop
	endif

	ifGreater ClusterStartSize 4
		section "Unsupported value in Data Run"
		ExitLoop
	endif

	ifequal ClusterCountSize 1
		int8 ClusterCount
	endif

	ifequal ClusterCountSize 2
		int16 ClusterCount
	endif

	ifequal ClusterCountSize 3
		int24 ClusterCount
	endif

	ifequal ClusterCountSize 4
		int32 ClusterCount
	endif


	ifequal ClusterStartSize 0
		section "(sparse or compressed)"
		endsection
	endif

	ifequal ClusterStartSize 1
		int8 ClusterStart
	endif

	ifequal ClusterStartSize 2
		int16 ClusterStart
	endif

	ifequal ClusterStartSize 3
		int24 ClusterStart
	endif

	ifequal ClusterStartSize 4
		int32 ClusterStart
	endif

	endsection

}[150]  //arbitrary end to avoid infinite loops

end