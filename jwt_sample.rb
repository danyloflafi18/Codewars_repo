require 'atlassian/jwt'

require 'uri'
require 'net/http'

# The URL of the API call, must include the query string, if any
url = 'https://jira.atlassian.com/rest/api/latest/issue/JRA-9'
base_url = 'https://chalyi20.atlassian.net'
# The key of the app as defined in the app description
issuer = 'MjA1NDAyYjAtMWQ2YS0zYzk4LWE1NzktY2Q2ODEwNGM1OWNiIDVjZjY4NGQ3ZDlmNmI5MGYzZDRiMTRkNCBVU0VSX0RFRkFVTFRfTkFNRQ'
# The HTTP Method (GET, POST, etc) of the API call
http_method = 'get'
# The shared secret returned when the app is installed
shared_secret = 'UzrlAZxg1F5KEe-MYiNvPfAUW4Cpqo-L-lQW1gyGvMg'

claim = Atlassian::Jwt.build_claims(
  issuer,
  url,
  http_method,
  base_url,
)
jwt = JWT.encode(claim, shared_secret)

uri = URI("https://prod-api.zephyr4jiracloud.com/connect/public/rest/api/latest/issue/JRA-9?jwt=#{jwt}")
http = Net::HTTP.new(uri.host, uri.port)
http.set_debug_output($stdout)
request = Net::HTTP::Get.new(uri.request_uri)
response = http.request(request)

claims, jwt_header = Atlassian::Jwt.decode(params[:jwt], nil, false)