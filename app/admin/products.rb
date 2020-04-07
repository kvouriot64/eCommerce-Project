# frozen_string_literal: true

ActiveAdmin.register Product do
  permit_params :category, :product_name, :description, :price, :image, category_products_attributes: %i[id category_id product_id _destroy]

  show do |_product|
    attributes_table do
      row :product_name
      row :description
      row :price
      row :categories do |product|
        product.categories.map(&:category).join(', ').html_safe
      end
    end
  end

  form do |f|
    f.semantic_errors
    f.inputs 'product' do
      f.input :product_name
      f.input :description
      f.input :price
      f.has_many :category_products, allow_destroy: true do |n_f|
        n_f.input :category
      end
      f.input :image, as: :file
    end
    f.actions
  end
end
