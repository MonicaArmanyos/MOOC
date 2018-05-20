class CommentsController < InheritedResources::Base
  before_action :authenticate_user!

  def create
    @course = Course.find(params[:course_id])
    @lecture =Lecture.find(params[:lecture_id])
    @user=User.find(current_user.id)
    @comment = @lecture.comments.new(comment_params)
    @comment.save
      redirect_to course_lecture_url(@course.id, @lecture.id)
   
  end
  def destroy
    @course = Course.find(params[:course_id])
    @lecture = Lecture.find(params[:lecture_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to course_lecture_url(@course.id, @lecture.id)
  end
 #def new
 # @course = Course.find(params[:course_id])
 # @lecture =Lecture.find(params[:lecture_id])
 # @comment=Comment.new
 #end
  private

    def comment_params
      params.require(:comment).permit(:text,:lecture_id,:user_id)
    end
end

