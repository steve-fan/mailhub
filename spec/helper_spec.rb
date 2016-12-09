require 'spec_helper'

RSpec.describe Mailhub::Helper do
  describe '.build_sendcloud_message' do
    let(:mail) do
      Mail.new do
        from 'support@example.com'
        to 'alan@example.com'
        subject 'Welcome'
        body '<h1>Glad you came</h1>'
      end
    end

    let(:expect_hash) do
      {
        from: 'support@example.com',
        to: 'alan@example.com',
        subject: 'Welcome',
        html: '<h1>Glad you came</h1>'
      }
    end

    it 'convert mail to Sendcloud hash format' do
      expect(subject.build_sendcloud_message(mail)).to eql(expect_hash)
    end
  end
end
