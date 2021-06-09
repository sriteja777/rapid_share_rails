class Document < ApplicationRecord
  has_one_attached :document, dependent: :destroy
  belongs_to :user
end
