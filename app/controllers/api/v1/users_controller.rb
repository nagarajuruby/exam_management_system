class Api::V1::UsersController < ApplicationController
  def create

    # Validate request data
    if user_params[:first_name].blank? || user_params[:last_name].blank? || user_params[:phone_number].blank? || user_params[:college_id].blank? || user_params[:exam_id].blank? || user_params[:start_time].blank?
      render json: { error: 'Invalid or incomplete request data' }, status: :bad_request
      return
    end
    
    # Sanitize phone number
    user_params[:phone_number].gsub!(/[^0-9]/, '')
    
    # Find or create user
    exam = Exam.find_by(id: user_params[:exam_id], college_id: user_params[:college_id])
    if exam.nil?
      render json: { error: 'Invalid exam ID or college ID' }, status: :bad_request
      return
    end

    user = User.find_or_create_by(
      first_name: user_params[:first_name],
      last_name: user_params[:last_name],
      phone_number: user_params[:phone_number]
    )

    unless user.valid?
      render json: { error: user.errors.full_messages.to_sentence }, status: :bad_request
      return
    end

    # Check exam window
    exam_window = exam.exam_windows.find_by('start_time <= ? AND end_time >= ?', user_params[:start_time], user_params[:start_time])
    if exam_window.nil?
      render json: { error: 'Requested start time does not fall within an exam window' }, status: :bad_request
      return
    end

    user.user_exams.create(exam: exam)

    render json: { user: user, exam: exam, exam_window: exam_window }, status: :ok
  end
  private
  def user_params
    params.permit(:first_name, :last_name, :phone_number, :college_id, :exam_id, :start_time)
  end
end
