class User < ApplicationRecord
    has_many :user_lists
    has_many :lists, through: :user_lists
    has_many :recipes
    has_secure_password
end
