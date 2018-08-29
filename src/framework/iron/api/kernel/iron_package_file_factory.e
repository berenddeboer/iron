note
	description: "Summary description for {IRON_PACKAGE_FILE_FACTORY}."
	date: "$Date: 2015-12-29 12:57:12 +0100 (mar., 29 déc. 2015) $"
	revision: "$Revision: 98336 $"

class
	IRON_PACKAGE_FILE_FACTORY

feature -- Factory

	new_package_file (fn: PATH): IRON_PACKAGE_FILE
		local
			pf: IRON_PACKAGE_INFO_FILE
		do
			create pf.make_from_path (fn)
			Result := pf
			if Result.has_error then
				create {IRON_PACKAGE_INI_FILE} Result.make_from_path (fn)
				if Result.has_error then
						-- Better take the expected format with error, rather than old format with error.
					Result := pf
				end
			end
		end

	new_package_info_file_from_text (fn: PATH; a_text: READABLE_STRING_8): IRON_PACKAGE_INFO_FILE
		do
			create Result.make_from_text (fn, a_text)
		end

note
	copyright: "Copyright (c) 1984-2015, Eiffel Software"
	license: "GPL version 2 (see http://www.eiffel.com/licensing/gpl.txt)"
	licensing_options: "http://www.eiffel.com/licensing"
	copying: "[
			This file is part of Eiffel Software's Eiffel Development Environment.
			
			Eiffel Software's Eiffel Development Environment is free
			software; you can redistribute it and/or modify it under
			the terms of the GNU General Public License as published
			by the Free Software Foundation, version 2 of the License
			(available at the URL listed under "license" above).
			
			Eiffel Software's Eiffel Development Environment is
			distributed in the hope that it will be useful, but
			WITHOUT ANY WARRANTY; without even the implied warranty
			of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
			See the GNU General Public License for more details.
			
			You should have received a copy of the GNU General Public
			License along with Eiffel Software's Eiffel Development
			Environment; if not, write to the Free Software Foundation,
			Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
		]"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"
end