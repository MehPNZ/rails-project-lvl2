# frozen_string_literal: true

module ApplicationHelper
  def flash_class(level)
    flash_hash = {
      'notice' => 'alert alert-info',
      'success' => 'alert alert-success',
      'alert' => 'alert alert-danger'
    }

    flash_hash[level]
  end
end
