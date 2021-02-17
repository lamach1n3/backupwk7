class QuotesController < ApplicationController
    # def index
    #     @quotes = Quote.all
    # end
    
    def new
        @quote = Quote.new(params[:quote])
    end
    
    def create
        new_quote = params.require(:quote).permit(:name, :description)
        quote = Quote.new(new_quote)

        if quote.save
            redirect_to main_app.root_path
        else    
            redirect_to "/quotes"
        end
    end
    
    def show
        id = params[:id]
        @quote = Quote.find(id)
    end 
end

# ### in html:

# <%= form_for @quote do |f| %> 

#     <%= f.label :description %>
#     <%= f.text_field :name %>

#     <%= f.submit "send quote", class: "btn btn-default"%> 
# <% end %>