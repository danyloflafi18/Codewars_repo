describe 'delete operator' do
  before(:all) do
    @api_functionality = RestHttp.new
  end

  it 'should delete fourth operator via DELETE request' do
    result = @api_functionality.delete_request('/operators/4')
    expect(result.code).to eq(200)
  end
end