class HomeController < ApplicationController
  def index
  end
  def post
     test_service = MyServices::PhotonService.new()
     test_service.test_fire("dad")
     puts "\n\n\n\n hey man it works!\n\n\n\n"
     render json: {}
  end
end
