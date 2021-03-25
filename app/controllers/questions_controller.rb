class QuestionsController < ApplicationController
  before_action :user_signed_in?

  def question
    user_quizzes = current_user.user_quizzes.where(ended: false)
    unless user_quizzes.any?
      redirect_to root_path
      flash[:error] = "Non hai avviato alcun quiz!"
    end

    @quiz = user_quizzes.last.quiz
  end
end
