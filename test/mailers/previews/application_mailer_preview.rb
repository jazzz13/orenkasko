# Preview all emails at http://localhost:3000/rails/mailers/application_mailer
class ApplicationMailerPreview < ActionMailer::Preview

  def new_aplication
    ApplicationMailer.new_application(Application.find(15))
  end

end
