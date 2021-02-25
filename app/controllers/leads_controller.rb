class LeadsController < ApplicationController
    def new
        @lead = Lead.new
    end

    def create
        
        # file = lead_params.delete(:file)
        # filedata = file.read
        
        @lead = Lead.new(lead_params)
        # @lead.contact_attachment = filedata
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
      :message, :file_attachment, :image)
    end
end