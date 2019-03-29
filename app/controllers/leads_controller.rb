class LeadsController < ApplicationController
  before_action :set_lead, only: [:show, :edit, :update, :destroy]
 
 
 require 'sendgrid-ruby'
 include SendGrid
 
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
    # else @lead.customer_id = nil
    end
 
 
    sendgrid(@lead)
 
 
 
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
 

    #=========================SENDGRID API=====================================================
    def sendgrid(lead)
      data = JSON.parse("{
        \"personalizations\": [
          {
            \"to\": [
              {
                \"email\": \"#{lead.email}\"
                
              }
            ],
            \"dynamic_template_data\": {
              \"subject\": \"Sending with SendGrid is supposed to be Fun they said\",
              \"full_name\": \"#{lead.full_name}\",
              \"project_name\": \"#{lead.project_name}\"
              
            }
          }
        ],
        \"from\": {
          \"email\": \"support@codeboxx.com\"
        },
      \"template_id\": \"d-7fdd742e0493440f89582c56a7b6e4d5\"
      }")
        
      sg = SendGrid::API.new(api_key: "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")
 
      response = sg.client.mail._('send').post(request_body: data)
      # puts response.status_code
      # puts response.body
      # puts response.parsed_body
      # puts response.headers
    end
 end
 #=====================================================================