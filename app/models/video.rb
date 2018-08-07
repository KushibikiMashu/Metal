class Video < ApplicationRecord
	validates :group_id, {presence: true}
	
	# ユーザーのIDから、対応するユーザーのレコードを取得する
	def user
		return User.find_by(id: self.user_id)
	end

	def fetch_groups_of_users
		return Video.where(group_id: self.group_id)
	end
end
