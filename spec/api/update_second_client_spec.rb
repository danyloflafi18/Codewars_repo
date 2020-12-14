describe 'update department' do
  before(:all) do
    @api_functionality = RestHttp.new
  end

  it 'should update third department via PUT request' do
    result = @api_functionality.put_request('/departments/3', API.department_payload)
    expect(result.code).to eq(200)
  end
end