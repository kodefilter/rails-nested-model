class PapersController < ApplicationController
  def index
    @papers = Paper.all
  end

  def show
    @paper = Paper.find(params[:id])
  end

  def new
    @paper = Paper.new
    3.times do
      question = @paper.questions.build
      4.times { question.answers.build }
    end
  end

  def create
    @paper = Paper.new(paper_params)
    if @paper.save
      redirect_to @paper, :notice => "Successfully created paper."
    else
      render :action => 'new'
    end
  end

  def edit
    @paper = Paper.find(params[:id])
  end

  def update
    @paper = Paper.find(params[:id])
    if @paper.update_attributes(paper_params)
      redirect_to @paper, :notice  => "Successfully updated paper."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @paper = Paper.find(params[:id])
    @paper.destroy
    redirect_to papers_url, :notice => "Successfully destroyed paper."
  end
  
  private
  
  def paper_params
    params.require(:paper).permit(:subject,:grade,:year,:_destroy, questions_attributes: [:id, :paper_id, :content, :_destroy, answers_attributes: [:id, :question_id, :content, :_destroy ]])
  end
  
end
