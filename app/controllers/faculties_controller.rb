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
      flash[:notice] = "Faculty is successfully added."
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
    if (@faculty.update(params.require(:faculty).permit(:first_name, :last_name, :date_of_birth, :phone, :email, :designation)))
      redirect_to faculties_path  
    else
      flash[:errors] = @faculty.errors.full_messages
      redirect_to edit_faculty_path
    end
  end

  def destroy
    
    @faculty.destroy
    redirect_to faculties_path
  end

  def find
    @faculty = Faculty.find(params[:id])
  end
end