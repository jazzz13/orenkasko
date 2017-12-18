class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def new_application(application)

    @data = application.converted_data_to_human

    # attachments['image.jpg'] = File.read('./052250dc50138371fd04f19c188f0143_XL.jpg')

    mail(from: 'From sender', to: 'murtazin13@gmail.com', subject: @data['fio'])

  end

end
