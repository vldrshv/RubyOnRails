class Todo < ApplicationRecord
  belongs_to :project
  validates :title, presence: true,
                    length: { minimum: 1 }
end
