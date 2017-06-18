require 'test_helper'

class PhotosControllerTest < ActionController::TestCase
	def setup
		0.upto(10) do |n|
			make_photo name: "test_name#{n}"
		end
	end

	def make_photo( name: "test_name" )
		Photo.create(
			name: name,
			uploaded_image: uploaded_file("test1.jpg", "image/jpeg")
		)
	end

	test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create photo" do
    assert_difference('Photo.count') do
      post :create, params: { photo: { name: "test_name", uploaded_image: uploaded_file("test1.jpg", "image/jpg") } }
    end
		assert_redirected_to photo_url(Photo.last)
  end

	test "error create photo" do
		assert_no_difference('Photo.count') do
			post :create, params: { photo: { name: "test_name", uploaded_image: uploaded_file("test1.tiff", "image/tiff") } }
		end
		assert_template "new"
	end

  test "should show photo" do
    get :show, params: { id: Photo.last.id }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { id: Photo.last.id }
    assert_response :success
  end

  test "should update photo" do
		photo = Photo.last
    post :update, params: { id: photo.id, photo: { name: "update_test", uploaded_image: uploaded_file("test2.jpg", "image/jpg") } }
    assert_redirected_to photo
  end

  test "should destroy photo" do
    assert_difference('Photo.count', -1) do
      put :destroy, params: {id: Photo.last}
    end

    assert_redirected_to photos_path
	end
end
