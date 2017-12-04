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

end
