class Task < ActiveRecord::Base
 validates :completed, inclusion: [true, false]
 validates :body, presence: true
 validates :position, presence: true, uniqueness: true

 scope :completed, -> { where(completed: true) }
end
