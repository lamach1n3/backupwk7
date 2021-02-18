class QuotesController < ApplicationController
    def new
        @quote = Quote.new
    end

    def create
        @quote = Quote.new(quote_params)

        if @quote.final_price != '0.00 $' && @quote.final_price != '-$NaN' && @quote.save
            flash[:success] = "Quote added to database!"
            redirect_to main_app.root_path
        else    
            #failure alert?
            redirect_to "/quotes"
        end
    end

    private

    def quote_params
      params.require(:quote).permit(:number_of_apartments, :number_of_floors, :company_name, :number_of_basements,
      :number_of_companies, :number_of_corporations, :number_of_parking, :number_of_elevators, :maximum_occupancy,
      :business_hours, :company_name, :product_line, :install_fees, :total_price, :unit_price, :building_type, :final_price,
      :elevator_amount)
    end
end