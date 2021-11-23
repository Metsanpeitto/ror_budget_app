require 'spec_helper'

module Features
  module SessionHelpers
    def login_user
      user = FactoryBot.create(:user)
      sign_in user
    end
  end
end
