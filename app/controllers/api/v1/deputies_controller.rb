module Api
  module V1
    class DeputiesController < ApplicationController
      def show
        deputy = Deputy.find(params[:id])
        render json: deputy, serializer: DeputyWithExpensesSerializer
      end
    end
  end
end
