require "test_helper"

class SubjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subject = subjects(:one)
  end

  test "should get index" do
    get subjects_url
    assert_response :success
  end

  test "should get new" do
    get new_subject_url
    assert_response :success
  end

  test "should create subjects" do
    assert_difference("Subject.count") do
      post subjects_url, params: { subject: { description: @subject.description, lecturer_id: @subject.lecturer_id, name: @subject.name } }
    end

    assert_redirected_to subject_url(Subject.last)
  end

  test "should show subjects" do
    get subject_url(@subject)
    assert_response :success
  end

  test "should get edit" do
    get edit_subject_url(@subject)
    assert_response :success
  end

  test "should update subjects" do
    patch subject_url(@subject), params: { subject: { description: @subject.description, lecturer_id: @subject.lecturer_id, name: @subject.name } }
    assert_redirected_to subject_url(@subject)
  end

  test "should destroy subjects" do
    assert_difference("Subject.count", -1) do
      delete subject_url(@subject)
    end

    assert_redirected_to subjects_url
  end
end
