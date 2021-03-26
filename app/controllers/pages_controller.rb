class PagesController < ApplicationController
  def home
    @study = Study.all.sample 
    @studies = Study.all.shuffle
    suitable_quizzes = Quiz.find(Quiz.ids - current_user.user_quizzes.where(surrender: false).pluck(:quiz_id))
    @quizzes = suitable_quizzes.shuffle
  end

  def classifica
  end
end
