template "dbf sample data record"

// Sample template by Paul Mullen, pcguru@the-answer.com

description "applies to states.dbf"

appliesto file

multiple

begin
	char[1]				"*=deleted"
	char[12]				"Area"
	char[25]				"State Name"
	char[2]				"FIPS"
	char[7]				"Region"
	char[2]				"Abbreviation"
	char[10]				"Pop 1990"
	char[10]				"Pop 1996"
end
