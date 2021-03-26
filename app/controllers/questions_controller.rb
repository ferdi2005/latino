class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def question
    user_quizzes = current_user.user_quizzes.where(ended: false)
    if !user_quizzes.any?
      flash[:error] = "Non hai avviato alcun quiz!"
      redirect_to root_path
      return
    end

    @user_quiz = user_quizzes.last
    @user_answers = @user_quiz.user_answers
    
    questions_available = @user_quiz.quiz.questions.pluck(:id) - @user_answers.pluck(:question_id)

    if questions_available == []
      points = @user_answers.where(correct: true).sum(:points)
      total_points = @user_answers.sum(:points)
      current_user.update(points: current_user.points + points)
      @user_quiz.update(ended: true, end: DateTime.now, points: current_user.points + points)
      redirect_to quizzes_path and return
      flash[:success] = "Hai completato il quiz con #{points} punti su #{total_points}. Bravo!"
    else
      @question = Question.find(questions_available.sample)
      session[:question] = @question.id
    end
  end

  def send_question
    redirect_to root_path and return if params[:id].blank? && params[:surrender].blank?
    user_quiz = current_user.user_quizzes.where(ended: false).last
    if !params[:surrender].blank? && params[:surrender] == "true"
      user_quiz.update(ended: true, end: DateTime.now, points: 0, surrender: true)
      session.delete(:question)
      redirect_to quizzes_path and return
      flash[:success] = "Oh no! Ti sei arreso! Non avrai alcun punto."
    else
      question = Question.find(session[:question])
      session.delete(:question)
      answer = params[:id]
      user_answer = UserAnswer.new(question: question, user: current_user, index_value: answer, user_quiz: user_quiz)
      if answer.to_i.in?(question.correct_options)
        user_answer.correct = true
        user_answer.points = question.points
        flash[:success] = "Complimenti! La risposta è corretta. Hai guadagnato #{question.points} punti."
      else
        user_answer.correct = false
        user_answer.points = 0
        flash[:erorr] = "La risposta è sbagliata. Hai guadagnato zero punti."
      end

      user_answer.save
      redirect_to question_path
    end
  end
end
