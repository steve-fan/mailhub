require 'spec_helper'

describe Mailhub::Hub do
  let(:settings) do
    {
      postmark_api_token: 'new-api-token-value',
    }
  end

  it 'has one vendors' do
    expect(Mailhub::Hub.vendors).to eq([:postmark])
  end
end
