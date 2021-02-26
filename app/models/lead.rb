class Lead < ActiveRecord::Base
    has_attached_file :file_attachment, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :file_attachment, :content_type => /\Aimage\/.*\z/
  end
