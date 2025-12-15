class Post < ApplicationRecord
    self.primary_key = :id_post
    belongs_to :user, primary_key: :id_user, foreign_key: :id_user
    validates :post, presence: true, length: {in: 10..50}
end
