class Admin::HomesController < ApplicationController
  def top
    @customer = Customer.all
  end
end
