require 'test_helper'

class RegistrosemailsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get registrosemails_create_url
    assert_response :success
  end

end
