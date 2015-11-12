require "rails"
require "active_record/railtie"
require 'timecop'
require 'bundler/setup'

Bundler.require(*Rails.groups)

module MyApp
  class Application < Rails::Application; end
end

Rails.application.initialize!

describe "TimeWithZone" do
  it "today is not equal yesterday" do
    Timecop.freeze(DateTime.new(2015, 11, 11, 4)) do
      expect(Date.today).not_to eq(Date.yesterday)
    end
  end
end
