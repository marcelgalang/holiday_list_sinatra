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
    if user = User.find_by_id(session[:user_id])
      @recipient = Recipient.create(params)
      redirect to ("/recipients/#{@recipient.id}")
    else
      redirect to '/recipients/new'
    end
  end

  get '/recipients/:id' do
    @recipient = Recipient.find_by_id(params[:id])
    if session[:user_id]
      if @recipient.user_id == current_user.id
      erb :'recipients/show_recipient'
      else
        redirect to '/recipients'
      end
    else
      redirect to '/login'
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
    @recipient = recipient.find_by_id(params[:id])
    if
    if @recipient.update(name: params[:name], present: params[:present])
        redirect to "/recipients/#{@recipient.id}"
      else
        redirect to "/recipients/#{@recipient.id}/edit"
      end
    else
      redirect to "/recipients/#{params[:id]}/edit"
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
