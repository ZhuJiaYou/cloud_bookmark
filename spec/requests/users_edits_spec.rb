require 'rails_helper'

RSpec.describe "UsersEdits", type: :request do
  describe "GET /users_edits" do
    it "works! (now write some real specs)" do
      get users_edits_path
      expect(response).to have_http_status(200)
    end
  end
end
