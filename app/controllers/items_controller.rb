class ItemsController < ApplicationController

#    skip_before_filter :authenticate_user!, :only => [:show]

    before_action :set_guidenote, only: [:edit, :update, :create, :destroy]

  def index
    
  end

  def show
    #show relationships
    #@item

#parent items
    #parents = Itemrelate.where(:relation => 0, :item.id => @item.id)
    #parents.each do |parent|
      #items = Itemitem.where(:itemrelate => parent.id)
      #items.each do |item|
        #item.item
      #end
    #end

#child items
    #children = Itemrelate.where(:relation => 1, :item.id => @item.id)
    #children.each do |child|
      #items = Itemitem.where(:itemrelate => child.id)
      #items.each do |item|
        #item.item
      #end
    #end

  end

  private

end