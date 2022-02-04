class FacultiesController < ApplicationController
  before_action :find, only: [:show, :edit, :update, :destroy]

  def index
    @faculties = Faculty.all
    @students = Student.all
  end

  def new
    @faculty = Faculty.new
  end

  def create
    @faculty = Faculty.create(params.require(:faculty).permit(:first_name, :last_name, :date_of_birth, :phone, :email, :designation))
    if @faculty.valid?
      redirect_to faculties_path
    else
      flash[:errors] = @faculty.errors.full_messages
      redirect_to new_faculty_path
    end
  end

  def show
  end

  def edit
  end

  def update
    # byebug
    @faculty = Faculty.update(params.require(:faculty).permit(:first_name, :last_name, :date_of_birth, :phone, :email, :designation))
    redirect_to faculty_path
  end

  def destroy
    
    @faculty.destroy
    redirect_to faculties_path
  end
end
def find
  @faculty = Faculty.find(params[:id])
end