class QuizzesController < ApplicationController
  before_action :set_quiz, only: %i[ show edit update destroy ]
  before_action :authenticate_user!


  def create_user_quiz
    quiz = Quiz.find(params[:id])
    if current_user.user_quizzes.where(quiz: quiz, surrender: false).any?
      flash[:error] = "Hai già completato questo quiz!"
      redirect_to quizzes_path and return
    elsif current_user.user_quizzes.where(ended: false).any?
      flash[:error] = "Hai già un quiz attivo! Termina quello prima di avviarne un altro."
      redirect_to question_path and return
    else
      UserQuiz.create(quiz: quiz, user: current_user)
      redirect_to question_path and return
    end
  end

  # GET /quizzes or /quizzes.json
  def index
    suitable_quizzes = Quiz.find(Quiz.ids - current_user.user_quizzes.where(surrender: false).pluck(:quiz_id))
    @quizzes = suitable_quizzes.shuffle
    @quiz = suitable_quizzes.sample
  end

  # GET /quizzes/1 or /quizzes/1.json
  def show
  end

  # GET /quizzes/new
  def new
    @quiz = Quiz.new
  end

  # GET /quizzes/1/edit
  def edit
  end

  # POST /quizzes or /quizzes.json
  def create
    @quiz = Quiz.new(quiz_params)

    respond_to do |format|
      if @quiz.save
        format.html { redirect_to @quiz, notice: "Quiz was successfully created." }
        format.json { render :show, status: :created, location: @quiz }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizzes/1 or /quizzes/1.json
  def update
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to @quiz, notice: "Quiz was successfully updated." }
        format.json { render :show, status: :ok, location: @quiz }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/1 or /quizzes/1.json
  def destroy
    @quiz.destroy
    respond_to do |format|
      format.html { redirect_to quizzes_url, notice: "Quiz was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quiz_params
      params.require(:quiz).permit(:title, :description)
    end
end
