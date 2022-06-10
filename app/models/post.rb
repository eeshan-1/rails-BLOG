class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
    validates :category, presence: true
    validates :image, presence: true

    belongs_to(
        :user,
        class_name: 'User',
        foreign_key: 'user_id',
        inverse_of: :posts
      )
end