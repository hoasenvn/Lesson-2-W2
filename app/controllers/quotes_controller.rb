class QuotesController < ApplicationController
  def index
    @quote = Quote.order("RANDOM()").first
  end
  
=begin  
  def new
    @quote = Quote.new
  end  
 # --> Since we moved our form into our modal, we don't need the actual page where the form was running before anymore.
 # --> We can also delete the actual file that contained our form at app/views/quotes/new.html.erb
=end 
  
  def create
    @quote = Quote.create(quote_params)
    if @quote.invalid?
      flash[:error] = '<strong>Could not save</strong> the data you entered is invalid.'
    end
    redirect_to root_path
  end
  
  def about
  end
  
  def quote_params
    params.require(:quote).permit(:saying, :author)
  end
end
