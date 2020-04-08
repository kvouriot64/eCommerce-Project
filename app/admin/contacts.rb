# frozen_string_literal: true

ActiveAdmin.register Contact do
  permit_params :title, :description, :email, :phone_number

  form do |f|
    f.semantic_errors
    f.inputs
    f.actions
  end
end
