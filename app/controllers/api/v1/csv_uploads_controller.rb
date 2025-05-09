module Api
  module V1
    class CsvUploadsController < ApplicationController
      def index
        uploads = CsvUpload.order(created_at: :desc)
        render json: uploads
      end

      def show
        render json: csv_upload.deputies, each_serializer: DeputySerializer
      end


      def csv_upload
        CsvUpload.find(params[:id])
      end
    end
  end
end
