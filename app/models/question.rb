class Question < ApplicationRecord
    belongs_to :quiz
    has_many :user_answers
end
