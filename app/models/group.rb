class Group < ApplicationRecord
	validates :group_name, {presence: true}

  def self.search(search)
  	if search != nil || search != ''
      Group.where(['group_name LIKE ?', "%#{search}%"]).order(created_at: :desc)
    end
  end
end
