class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception


  def home_page

    render json: {message: 'HW!'}

  end

  def create

    data = params[:data]

    a = Application.create!(data: data)

    render json: {id: a.id}

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

      render json: {temp_path: temp_image.path}

    else

      render json: {error: 'File not found'}, status: :bad_request
    end
  end

end
