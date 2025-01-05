# frozen_string_literal: true

class Menu < ApplicationRecord
  has_many :menu_sections
  has_many :sections, through: :menu_sections

  before_create { self.identifier = SecureRandom.uuid }
  before_update { identifier.reload }
end
