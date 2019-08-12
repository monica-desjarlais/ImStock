class StocksController < ApplicationController

    def search
    if params[:stock].blank?
      flash.now[:danger] = "You have entered an empty search string"
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "You have entered an incorrect symbol" unless @stock # stock is nill
    end
    respond_to do |format|    # if stock is valid
      format.js { render partial: 'users/result' }
    end
  end
end
