class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token


  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.order(:id)
      # @patient_data ||= Business::Logic::HerTime (US & Canada)')
  end

  def staff
  end

  def admin_log_in
    @patients = Patient.all
    @username = params[:Admin][:name]
    @password = params[:Admin][:password]
    if (@username == "admin" and @password == "admin") 
       render :admin_view
    else 
      flash[:notice] = "Incorrect Username or Password!"
      redirect_to '/staff'
    end
  end
  
  def admin_view
    @patients = Patient.order(:id)
  end


  # GET /patients/1
  # GET /patients/1.json
  def show
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
    @patient = Patient.find(params[:id])
    # render :edit
  end

  # POST /patients
  # POST /patients.json
  def create
    # @patient = Patient.new(patient_params)
    # @numOfPatients = "number of patients"
    
    # respond_to do |format|
    #   if @patient.save
    #     @count = Patient.count-1
    #     flash[:numOfPatients] = "number of patients in the front: #{@count}"
    #     format.html { redirect_to patients_url, notice: "Estimated wait time : #{@count} hours"}
    #     format.json { render :show, status: :created, location: @patient }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @patient.errors, status: :unprocessable_entity }
    #   end
    # end
    time = Time.new.in_time_zone('Central Time (US & Canada)')
    flag = false
    flag1 = true
    res_hour = -1
    res_min = -1
    p_hour = -1
    p_minute = -1
    
    @patients = Patient.order(:id)
    @patients.each do |patient|
      p_time = patient.time.split(":")
      p_hour = p_time[0].to_i
      p_minute = p_time[1].to_i
      
      if ((p_hour > time.hour.to_i) or (p_hour == time.hour.to_i and p_minute > time.min.to_i)) and (patient.name.eql? "_name")
        flag = true
        res_hour = p_hour - time.hour.to_i
        res_min = p_minute - time.min.to_i
        
        if(res_min < 0)
          res_hour = res_hour - 1
          res_min = 60 + res_min
        end
        
        flag1 = patient.update(patient_params)
        # patient.update_attribute(:name, patient_params[:patient][:name])
        # patient.update_attribute(:number, patient_params[:patient][:number])
        break
      end
    end
    
    respond_to do |format|
      if flag and flag1
        format.html { redirect_to patients_url, notice: "Estimated wait time : #{res_hour} hours, #{res_min} minutes / tiempo estimado : #{res_hour} horas, #{res_min} minutos"}
      elsif !flag1
        flash[:notice] = "ERROR: No Duplicate entry allowed. Number can contain only 10 digits from 0-9."
        format.html { render :new}
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      else
        format.html { redirect_to patients_url, notice: "No more patient accepted, please come tomorrow"}
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    @patient= Patient.find(params[:id])
    
    if @patient.update(patient_params)
      @patients = Patient.order(:id)
      render :admin_view
    else
      render :edit
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      @count = Patient.count-1
      format.html { redirect_to patients_url, notice: "Estimated wait time : #{@count} hours"}
      format.json { head :no_content }
    end
  end
  
  def button
    Patient.delete_all
    
    Patient.create(:name => "_name", :number => "0000000000", :time => "9:00")
    Patient.create(:name => "_name", :number => "0000000001", :time => "9:30")
    Patient.create(:name => "_name", :number => "0000000002", :time => "10:00")
    Patient.create(:name => "_name", :number => "0000000003", :time => "10:30")
    Patient.create(:name => "_name", :number => "0000000004", :time => "11:00")
    Patient.create(:name => "_name", :number => "0000000005", :time => "11:30")
    Patient.create(:name => "_name", :number => "0000000006", :time => "12:00")
    Patient.create(:name => "_name", :number => "0000000007", :time => "12:30")
    Patient.create(:name => "_name", :number => "0000000008", :time => "13:00")
    Patient.create(:name => "_name", :number => "0000000009", :time => "13:30")
    Patient.create(:name => "_name", :number => "0000000010", :time => "14:00")
    Patient.create(:name => "_name", :number => "0000000011", :time => "14:30")
    Patient.create(:name => "_name", :number => "0000000012", :time => "15:00")
    Patient.create(:name => "_name", :number => "0000000013", :time => "15:30")
    Patient.create(:name => "_name", :number => "0000000014", :time => "16:00")
    Patient.create(:name => "_name", :number => "0000000015", :time => "16:30")
    Patient.create(:name => "_name", :number => "0000000016", :time => "17:00")
    Patient.create(:name => "_name", :number => "0000000017", :time => "17:30")
    Patient.create(:name => "_name", :number => "0000000018", :time => "18:00")
    
    @patients = Patient.order(:id)
    render 'admin_view'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:name, :number)
    end

    # def admin_params
    #   params.require(:admin).permit(:name)
    # end 
end
