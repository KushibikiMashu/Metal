class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  	# グループのIDから、対応するグループのレコードを取得する
	def fetch_group
		return Group.find_by(id: self.group_id)
	end

	def fetch_groups_of_user
		return Video.where(group_id: self.group_id)
	end
end
