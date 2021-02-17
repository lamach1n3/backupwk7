class QuotesController < ApplicationController

    # def index
    #     @quote = Quote.all
    # end

    def new
        @quote = Quote.new
    end

    def create
        @quote = Quote.new(quote_params)

        if @quote.save
            flash[:success] = "Quote added to database!"
            redirect_to main_app.root_path
        else    
            redirect_to "/quotes"
        end
    end

    private

    def quote_params
      params.require(:quote).permit(:company_name)
    end
end

