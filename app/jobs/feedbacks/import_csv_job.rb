module Feedbacks
  class ImportCsvJob < ApplicationJob
    queue_as :default

    def perform(review_import:)
      ::Feedbacks::ImportCsvService.new.call(review_import:)
    end
  end
end
