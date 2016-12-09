module Mailhub
  module Helper
    def self.build_sendcloud_message(mail)
      {
        from: mail[:from].value,
        to: mail[:to].value,
        subject: mail[:subject].value,
        html: mail.body.raw_source
      }
    end
  end
end
