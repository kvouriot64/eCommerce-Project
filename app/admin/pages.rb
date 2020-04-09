ActiveAdmin.register Page do

  permit_params :title, :content, :permalink

  form do |f|
    f.semantic_errors
    f.inputs
    f.actions
  end
end