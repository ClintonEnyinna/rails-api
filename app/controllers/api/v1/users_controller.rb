module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authenticate_request, only: :create

      def create
        @user = User.new(user_param)

        if @user.save
          render jsonapi: @user, status: :created
        else
          render jsonapi_errors: @user.errors
        end
      end

      private

      def user_param
        params.require(:user).permit(:email, :password, :password_confirmation)
      end
    end
  end
end
