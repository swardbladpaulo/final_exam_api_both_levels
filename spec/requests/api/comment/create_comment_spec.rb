RSpec.describe "POST /api/comments", type: :request do
describe "successfully create comments" do
  let(:article){create(:article)}
  before do
    post '/api/comments',
    params: {comments: {body: "This is a comment", article_id: article.id}}
  end

  it 'is expected to return 200 status' do
  expect(response).to have_http_status 200  
  end

  it 'is expected to return success message' do
    expect(response_json['message']).to eq 'This comment has been posted'
  end

  it 'is expected to belong to article' do
    expect(response_json['comments']).to eq article_id
  end

end  



end