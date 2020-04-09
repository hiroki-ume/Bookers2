# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

DIR_RBENV_BIN = "#{ENV['HOME']}/.rbenv/bin"

rails_env = ENV['RAILS_ENV'] || :development
set :environment, rails_env

set :output, "/vagrant/Bookers2/log/cron.log"

env :PATH, ENV['PATH']

job_type :rbenv_rake, %Q!PATH="#{DIR_RBENV_BIN}:$PATH"; eval "$(rbenv init -)"; cd :path && :bundle_command rake :task --silent :output!
job_type :be_rake, 'cd :path && :bundle_command rake :task --silent :output'
# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
#  every 1.minutes do
# #   command "/usr/bin/some_great_command"
#   runner "DailyMailer.daily_mailer.deliver"
#    # rake 'daily_mail:mail'
#  end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
