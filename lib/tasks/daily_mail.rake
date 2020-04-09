namespace :daily_mail do
  task :mail do
    DailyMailer.daily_mailer.deliver_now
  end
end
