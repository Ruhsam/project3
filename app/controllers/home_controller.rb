class HomeController < ApplicationController
  def index
  end
  def post
     test_service = MyServices::PhotonService.new()
     test_service.test_fire("dad")
     render json: {}
  end
end
