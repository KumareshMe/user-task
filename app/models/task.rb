class Task < ApplicationRecord 

  belongs_to :user
  validates :title, presence: true, length: { minimum:3, maximum:100 }
  validates :description, presence: true, length: { minimum:6, maximum:300 }

  def completed?
    !completed_at.blank?
  end
  
end
