class Task < ActiveRecord::Base
 validates :completed, presence: true
 validates :body, presence: true
 validates :position, presence: true
end
