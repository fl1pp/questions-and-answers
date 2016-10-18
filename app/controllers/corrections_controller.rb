class CorrectionsController < ApplicationController
  before_action :set_question
  before_action :set_answer
  before_action :set_correction, only: [:show, :edit, :update, :destroy]

  # GET /corrections
  # GET /corrections.json
  def index
    @corrections = Correction.all
  end

  # GET /corrections/1
  # GET /corrections/1.json
  def show
  end

  # GET /corrections/new
  def new
    @correction = Correction.new
  end

  # GET /corrections/1/edit
  def edit
  end

  # POST /corrections
  # POST /corrections.json
  def create
    @correction = current_user.corrections.new(correction_params)
    @correction.answer = @answer
    @correction.answer.question = @question
    respond_to do |format|
      if @correction.save
        format.html { redirect_to root_path }
        format.json { render :show, status: :created, location: @correction }
      else
        format.html { render :new }
        format.json { render json: @correction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /corrections/1
  # PATCH/PUT /corrections/1.json
  def update
    respond_to do |format|
      if @correction.update(correction_params)
        format.html { redirect_to @correction }
        format.json { render :show, status: :ok, location: @correction }
      else
        format.html { render :edit }
        format.json { render json: @correction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /corrections/1
  # DELETE /corrections/1.json
  def destroy
    @correction.destroy
    respond_to do |format|
      format.html { redirect_to corrections_url }
      format.json { head :no_content }
    end
  end

  private
    def set_question
      @question = Question.find(params[:question_id])
    end

    def set_answer
      @answer = Answer.find(params[:answer_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_correction
      @correction = Correction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def correction_params
      params.require(:correction).permit(:content)
    end
end
