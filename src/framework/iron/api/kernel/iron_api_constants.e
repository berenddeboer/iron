note
	description: "Summary description for {IRON_API_CONSTANTS}."
	author: ""
	date: "$Date: 2013-05-23 22:01:55 +0200 (jeu., 23 mai 2013) $"
	revision: "$Revision: 92586 $"

class
	IRON_API_CONSTANTS

feature -- Access

	iron_variable_name: STRING = "IRON_PATH"

	version_variable_name: STRING = "IRON_VERSION"

feature -- Version	

	major: NATURAL_16 = 0

	minor: NATURAL_16 = 1

	built: STRING = "0006"

	version: IMMUTABLE_STRING_8
		local
			s: STRING
		once
			create s.make (10)
			s.append_natural_16 (major)
			s.append_character ('.')
			s.append_natural_16 (minor)
			s.append_character ('.')
			s.append (built)

			create Result.make_from_string (s)
		end

end
