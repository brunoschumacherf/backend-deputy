module Api
  module V1
    class UploadsController < ApplicationController
      def create
        file = params[:file]
        state = params[:state]

        if file && state
          path = Rails.root.join('tmp', file.original_filename)
          File.open(path, 'wb') { |f| f.write(file.read) }

          ImportExpensesJob.perform_later(path.to_s, state)

          render json: { message: 'Arquivo enviado com sucesso. A importação está em andamento.' }, status: :ok
        else
          render json: { error: 'Arquivo ou estado ausente.' }, status: :unprocessable_entity
        end
      end
    end
  end
end
