class Public::ItemsController < ApplicationController

  def index
    @model_class_name = ModelClassName.all

    respond_to do |wants|
      wants.html # index.html.erb
      wants.xml  { render :xml => @model_class_names }
    end
  end

  def show
    @model_class_name = ModelClassName.find(params[:id])

    respond_to do |wants|
      wants.html # show.html.erb
      wants.xml  { render :xml => @model_class_name }
    end
  end

end
