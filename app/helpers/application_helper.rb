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
end
