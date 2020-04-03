# frozen_string_literal: true

ActiveAdmin.register Product do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :category, :product_name, :description, :price, :image, :OrderStatus_id, :Order_status_id, category_products: %i[id Category_id Product_id _destroy]

  # show do |category|
  #   attributes_table
  # end

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.input :image, as: :file
    end

    # f.inputs 'Product' do
    #   f.has_many :category_products, allow_destroy: true do |n_f|
    #     n_f.input :category
    #   end

    #   f.has_many :order_products, allow_destroy: true do |n_f|
    #     n_f.input :order
    #   end
    # end
    f.actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:product_name, :description, :price, :OrderStatus_id, :Order_status_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
