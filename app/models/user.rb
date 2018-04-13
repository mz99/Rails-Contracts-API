class User < ApplicationRecord
has_secure_password
validates :full_name, presence: true
VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
validates :email, presence: true,
                  format: { with: VALID_EMAIL_REGEX },
                  uniqueness: { case_sensitive: false }
has_many :contracts, dependent: :destroy, autosave: true

end
