module ApplicationHelper

  def og_image_path
    if @pin.present? 
      @pin.image.url
    end  
  end  
end