class HomesController < ApplicationController
    def top
    end
  
    def start
      # 1ページに両フォーム出すために必要
      @user_for_sign_up = User.new
      @user_for_sign_in = User.new
    end
  end
