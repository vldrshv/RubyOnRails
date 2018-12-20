class Project < ApplicationRecord
	has_many :todos
	validates :title, presence: true,
                    length: { minimum: 1 }
end
