class StudentsController < ApplicationController
  before_action :find, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(params.require(:student).permit(:first_name, :last_name, :date_of_birth, :department, :terms_of_usage))
    if @student.valid?
      redirect_to faculties_path
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to new_student_path
    end
  end

  def show  
  end

	def edit 
  end

  def update
    
    @student = @student.update(params.require(:student).permit(:first_name, :last_name, :date_of_birth, :department, :terms_of_usage))
    redirect_to faculties_path
   
  end

  def destroy
    @student.destroy
    redirect_to faculties_path
  end
  def find
    @student = Student.find(params[:id])
  end
end
