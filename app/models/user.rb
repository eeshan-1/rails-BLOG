class User < ApplicationRecord
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :name, presence: true
    validates :password, presence: true

    has_many(
        :posts,
        class_name: 'Post',
        foreign_key: 'user_id',
        inverse_of: :user,
        dependent: :destroy
      )
end