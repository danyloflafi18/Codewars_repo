require 'rspec'
require_relative '../support/data'
require_relative '../../lib/rest_http'

describe 'return all clients' do
  it 'should return all clients via GET request' do
    @api_functionality = RestHttp.new
    result = @api_functionality.get_request('/clients')
    expect(result.code).to eq(200)
  end
end