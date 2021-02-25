class Lead < ActiveRecord::Base
    has_attached_file :file_attachment, styles: { medium: "300x300>", large: "600x600>", thumb: "150x150#" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :file_attachment, :content_type => /\Aimage\/.*\z/
  end
