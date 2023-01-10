class StudentsController < ApplicationController
  def index
    students = if params[:name]
      Student.where("first_name  LIKE :name or last_name LIKE :name", name:params[:name] ) 
               else
                 Student.all
               end    
    render json: students
  # def index
  #   students = Student.all
  #   include_json([
  #         {  last_name: 'Johnson' }
  #       ])
  
  #   render json: students
  end
#   students = if params[:name]
#     Student.all.filter{|student| student.first_name == params[:name] or  student.last_name == params[:name]}
#   else
#     Student.all
#   end    
# render json: students

  # def show
  #   student = Students.find_by(params[:id])
  #   if student render json: student
  #   else null
  #   end
  def show 
    student = Student.find(params[:id])
    render json: student
  end

end
