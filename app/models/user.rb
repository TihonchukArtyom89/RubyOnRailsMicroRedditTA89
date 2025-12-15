class User < ApplicationRecord
    self.primary_key = :id_user
    validates :login, presence: true, length {maximmum: 20}
end
