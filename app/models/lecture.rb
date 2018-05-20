class Lecture < ApplicationRecord
    acts_as_votable
    mount_uploader :attachment, AttachmentUploader
    belongs_to :course
    has_many :comments, dependent: :destroy
    has_many :spams
    has_many :users, :through => :spams
    
end
