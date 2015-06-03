require 'sinatra/base'

class SinatraApi < Sinatra::Base

  get '/tickets' do
    Ticket.all.to_json
  end


  get '/tickets/:id' do
    Ticket.where(params[:registra]).to_json
  end

  post '/tickets' do
    params = JSON.parse(request.body.read.to_s)
    new_ticket = Ticket.new(:registra => params['registra'], :talk_id => params['talk_id'])
    new_ticket.save
  end

  # ---------------

  get '/talks' do
    Talk.all.select(:speaker_id, :title, :badge, :limit, :blurb, :description, :date, :start_time).to_json(:include => :speaker)
  end

  get '/talks/remaining/:id' do
    talk_id        = params[:id]
    ticket_taken   = Ticket.where(talk_id: params[:id]).count
    talk_max_count = Talk.where(id: params[:id]).select(:limit)

    (talk_max_count[0].limit - ticket_taken).to_json
  end

  get '/talks/:id' do
    Talk.find(params[:id]).to_json
  end

  patch '/talks/time/:id' do
    talk      = Talk.find(params[:id])
    talk_time = Time.new(2015,5,23, params[:hour], params[:minutes], 0, "+10:00") 
    talk.update(:date => talk_time)
  end

  # ---------------

  get '/speakers' do
    Speaker.all.select(:id, :name, :image, :blurb).to_json(:include => :talks)
    # badges
  end

  get '/speakers/:id' do
    Speaker.find(params[:id]).to_json
  end

  # -------------------------
  # Mailer

  post '/mailer/contact' do
    # email user confirmation upon send from contact form
    if Rails.configuration.x.mail_on_SPA_contact == true
      UserNotifier.send_contact_email(params).deliver_now
    end
  end

  post '/mailer/payment' do
    # email user confirmation upon purchasing ticket
    if Rails.configuration.x.mail_on_user_payment == true
      UserNotifier.send_payment_email(params).deliver_now
    end
  end

  # -------------------------

end
