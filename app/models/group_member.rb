class GroupMember < ApplicationRecord
	
	def fetch_group
		return Group.find_by(id: self.group_id)
	end

end
