class DailyMailer < ApplicationMailer
  default from: 'no-replay@gmail.com'

  # def send_mail
  #   DailyMailer.daily_mailer.deliver_now
  # end

  def daily_mailer
    # @user = User.all
    # @user.each do |user|
    #   mail(subject: "Bookersです", to: user.email)
    # end
  end


end
