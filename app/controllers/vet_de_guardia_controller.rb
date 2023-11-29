class VetDeGuardiaController < ApplicationController
  before_action :set_vet_de_guardium, only: %i[ show edit update destroy ]

  # GET /vet_de_guardia or /vet_de_guardia.json
  def index
    showNextMonth = params[:show_next_month].present?
    
    current_month_range = Time.current.beginning_of_month..Time.current.end_of_month
    @veterinarias = VetDeGuardium.where(dia: current_month_range)
    puts "Rango de fechas: #{current_month_range}"
    @events = @veterinarias.map do |veterinaria|
      {
        dia: veterinaria.dia,
        telefono: veterinaria.telefono,
        mail: veterinaria.mail,
        direccion: veterinaria.direccion,
        id: veterinaria.id # Agregamos el ID de la veterinaria
      }
    end
  
    puts "Eventos #{I18n.l(Time.current, format: '%B').upcase}: #{@events.inspect}"
    
    next_month_range = Time.current.beginning_of_month.next_month..Time.current.end_of_month.next_month.end_of_month
    @veterinarias_next_month = VetDeGuardium.where(dia: next_month_range)
    puts "Rango de fechas: #{next_month_range}"
  
    @events_next_month = @veterinarias_next_month.map do |veterinaria|
      {
        dia: veterinaria.dia,
        telefono: veterinaria.telefono,
        mail: veterinaria.mail,
        direccion: veterinaria.direccion,
        id: veterinaria.id # Agregamos el ID de la veterinaria
      }
    end
  
    puts "Eventos #{I18n.l(Time.current.next_month, format: '%B').upcase}: #{@events_next_month.inspect}"
  
    render locals: { show_next_month: showNextMonth, current_month_name: I18n.l(Time.current, format: '%B'), next_month_name: I18n.l(Time.current.next_month, format: '%B') }
  end
  
  

  # GET /vet_de_guardia/1 or /vet_de_guardia/1.json
  def show
  end

  # GET /vet_de_guardia/new
  def new
    @vet_de_guardium = VetDeGuardium.new
  end

  # GET /vet_de_guardia/1/edit
  def edit
  end

  # POST /vet_de_guardia or /vet_de_guardia.json
  def create
    @vet_de_guardium = VetDeGuardium.new(vet_de_guardium_params)

    @vet_de_guardium.action_type = 'create'

    respond_to do |format|
      if @vet_de_guardium.save
        format.html { redirect_to vet_de_guardia_path, notice: "Se ha agregado la veterinaria de guardia exitosamente." }
        format.json { render :show, status: :created, location: @vet_de_guardium }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vet_de_guardium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vet_de_guardia/1 or /vet_de_guardia/1.json
  def update
    respond_to do |format|
      if @vet_de_guardium.update(vet_de_guardium_params)
        format.html { redirect_to vet_de_guardia_path, notice: "Se ha actualizado la veterinaria de guardia exitosamente." }
        format.json { render :show, status: :ok, location: @vet_de_guardium }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vet_de_guardium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vet_de_guardia/1 or /vet_de_guardia/1.json
  def destroy
    puts "Destroy action called for VetDeGuardium with ID #{params[:id]}"

    @vet_de_guardium = VetDeGuardium.find(params[:id])
    @vet_de_guardium.destroy!

    respond_to do |format|
      format.html { redirect_to vet_de_guardia_url, notice: "Se ha eliminado la veterinaria de guardia exitosamente." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vet_de_guardium
      @vet_de_guardium = VetDeGuardium.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vet_de_guardium_params
      params.require(:vet_de_guardium).permit(:foto, :dia, :telefono, :mail, :direccion)
    end
end
