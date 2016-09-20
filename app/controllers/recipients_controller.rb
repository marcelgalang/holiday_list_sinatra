require 'pry'
class RecipientsController < ApplicationController

  get '/recipients' do
    if logged_in?
      @recipients = Recipient.all
      erb :'recipients/recipients_index'
    else
      redirect to '/login'
    end
  end

  get '/recipients/new' do
    if logged_in?
      erb :'recipients/create_new'
    else
      redirect to '/login'
    end
  end

  post '/recipients' do
    if params[:name] == ""
      redirect to '/recipients/new'
    else
      user = User.find_by_id(session[:user_id])
      @recipient = Recipient.create(:name=> params[:name], :present=> params[:present], :user_id=> session[:user_id])
      redirect to ("/recipients/#{@recipient.id}")
    end
  end

  get '/recipients/:id' do
    if session[:user_id] && @recipient.user_id == session[:user_id]
      @recipient = Recipient.find_by_id(params[:id])
      erb :'recipients/show_recipient'
    else
      redirect to '/recipients'
    end
  end

  get '/recipients/:id/edit' do
    if session[:user_id]
      @recipient = Recipient.find_by_id(params[:id])
      if @recipient.user_id == session[:user_id]
        erb :'recipients/edit_recipient'
      else
        redirect to '/recipients'
      end
    else
      redirect to '/login'
    end
  end

  patch '/recipients/:id' do
    if params[:name]==""
      redirect to "/recipients/#{params[:id]}/edit"
    else
      @recipient = Recipient.find_by_id(params[:id])
      @recipient.name = params[:name]
      @recipient.present = params[:present]
      @recipient.save
      redirect to "/recipients/#{@recipient.id}"
    end
  end

  delete '/recipients/:id/delete' do
    @recipient = Recipient.find_by_id(params[:id])
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
