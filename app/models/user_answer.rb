class UserAnswer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  belongs_to :user_quiz
end
