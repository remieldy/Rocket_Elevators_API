class StatsController < ApplicationController
  before_action :set_stat, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

def authenticate
  redirect_to "/users/sign_in" unless current_user.nil?
end


  # GET /stats
  # GET /stats.json
  def index
      conn = PG::Connection.open(host: "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", port: 5432, dbname: "marc_antoine_tanguay", user: "codeboxx", password: "Codeboxx1!")
      @result  = conn.exec("SELECT extract(YEAR FROM creation_date) AS YEAR, to_char(to_timestamp(extract(MONTH FROM creation_date)::text, 'MM'), 'TMmon') AS MONTH, COUNT(quote_id)
      FROM      factquotes
      GROUP BY  YEAR, MONTH
      ORDER BY  YEAR, MONTH")
      @x1 = @result.column_values(1)
      @y1 = @result.column_values(2)

      @result1 = conn.exec("SELECT extract(YEAR FROM date_of_creation) AS YEAR, to_char(to_timestamp(extract(MONTH FROM date_of_creation)::text, 'MM'), 'TMmon') AS MONTH, COUNT(contact_id)
      FROM      factcontact
      GROUP BY  YEAR, MONTH
      ORDER BY  YEAR, MONTH")
      @x2 = @result1.column_values(1)
      @y2 = @result1.column_values(2)

      @result2 = conn.exec('SELECT  company_name, number_of_elevators FROM dimcustomers WHERE number_of_elevators > 0
      GROUP BY company_name,number_of_elevators 
      order by number_of_elevators
      LIMIT 10')
      @x3 = @result2.column_values(0)
      @y3 = @result2.column_values(1)


  end

  # GET /stats/1
  # GET /stats/1.json
  def show
  end

  # GET /stats/new
  def new
    @stat = Stat.new
  end

  # GET /stats/1/edit
  def edit
  end

  # POST /stats
  # POST /stats.json
  def create
    @stat = Stat.new(stat_params)

    respond_to do |format|
      if @stat.save
        format.html { redirect_to @stat, notice: 'Stat was successfully created.' }
        format.json { render :show, status: :created, location: @stat }
      else
        format.html { render :new }
        format.json { render json: @stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stats/1
  # PATCH/PUT /stats/1.json
  def update
    respond_to do |format|
      if @stat.update(stat_params)
        format.html { redirect_to @stat, notice: 'Stat was successfully updated.' }
        format.json { render :show, status: :ok, location: @stat }
      else
        format.html { render :edit }
        format.json { render json: @stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stats/1
  # DELETE /stats/1.json
  def destroy
    @stat.destroy
    respond_to do |format|
      format.html { redirect_to stats_url, notice: 'Stat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stat
      @stat = Stat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stat_params
      params.fetch(:stat, {})
    end
end
