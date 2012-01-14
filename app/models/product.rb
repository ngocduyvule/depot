# encoding: utf-8
class Product < ActiveRecord::Base
	default_scope :order => 'title'
	has_many :line_items
	has_many :orders, through: :line_items
	before_destroy :ensure_not_referenced_by_any_line_item
	
	validates :title, :description, :image_url, :presence => true
	validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
	validates :title, :uniqueness => true
	validates :title, :length => { 
		:minimum 	=> 10,
		:message	=> 'Doit comporter au moins 10 caractères'}
	validates :image_url, :format => {
		:with		=> %r{\.(gif|jpg|png)$}i,
		:message	=> "Doit-être un format d'image valide, tel que JPG, GIF, PNG"}
		
	private
		
		# ensure that there are no line items referencing this product
		def ensure_not_referenced_by_any_line_item
			if line_items.empty?
				return true
			else
				errors.add(:base, 'Line Items present')
				return false
			end
		end
end
