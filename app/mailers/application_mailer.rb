class ApplicationMailer < ActionMailer::Base

  def new_application(application)

    @data = application.converted_data_to_human

    @from = application.user.name

    application.data['imgs'].to_a.each do |tmp_file_path|
      tmp_file_path = tmp_file_path.strip
      attachments[File.basename(tmp_file_path)] = File.read(tmp_file_path) if tmp_file_path.length > 0
    end

    mail(from: '<'+ENV['MAILER_LOGIN']+'>', to: ENV['MAILER_TARGET'], subject: @data['fio'])

  end

end
