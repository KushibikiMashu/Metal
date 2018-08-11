class GroupUser < ApplicationRecord
	# グループのIDから、対応するグループのレコードを取得する
	def fetch_group
		return Group.find_by(id: self.group_id)
	end
end
