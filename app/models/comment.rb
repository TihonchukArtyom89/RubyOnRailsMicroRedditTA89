class Comment < ApplicationRecord
    self.primary_key = :id_comment
    belongs_to :user, primary_key: :id_user, foreign_key: :id_user
    belongs_to :post, primary_key: :id_post, foreign_key: :id_post
    belongs_to :parent, class_name: 'Comment', primary_key: :id_comment, foreign_key: :id_parent_comment, optional: true
    has_many :children, class_name: 'Comment', primary_key: :id_comment, foreign_key: :id_parent_comment, dependent: :destroy
    validates :comment, presence: true, length: {in: 5..30}
    scope :roots, -> { where(id_parent_comment: nil) }
end
