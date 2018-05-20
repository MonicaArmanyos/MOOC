class CoursesController < InheritedResources::Base
  before_action :authenticate_user!
  layout 'nav'
  load_and_authorize_resource
  rescue_from CanCan::AccessDenied do |exception|
    flash[:warning] = exception.message
    redirect_to courses_url
  end
  
  private

    def course_params
      params.require(:course).permit(:title)
    end
end

