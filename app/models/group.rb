class Group < ApplicationRecord
	validates :group_name, {presence: true}

  def self.search(search)
  	if search != nil || search != ''
      Group.where(['group_name LIKE ?', "%#{search}%"]).order(created_at: :desc)
    end
  end

  # グループのIDから、対応するグループのレコードを取得する
  def fetch_group_user
    return GroupUser.find_by(group_id: self.id)
  end
end
