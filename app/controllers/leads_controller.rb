class LeadsController < ApplicationController
    def new
        @lead = Lead.new
    end

    def create
        @lead = Lead.new(lead_params)
        @lead.save!
        
        if @lead.save
            redirect_to main_app.root_path, notice: "Message sent!"
        else    
            redirect_to "/leads", notice: "Invalid fields!"
        end
    end

    private

    def lead_params
      params.require(:lead).permit(:full_name, :email, :phone, :company_name, :project_name, :department, :project_description,
      :message, :contact_attachment)
    end
end