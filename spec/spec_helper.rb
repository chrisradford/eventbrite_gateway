require 'minitest/autorun'
require 'minitest/spec'
require 'json'
require 'eventbrite_gateway'
require 'dotenv'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
end

Dotenv.load

EBClient = Struct.new(:file_name) do
  def method_missing method_name, *args, &block
    if file_name
      file = File.read "spec/assets/#{file_name}.json"
      JSON.parse file
    else
      raise RuntimeError, 'No records were found with the given parameters', caller[1..-1]
    end
  end
end
