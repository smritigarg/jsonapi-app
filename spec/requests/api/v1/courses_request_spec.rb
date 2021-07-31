require 'rails_helper'

RSpec.describe "Api::V1::Courses", type: :request do

  describe "get all courses", :type => :request do
    let!(:courses) {create(:course)}

    before {get '/api/v1/courses'}

    it 'returns all courses' do
      expect(JSON.parse(response.body).size).to eq(1)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe "post a question route", :type => :request do
    let!(:coach) {create(:coach)}

    before do
      post '/api/v1/courses', \
        headers: {
          'Content-type': 'application/vnd.api+json'
        }, params: {
          "data": {
            "type": "courses",
            "relationships": {
              "coach": {
                "data": {
                  "type": "coaches",
                  "id": coach.id
                }
              }
            },
            "attributes": {
              "name":"Test Course",
              "self_assignable": true
              }
            }
          }.to_json
    end

    it 'returns the course' do
      expect(JSON.parse(response.body)["data"]["attributes"]["name"]).to eq('Test Course')
    end

    it 'returns a created status' do
      expect(response).to have_http_status(:created)
    end
  end


end
