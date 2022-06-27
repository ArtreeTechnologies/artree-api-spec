require 'base64'
require "net/http"
require "json"

auth_header = Base64.strict_encode64("#{ARGV[0]}:#{ARGV[1]}")
issue_id = ARGV[2]

uri = URI.parse(URI.encode("https://staging.api.artree.jp/nft/issue/status/#{issue_id}"))
req = Net::HTTP::Get.new(uri)
http = Net::HTTP.new(uri.host, uri.port)

http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

req["Authorization"] = auth_header

begin
    res = http.request(req)
    results = JSON.parse(res.body)
rescue => e
    p e.message
end

p results
