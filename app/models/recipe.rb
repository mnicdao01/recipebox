class Recipe < ApplicationRecord
	has_many :ingredients
	has_many :directions

	has_attached_file :image, styles: { large: "600x600#", medium: "300x300#", thumb: "100x100#" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  	accepts_nested_attributes_for :ingredients, reject_if: proc { |attributes| attributes['name'].blank? }, allow_destroy: true
	accepts_nested_attributes_for :directions, reject_if: proc { |attributes| attributes['step'].blank? }, allow_destroy: true

	validates :title, :description, :image, presence: true
end
