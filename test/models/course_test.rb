require 'test_helper'

class CourseTest < ActiveSupport::TestCase
 test "should_be_valid_without_a_title" do
  courses(:one).title = nil
  assert_nil courses(:one).title
  assert_equal false, courses(:one).valid?
 end
end
