class WorkController < ApplicationController
  def index
    themes = Theme.all.map {|it| [it.id, it.name]}
    @themes = {}
    @frameworks = {}
    themes.each do |it|
      @themes[it[0]] = it[1]
      @frameworks[it[0]] = Framework.filter_by_theme(it[0]).map { |el| [el.id, el.name] }
    end
  end

  def freamvote
    if params[:vote].blank? || params[:id].blank?
      render status =400
      return
    end

    v = Value.filter_by_user(user_id=current_user.id).first
    unless v.nil?
      v.delete
    end

    v = Value.create :user_id => current_user.id, :framework_id => params[:id], :value => params[:vote]
    v.save
    Framework.find(params[:id]).update_attribute(:value, Value.filter_by_frame(framework_id=params[:id]).sum(:value))
  end

  def borrowed
    if current_user.nil?
      redirect_to action: 'index', controller: 'main', login: 1
    end

    themes = Theme.all.map {|it| [it.id, it.name]}
    @themes = {}
    @frameworks = {}
    themes.each do |it|
      @themes[it[0]] = it[1]
      @frameworks[it[0]] = Framework.filter_by_theme(it[0]).filter_by_user(@current_user.id).map { |el| [el.id, el.name] }
    end

    render "index"
  end

  def show_framework
    f = Framework.find(params[:id])
    unless f.nil?
      render json: {creator: User.find(f.user_id).name, name: f.name, desc: f.description, rate: f.value}
    end
  end

  def new_framework
    f = Framework.new :name => params[:name], :description => params[:desc], :user_id => current_user.id,
                      :theme_id => params[:theme]
    f.save

    render json: {id: f.id}
  end

  def themes
    render json: Theme.all.map {|it| {id: it.id, name: it.name}}
  end
end
