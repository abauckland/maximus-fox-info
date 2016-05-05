
  class ItemsController < ApplicationController

#    skip_before_filter :authenticate_user!, :only => [:show]

    before_action :set_guidenote, only: [:edit, :update, :create, :destroy]

#create subclauses
#import from csv

#show in editable table

#export as csv

    private

  end