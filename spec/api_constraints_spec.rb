require 'spec_helper'
require 'api_constraints'

describe ApiConstrains do
  let(:api_constrains_v1) { ApiConstrains.new(version: 1) }
  let(:api_constrains_v2) { ApiConstrains.new(version: 2, default: true) }

  describe "matches?" do
    it "returns true when the version matches the 'Accept' header" do
      request = double(host: 'api.itlookup_api.dev',
                      headers: {"Accept" => 'applications/vnd.itlookup_api.v1'} )
      api_constrains_v1.matches?(request).should be_true
    end

    it "returns the default version when 'default' option is specified" do
      request = double(host: 'api.itlookup_api.dev')
      api_constrains_v2.matches?(request).should be_true
    end
  end
end
