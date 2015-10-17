require 'yaml'
require 'json'
require 'net/http'

module Puppet::Parser::Functions
  newfunction(:get_jails, :type => :rvalue, :doc => <<-EOS
  Retrieves a list of jails from FreeNAS

  Credentials must be available in /etc/freenas_api.yml

  See http://api.freenas.org/resources/jails.html#id2 for response format
  EOS
  ) do |args|
    credentials = YAML.load_file('/etc/freenas_api.yml')
    uri = URI.parse("#{credentials[:base_url]}/api/v1.0/jails/jails/")
    req = Net::HTTP::Get.new(uri.path)
    req.basic_auth credentials[:username], credentials[:password]
    http = Net::HTTP.new(uri.host, uri.port)
    response = http.start { |cx| cx.request(req) }
    JSON.parse(response.body)
  end
end
