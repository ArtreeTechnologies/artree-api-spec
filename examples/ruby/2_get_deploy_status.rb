require 'base64'
require "net/http"
require "json"

auth_header = Base64.strict_encode64("#{ARGV[0]}:#{ARGV[1]}")
deploy_id = ARGV[2]

uri = URI.encode("https://staging.api.artree.jp/contract/deploy/status/#{deploy_id}")

begin
    res = Net::HTTP.get_response(URI.parse(uri))
    results = JSON.parse(res.body)
rescue => e
    p e.message
end

p results
