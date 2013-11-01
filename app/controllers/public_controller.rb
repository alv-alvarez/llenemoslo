class PublicController < ApplicationController
  def public
    
  end

  def index
    @events = Event.all
  end
  
  def comoFunciona
  end

  def contacto
  end
  
end
