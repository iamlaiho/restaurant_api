# frozen_string_literal: true

class Section < ApplicationRecord
  has_one :menu_section
  has_one :menu, through: :menu_section
end
