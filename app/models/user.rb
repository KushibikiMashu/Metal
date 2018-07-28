class User < ApplicationRecord
  # has_secure_password

  validates :name, {presence: true}
  # お試しなのでメールアドレスは利用しない
  # validates :email, {presence: true, uniqueness: true}

end