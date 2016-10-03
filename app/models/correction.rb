class Correction < ApplicationRecord
	belongs_to :answer
	belongs_to :user
end
