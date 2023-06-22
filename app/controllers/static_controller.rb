class StaticController < ApplicationController
  def home
    render file: Rails.root.join('public', 'index.html')
  end
end
