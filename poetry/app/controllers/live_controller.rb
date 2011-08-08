class LiveController < ApplicationController
  def index
    
    @latest_strokes = Stroke.find()    
    
  end

end
