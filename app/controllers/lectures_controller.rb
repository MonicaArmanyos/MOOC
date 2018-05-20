class LecturesController < InheritedResources::Base
  before_action :authenticate_user!
  layout 'nav'

  load_and_authorize_resource
  rescue_from CanCan::AccessDenied do |exception|
    flash[:warning] = exception.message
    redirect_to courses_url
  end
  respond_to :js, :json, :html
  def new
    @course = Course.find(params[:course_id])
    @lecture = Lecture.new
  end
  def create
    @course = Course.find(params[:course_id])
    @lecture = @course.lectures.new(lecture_params)
    @lecture.save
  

    redirect_to course_url(@course.id)
  end
  def edit
    @course = Course.find(params[:course_id])
   
  end
  def show
    @course = Course.find(params[:course_id])
    @lecture = Lecture.find(params[:id])
   
    @comment= Comment.new
  end

  def update
    @course = Course.find(params[:course_id])
    @lecture = Lecture.find(params[:id])
   @lecture.update lecture_params
   redirect_to course_lecture_url(@course.id, @lecture.id)
  end
  def destroy
    @course = Course.find(params[:course_id])
    @lecture = Lecture.find(params[:id])
    @lecture.destroy
   redirect_to course_url(@course.id)
  end

  def vote
    if !current_user.liked? @lecture
      @lecture.liked_by current_user
    elsif current_user.liked? @lecture
      @lecture.unliked_by current_user
    end
  end

  def spam
    @course = Course.find(params[:course_id])
    @lecture = Lecture.find(params[:id])
    @spam= Spam.where("user_id ="+current_user.id.to_s+" AND lecture_id ="+ @lecture.id.to_s)
    if !@spam.any? 
      @spam = Spam.new({:user_id =>current_user.id, :lecture_id => @lecture.id})
      @spam.save
      flash[:spam]="Marked as spam"
    else
      flash[:spam]= "Already marked as spam"
    end 
    redirect_to course_lecture_url(@course.id, @lecture.id)
  end
  private

    def lecture_params
      params.require(:lecture).permit(:content, :attachment)
    end
end

