class PagesController < ApplicationController
  def home
    @study = Study.all.sample 
    @studies = Study.all.shuffle
    if user_signed_in?
      suitable_quizzes = Quiz.find(Quiz.ids - current_user.user_quizzes.where(surrender: false).pluck(:quiz_id))
    else
      suitable_quizzes = Quiz.all
    end
    @quizzes = suitable_quizzes.shuffle
  end

  def classifica
  end
end
