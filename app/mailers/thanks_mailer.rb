class ThanksMailer < ApplicationMailer
  default from: 'no-replay@gmail.com'

  def thanks_mail(user)
    @user = user
    @url = "http://localhost:3000/users/#{@user.id}"
    mail(subject: "Thanks for sign up" ,to: @user.email)
  end
end
