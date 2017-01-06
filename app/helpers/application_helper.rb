module ApplicationHelper
  def input_for_kind(kind)
    case kind
    when "textarea"
      :text
    when "text"
      :string
    when "combobox"
      :select
    end
  end


  def input_for_field(form, field)
    unless field.nil?
      if field.kind == "combobox"
        form.input :value, as: :select, collection: field.choices.split(","), label: field.name
      else
        form.input :value, as: input_for_kind(field.kind), label: field.name
      end
    end

  end
end
