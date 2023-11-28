class HistoriaClinicasController < ApplicationController
  before_action :set_historia_clinica, only: %i[ show edit update destroy ]

  # GET /historia_clinicas or /historia_clinicas.json
  def index
    @historia_clinicas = HistoriaClinica.all
  end

  # GET /historia_clinicas/1 or /historia_clinicas/1.json
  def show
  end

  # GET /historia_clinicas/new
  def new
    @historia_clinica = HistoriaClinica.new
  end

  def new_castracion
    @historia_clinica = HistoriaClinica.new
    @perrito = Perrito.find(params[:id])
    @tipo = params[:tipo]
    @user = User.find(params[:user_id])
  end

  def new_desparasitacion
    @historia_clinica = HistoriaClinica.new
    @perrito = Perrito.find(params[:id])
    @tipo = params[:tipo]
    @user = User.find(params[:user_id])
    puts '########################'
    puts 'USER ID NEW DESPARASITACION'
    puts @user.id
  end

  def new_atencion_clinica
    @historia_clinica = HistoriaClinica.new
    @perrito = Perrito.find(params[:id])
    @tipo = params[:tipo]
    @user = User.find(params[:user_id])
  end

  def new_vacunae
    @historia_clinica = HistoriaClinica.new
    @perrito = Perrito.find(params[:id])
    @tipo = params[:tipo]
    @user = User.find(params[:user_id])
  end

  def new_vacunar
    @historia_clinica = HistoriaClinica.new
    @perrito = Perrito.find(params[:id])
    @tipo = params[:tipo]
    @user = User.find(params[:user_id])
  end

  # GET /historia_clinicas/1/edit
  def edit
  end

  # POST /historia_clinicas or /historia_clinicas.json
  def create
    puts '###################################'
    puts 'ENTRE A CREATE SOLO'
    puts 'VALOR DE quien'
    @quien = params[:historia_clinica][:quien]
    puts @quien
    if (@quien == 'ajeno')
      @user = User.find(params[:historia_clinica][:user_id])
    else
      @user = current_user
    end
    puts '####################################'
    puts 'USER ID EN CREATE'
    puts @user.id
    perrito_id = params[:historia_clinica][:id]
    @perrito = Perrito.find(perrito_id)
    parametros = historia_clinica_params.except(:id, :quien, :user_id, :fecha)
    @historia_clinica = @perrito.historia_clinicas.build(parametros)
    @fecha = Date.parse(params[:historia_clinica][:fecha])
    @historia_clinica.dia = @fecha.day
    @historia_clinica.mes = @fecha.month
    @historia_clinica.año = @fecha.year
    respond_to do |format|
      if @historia_clinica.save
        if (@quien == 'ajeno')
          format.html { redirect_to ver_perrito_ajeno_path(@perrito, user_id: @user.id), notice: 'Se registró la historia clínica con éxito.' }
        else
          format.html { redirect_to ver_perrito_path(@perrito, user: current_user), notice: 'Se registró la historia clínica con éxito.' }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @historia_clinica.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_vacunae
    puts '###################################'
    puts 'ENTRE A CREATE_VACUNAE'
    puts 'VALOR DE quien'
    @quien = params[:historia_clinica][:quien]
    puts @quien
    if (@quien == 'ajeno')
      @user = User.find(params[:historia_clinica][:user_id])
    else
      @user = current_user
    end
    perrito_id = params[:historia_clinica][:id]
    @perrito = Perrito.find(perrito_id)
    @historias = @perrito.historia_clinicas
    fecha_perrito = Date.new(@perrito.año, @perrito.mes, @perrito.dia)
    fecha_historia_clinica = Date.new(params[:historia_clinica][:año].to_i, params[:historia_clinica][:mes].to_i, params[:historia_clinica][:dia].to_i)
    if((fecha_historia_clinica - fecha_perrito).to_i > 4*30)
      vacunase_validas?(params[:historia_clinica])
      if (@puede)
        parametros = historia_clinica_params.except(:id, :quien, :user_id, :fecha)
        @historia_clinica = @perrito.historia_clinicas.build(parametros)
        @fecha = Date.parse(params[:historia_clinica][:fecha])
        @historia_clinica.dia = @fecha.day
        @historia_clinica.mes = @fecha.month
        @historia_clinca.año = @fecha.year
    
        respond_to do |format|
          if @historia_clinica.save
            if (@quien == 'ajeno')
              format.html { redirect_to ver_perrito_ajeno_path(@perrito, user_id: @user.id), notice: 'Se registró la historia clínica con éxito.' }
            else
              format.html { redirect_to ver_perrito_path(@perrito, user: current_user), notice: 'Se registró la historia clínica con éxito.' }
            end
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @historia_clinica.errors, status: :unprocessable_entity }
          end
        end
      else
        flash[:alert] = 'Fallo la carga de la vacunación: el perro se vacuno hace menos de 1 año'
        redirect_to ver_perrito_path(@perrito, @user)
      end
    else
      flash[:alert] = 'Fallo la carga de la vacunación: el perro tiene menos de 4 meses'
      redirect_to ver_perrito_path(@perrito, @user)
    end
  end

  def create_vacunar
    puts '###################################'
    puts 'ENTRE A CREATE_VACUNAR'
    @quien = params[:historia_clinica][:quien]
    if (@quien == 'ajeno')
      @user = User.find(params[:historia_clinica][:user_id])
    else
      @user = current_user
    end
    perrito_id = params[:historia_clinica][:id]
    @perrito = Perrito.find(perrito_id)
    @historias = @perrito.historia_clinicas
    fecha_perrito = Date.new(@perrito.año, @perrito.mes, @perrito.dia)
    fecha_historia_clinica = Date.new(params[:historia_clinica][:año].to_i, params[:historia_clinica][:mes].to_i, params[:historia_clinica][:dia].to_i)
    #CASO ENTRE 2 Y 4 MESES (FALTA CHECKEAR SI SE DIO UNA VACUNA 21 DIAS ANTES)
    if ((fecha_historia_clinica - fecha_perrito).to_i > 2 * 30 && (fecha_historia_clinica - fecha_perrito).to_i < 4 * 30)
      #Checkeo si se dio una vacuna hace menos de 21 dias
      puts '#####################################'
      puts 'ENTRE AL IF DE ENTRE 2 Y 4 MESES'
      vacunasr_validas_2_a_4_meses?(params[:historia_clinica])
      if (@puede)
        parametros = historia_clinica_params.except(:id, :quien, :user_id, :fecha)
        @historia_clinica = @perrito.historia_clinicas.build(parametros)
        @fecha = Date.parse(params[:historia_clinica][:fecha])
        @historia_clinica.dia = @fecha.day
        @historia_clinica.mes = @fecha.month
        @historia_clinca.año = @fecha.year
    
        respond_to do |format|
          if @historia_clinica.save
            if (@quien == 'ajeno')
              format.html { redirect_to ver_perrito_ajeno_path(@perrito, user_id: @user.id), notice: 'Se registró la historia clínica con éxito.' }
            else
              format.html { redirect_to ver_perrito_path(@perrito, user: current_user), notice: 'Se registró la historia clínica con éxito.' }
            end
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @historia_clinica.errors, status: :unprocessable_entity }
          end
        end
      else
        flash[:alert] = 'Fallo la carga de la vacunación: el perro se vacunó hace menos de 21 dias'
        redirect_to ver_perrito_path(@perrito, @user)
      end
    else
      #CASO MAYOR A 4 MESES (FALTA CHECKEAR SI SE DIO UNA VACUNA UN AÑO ANTES)
      if((fecha_historia_clinica - fecha_perrito).to_i > 4 * 30)
        #Checkeo si se dio una vacuna hace menos de 1 año
        puts '#################################################'
        puts 'ENTRE AL IF MAYOR A 4 MESES'
        vacunas_validas?(params[:historia_clinica])
        if (@puede)
          parametros = historia_clinica_params.except(:id, :quien, :user_id, :fecha)
          @historia_clinica = @perrito.historia_clinicas.build(parametros)
          @fecha = Date.parse(params[:historia_clinica][:fecha])
          @historia_clinica.dia = @fecha.day
          @historia_clinica.mes = @fecha.month
          @historia_clinca.año = @fecha.year
      
          respond_to do |format|
            if @historia_clinica.save
              if (@quien == 'ajeno')
                format.html { redirect_to ver_perrito_ajeno_path(@perrito, user_id: @user.id), notice: 'Se registró la historia clínica con éxito.' }
              else
                format.html { redirect_to ver_perrito_path(@perrito, user: current_user), notice: 'Se registró la historia clínica con éxito.' }
              end
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @historia_clinica.errors, status: :unprocessable_entity }
            end
          end
        else
          flash[:alert] = 'Fallo la carga de la vacunación: el perro se vacunó hace menos de 1 año'
          redirect_to ver_perrito_path(@perrito, @user)
        end
      else
        flash[:alert] = 'Fallo la carga de la vacunación: el perro posee menos de 2 meses de vida'
        redirect_to ver_perrito_path(@perrito, @user)
      end

    end
  end

  # PATCH/PUT /historia_clinicas/1 or /historia_clinicas/1.json
  def update
    respond_to do |format|
      if @historia_clinica.update(historia_clinica_params)
        format.html { redirect_to historia_clinica_url(@historia_clinica), notice: "Historia clinica was successfully updated." }
        format.json { render :show, status: :ok, location: @historia_clinica }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @historia_clinica.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /historia_clinicas/1 or /historia_clinicas/1.json
  def destroy
    @historia_clinica.destroy!

    respond_to do |format|
      format.html { redirect_to historia_clinicas_url, notice: "Historia clinica was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def ver_castracion
    @historia_clinica = HistoriaClinica.find(params[:historia])
    @perrito = Perrito.find(params[:perrito_id])
    @user = User.find(params[:user_id])
  end

  def ver_desparasitacion
    @historia_clinica = HistoriaClinica.find(params[:historia])
    @perrito = Perrito.find(params[:perrito_id])
    @user = User.find(params[:user_id])
  end

  def ver_atencion
    @historia_clinica = HistoriaClinica.find(params[:historia])
    @perrito = Perrito.find(params[:perrito_id])
    @user = User.find(params[:user_id])
  end

  def ver_vacunae
    @historia_clinica = HistoriaClinica.find(params[:historia])
    @perrito = Perrito.find(params[:perrito_id])
    @user = User.find(params[:user_id])
  end

  def ver_vacunar
    @historia_clinica = HistoriaClinica.find(params[:historia])
    @perrito = Perrito.find(params[:perrito_id])
    @user = User.find(params[:user_id])
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historia_clinica
      @historia_clinica = HistoriaClinica.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def historia_clinica_params
      params.require(:historia_clinica).permit(:id, :tipo, :dia, :mes, :año, :detalle, :tipoVacuna, :lote, :dosis, :producto, :sintomas, :diagnostico, :tratamiento, :quien, :user_id, :fecha)
    end

    def vacunasr_validas_2_a_4_meses?(params_historia_clinica)
      fecha_historia_clinica = Date.new(params_historia_clinica[:año].to_i, params_historia_clinica[:mes].to_i, params_historia_clinica[:dia].to_i)
      # Obtener todas las vacunas del tipo 'vacunar' del perrito
      vacunas = @perrito.historia_clinicas.where(tipoVacuna: 'vacunar')
      @puede = true
      # Verificar que la nueva fecha sea válida respecto a todas las vacunas existentes
      result = vacunas.any? do |vacuna|
        vacuna_fecha = Date.new(vacuna.año, vacuna.mes, vacuna.dia)
        (fecha_historia_clinica - vacuna_fecha).to_i > 365
        puts '#################'
        puts 'Fecha historia clinica'
        puts fecha_historia_clinica
        puts 'Fecha vacuna'
        puts vacuna_fecha
        puts 'RESTA'
        puts (fecha_historia_clinica - vacuna_fecha).to_i
        if (((fecha_historia_clinica - vacuna_fecha).to_i) < 21 && ((fecha_historia_clinica - vacuna_fecha).to_i) > 0)
          @puede = false
        end
        puts @puede
      end
    end

    def vacunas_validas?(params_historia_clinica)
      fecha_historia_clinica = Date.new(params_historia_clinica[:año].to_i, params_historia_clinica[:mes].to_i, params_historia_clinica[:dia].to_i)
      # Obtener todas las vacunas del tipo 'vacunar' del perrito
      vacunas = @perrito.historia_clinicas.where(tipoVacuna: 'vacunar')
      @puede = true
      # Verificar que la nueva fecha sea válida respecto a todas las vacunas existentes
      result = vacunas.any? do |vacuna|
        vacuna_fecha = Date.new(vacuna.año, vacuna.mes, vacuna.dia)
        (fecha_historia_clinica - vacuna_fecha).to_i > 365
        puts (fecha_historia_clinica - vacuna_fecha).to_i
        if (((fecha_historia_clinica - vacuna_fecha).to_i) < 365)
          @puede = false
        end
        puts @puede
      end
    end

    def vacunase_validas?(params_historia_clinica)
      fecha_historia_clinica = Date.new(params_historia_clinica[:año].to_i, params_historia_clinica[:mes].to_i, params_historia_clinica[:dia].to_i)
      # Obtener todas las vacunas del tipo 'vacunae' del perrito
      vacunas = @perrito.historia_clinicas.where(tipoVacuna: 'vacunae')
      @puede = true
      # Verificar que la nueva fecha sea válida respecto a todas las vacunas existentes
      result = vacunas.any? do |vacuna|
        vacuna_fecha = Date.new(vacuna.año, vacuna.mes, vacuna.dia)
        puts (fecha_historia_clinica - vacuna_fecha).to_i
        if (((fecha_historia_clinica - vacuna_fecha).to_i) < 365)
          @puede = false
        end
        puts @puede
      end
    end
end
