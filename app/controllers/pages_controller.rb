class PagesController < ApplicationController
  def home
    @study = Study.all.sample 
    @studies = Study.all.shuffle
    @quizzes = Quiz.all.shuffle
  end

  def classifica
  end
end
