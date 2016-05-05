
  class SubclausesController < ApplicationController

#    skip_before_filter :authenticate_user!, :only => [:show]

    before_action :set_guidenote, only: [:edit, :update, :create, :destroy]



    private

  end

