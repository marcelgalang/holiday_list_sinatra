require 'pry'
require 'rack-flash'
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
    if
      # user = User.find_by_id(session[:user_id])
      @recipient = current_user.recipients.create(params)

      redirect to ("/recipients/#{@recipient.id}")
    else
      redirect to '/recipients/new'
    end
  end

  get '/recipients/:id' do
    @recipient = Recipient.find_by_id(params[:id])
    if logged_in?
      @recipient = Recipient.find_by_id(params[:id])
      erb :'recipients/show_recipient'
    else
      redirect to '/login'
    end
  end

  get '/recipients/:id/edit' do
    # if
      @recipient = Recipient.find_by_id(params[:id])
      if logged_in?
       @recipient.user_id == current_user
        erb :'recipients/edit_recipient'
      else
        redirect to '/recipients'
      end
    # else
    #   redirect to '/login'
    # end
  end

  patch '/recipients/:id' do
    @recipient = Recipient.find_by_id(params[:id])
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
        flash[:message] = "Successfully deleted recipient."
        redirect to '/recipients'
      else
        redirect to '/recipients'
      end
    else
        redirect to '/login'
    end
  end

end
