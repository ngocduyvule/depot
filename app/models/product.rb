# encoding: utf-8
class Product < ActiveRecord::Base
	validates :title, :description, :image_url, :presence => true
	validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
	validates :title, :uniqueness => true
	validates :title, :length => { 
		:minimum 	=> 10,
		:message	=> 'Doit comporter au moins 10 caractères'}
	validates :image_url, :format => {
		:with		=> %r{\.(gif|jpg|png)$}i,
		:message	=> "Doit-être un format d'image valide, tel que JPG, GIF, PNG"}
end
