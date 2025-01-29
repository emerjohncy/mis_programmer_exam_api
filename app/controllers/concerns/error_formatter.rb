module ErrorFormatter
  extend ActiveSupport::Concern

  def format_errors(errors)
    errors.messages.each_with_object({}) do |(field, messages), formatted_errors|
      formatted_errors[field] = messages
    end
  end
end