class Course < ApplicationRecord
    validates :title, presence: true
    has_many :lectures, dependent: :destroy
end
