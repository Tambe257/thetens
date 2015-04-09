module ApplicationHelper

  def og_image_path
    if @pin.present? 
      @pin.image.url
    end  
  end  

  def og_url_path
    if @pin.present? 
      "http://www.thetens.us/pins/" + @pin.to_param
    end  
  end 

  def og_title_path
    if @pin.present? 
      @pin.artist + " | " + @pin.album
    end  
  end 

end