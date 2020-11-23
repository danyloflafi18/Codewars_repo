require 'rspec'
require_relative '../support/data'
require_relative '../../lib/rest_http'

describe 'update department' do
  it 'should update third department via PUT request' do
    @api_functionality = RestHttp.new
    result = @api_functionality.put_request('/departments/3', API.department_payload)
    expect(result.code).to eq(200)
  end
end