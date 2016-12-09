module Mailhub
  class Railtie < Rails::Railtie
    initializer 'mailhub', before: 'action_mailer.set_configs' do
      ActiveSupport.on_load :action_mailer do
        Mailhub.install
      end
    end
  end
end
