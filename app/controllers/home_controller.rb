# frozen_string_literal: true
class HomeController < ApplicationController
  def index
    redirect_to transactions_url if logged_in?
  end
end
