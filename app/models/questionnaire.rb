class Questionnaire < ApplicationRecord
  validates :question, presence: true
end
