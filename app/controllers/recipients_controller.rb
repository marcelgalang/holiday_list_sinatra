require 'pry'
class RecipientsController < ApplicationController

  get '/recipients' do
    if logged_in?
      @recipients = recipient.all
      erb :'recipients/index'
    else
      redirect to '/login'
    end
  end

  get '/recipients/new' do
    if logged_in?
      erb :'recipients/new'
    else
      redirect to '/login'
    end
  end

  post '/recipients' do
    if params[:content] == ""
      redirect to '/recipients/new'
    else
      user = User.find_by_id(session[:user_id])
      @recipient = recipient.create(:content=> params[:content], :user_id=> user.id)
      redirect to ("/recipients/#{@recipient.id}")
    end
  end

  get '/recipients/:id' do
    if logged_in?
      @recipient = recipient.find_by_id(params[:id])
      erb :'recipients/show'
    else
      redirect to '/login'
    end
  end

  get '/recipients/:id/edit' do
    if session[:user_id]
      @recipient = recipient.find_by_id(params[:id])
      if @recipient.user_id == session[:user_id]
        erb :'recipients/edit'
      else
        redirect to '/recipients'
      end
    else
      redirect to '/login'
    end
  end

  patch '/recipients/:id' do
    if params[:content]==""
      redirect to "/recipients/#{params[:id]}/edit"
    else
      @recipient = recipient.find_by_id(params[:id])
      @recipient.content = params[:content]
      @recipient.save
      redirect to "/recipients/#{@recipient.id}"
    end
  end

  delete '/recipients/:id/delete' do
    @recipient = recipient.find_by_id(params[:id])
    if logged_in?
      if @recipient.user_id == session[:user_id]
        @recipient.delete
        redirect to '/recipients'
      else
        redirect to '/recipients'
      end
    else
        redirect to '/login'
    end
  end

end
