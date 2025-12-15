class User < ApplicationRecord
    self.primary_key = :id_user
    has_many :posts, foreign_key: :id_user
    validates :login, presence: true, length: {maximum: 20}
end
