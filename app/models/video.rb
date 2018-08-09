class Video < ApplicationRecord
	validates :group_id, {presence: true}
	
	# ユーザーのIDから、対応するユーザーのレコードを取得する
	def user
		return User.find_by(id: self.user_id)
	end
end
