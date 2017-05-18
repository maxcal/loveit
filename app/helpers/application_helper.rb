module ApplicationHelper
  def singular?
    %w{ show edit update destroy }.include? action_name
  end
end
