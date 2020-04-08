# frozen_string_literal: true

ActiveAdmin.register About do
  permit_params :title, :content

  form do |f|
    f.semantic_errors
    f.inputs
    f.actions
  end
end
