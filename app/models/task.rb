class Task < ApplicationRecord 

  belongs_to :user

  validates :title, presence: true, uniqueness: true, length: { minimum:3, maximum:30 }
  validates :description, presence: true, uniqueness: true, length: { minimum:6, maximum:100 }

  def completed?
    !completed_at.blank?
  end
  
end
