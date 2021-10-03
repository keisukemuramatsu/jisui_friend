class ApplicationMailer < ActionMailer::Base
  default from:     "自炊フレンド事務局",
          cc:       "harukasoranoyouni@gmail.com"
  layout 'mailer'
end
