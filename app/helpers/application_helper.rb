module ApplicationHelper

  def og_image_path
    if @pin.present? 
      @pin.image_file_name
    end  
  end  
end