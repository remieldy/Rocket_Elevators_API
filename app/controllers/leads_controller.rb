
 require 'sendgrid-ruby'
 include SendGrid


class LeadsController < ApplicationController
  before_action :set_lead, only: [:show, :edit, :update, :destroy]

  # GET /leads
  # GET /leads.json
  def index
    @leads = Lead.all
  end

  # GET /leads/1
  # GET /leads/1.json
  def show
  end

  # GET /leads/new
  def new
    @lead = Lead.new
    format.html {redirect_to "/index#contact"}
  end

  # GET /leads/1/edit
  def edit
  end

  # POST /leads
  # POST /leads.json
  def create
    @lead = Lead.new(lead_params)
 
    @customer = Customer.find_by company_name: params[:lead][:company_name]
    if @customer != nil
        @lead.customer_id = @customer.id
    else @lead.customer_id = nil


      # using SendGrid's Ruby Library
      # https://github.com/sendgrid/sendgrid-rub
 
    from = Email.new(email: 'charleshebert1995@gmail.com')
    to = Email.new(email: 'remieldy@hotmail.com')
    subject = 'Sending with SendGrid is Fun hooooooooooooo'
    content = Content.new(type: 'text/plain', value: 'and easy to do iugiugiugiug, even with Ruby')
    mail = Mail.new(from, subject, to, content)
  
    sg = SendGrid::API.new(api_key: '')
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
 

    respond_to do |format|
      if @lead.save
        format.html { redirect_to "/index#contact", alert: 'Lead was successfully created.' }
        format.json { render :show, status: :created, location: @lead }
      else
        format.html { redirect_to "/index#contact" }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
      end
    end
  end
  

  # PATCH/PUT /leads/1
  # PATCH/PUT /leads/1.json
  def update
    respond_to do |format|
      if @lead.update(lead_params)
        format.html { redirect_to @lead, notice: 'Lead was successfully updated.' }
        format.json { render :show, status: :ok, location: @lead }
      else
        format.html { render :edit }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leads/1
  # DELETE /leads/1.json
  def destroy
    @lead.destroy
    respond_to do |format|
      format.html { redirect_to leads_url, notice: 'Lead was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead
      @lead = Lead.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lead_params
      params.require(:lead).permit(:full_name, :company_name, :email, :phone_number, :project_name, :project_description, :department_in_charge, :message, :attachment)
    end
end