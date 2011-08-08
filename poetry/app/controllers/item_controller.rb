require "pp"

class ItemController < ApplicationController
  
  def ratingSort
    
    strokes_array = Array.new
    @strokes.each do |stroke|
      
      stroke = stroke.serializable_hash
        
      if strokes_array[stroke["position"]].nil?
        
        strokes_array[stroke["position"]] = Array.new()
      end
    
      strokes_array[stroke["position"]] << Hash[stroke.select{ |k, v| k.to_s != "position"}]  
      
    end
    
    sorted_strokes = Array.new
    strokes_array.each do |stroke|
      
      sorted_strokes << stroke.sort_by{|x| -1*x["rating"]}
    end
    
    return sorted_strokes
  end
  
  def show
    
    @item = Item.find(5)    
    @strokes_unsort = @item.strokes
    
    @strokes = @strokes_unsort.sort_by{|k| k[:position]}
    
    @strokes = self.ratingSort
    
    @stroke_max_position = Stroke.maximum(:position)
  end
  
  def stroke_add
  
    @position = params[:position]
    @itemID = params[:itemID]
  end
  
  def stroke_append
  
    @text = params[:text]
    @position = params[:position]
    @item_id = params[:item_id]
    @user_id = 1
    @rating = 0
    
    @stroke = Stroke.new
    
    @stroke[:text] = @text
    @stroke[:position] = @position
    @stroke[:item_id] = @item_id
    @stroke[:user_id] = @user_id
    @stroke[:rating] = @rating
    
    @stroke.save
    
    redirect_to :action => "show"
  end
  
end