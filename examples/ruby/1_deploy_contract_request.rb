require 'base64'
require "net/http"
require "json"

auth_header = Base64.strict_encode64("#{ARGV[0]}:#{ARGV[1]}")
uri = URI.parse("https://staging.api.artree.jp/contract/deploy")
req = Net::HTTP::Post.new(uri)
http = Net::HTTP.new(uri.host, uri.port)

http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

req = Net::HTTP::Post.new(uri.request_uri)

req["Content-Type"] = "application/json"
req["Authorization"] = auth_header

body = {
    'symbol' => 'ETH',
    'name' => 'Ethereum',
    'chain' => 'AST',
    'baseUrl' => 'https://example.com/images/',
    'type' => 'NORMAL'
}.to_json

req.body = body

begin
    res = http.request(req)
    results = JSON.parse(res.body)
rescue => e
    p e.message
end

p results
