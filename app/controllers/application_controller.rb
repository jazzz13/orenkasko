class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception


  def home_page

    render json: {message: 'HW!'}

  end

  def create

    data = params[:data]

    user = current_user || User.test_user

    a = Application.create!(data: data, user_id: user.id)

    ApplicationMailer.new_application(a).deliver_later

    render json: {id: a.id}

  end

  def me

    render json: current_user.as_json(only: :name)

  end

  def current_user

    User.find_by({phone: params[:phone], password: params[:password]})

  end

  def upload_image

    original_filename = nil
    temp_image = nil

    params.keys.each do |key|
      value = params[key]
      if value.class == ActionDispatch::Http::UploadedFile && value.tempfile

        if value.content_type.include?('image')
          temp_image = value.tempfile
        end

        original_filename = value.original_filename

        break

      end
    end

    if temp_image

      path = temp_image.path

      ext = '.jpeg'

      if ext != File.extname(path)

        path = temp_image.path + ext

        File.rename(temp_image.path, path)

      end

      render json: {temp_path: path}

    else

      render json: {error: 'File not found'}, status: :bad_request
    end
  end

end
