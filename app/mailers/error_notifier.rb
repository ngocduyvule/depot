class ErrorNotifier < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.error_notifier.occured.subject
  #
  def occured(error)
    @error = error
    
    mail to: "foenix.skies@gmail.com", subject: 'Pragmatic Store Error Incident'
  end
end
