RSpec.describe "POST /api/comments", type: :request do
describe "successfully create comments" do
  let(:article){create(:article)}
  before do
    post '/api/comments',
    params: {comment: {body: "This is a comment", article_id: article.id}}
  end

  it 'is expected to return 200 status' do
  expect(response).to have_http_status 200  
  end

  it 'is expected to return success message' do
    expect(response_json['message']).to eq 'This comment has been posted'
  end

  it 'is expected to belong to article' do 
    comment = Comment.last
    expect(comment.article).to eq article
  end
  end
  
  describe "unsuccessfully create comments" do
    before do
      post '/api/comments',
      params: {comment: {body: nil, article_id: nil}}
    end

    it 'is expected to return 400 status' do
      expect(response).to have_http_status 400
    end
    it 'is expected to return error message' do
      expect(response_json['message']).to eq "Something went wrong"
    end
  end
end