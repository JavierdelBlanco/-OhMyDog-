class CampaniaDonacionsController < ApplicationController
  before_action :set_campania_donacion, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /campania_donacions or /campania_donacions.json
  def index
    @campania_donacions = CampaniaDonacion.all
  end

  # GET /campania_donacions/1 or /campania_donacions/1.json
  def show
  end

  # GET /campania_donacions/new
  def new
    @campania_donacion = CampaniaDonacion.new
  end

  # GET /campania_donacions/1/edit
  def edit
  end

  # POST /campania_donacions or /campania_donacions.json
  def create
    @fecha = Date.parse(params[:campania_donacion][:fecha])
    params = campania_donacion_params.except(:fecha)
    @campania_donacion = CampaniaDonacion.new(params)
    @campania_donacion.dia_limite = @fecha.day
    @campania_donacion.mes_limite = @fecha.month
    @campania_donacion.anio_limite = @fecha.year

    respond_to do |format|
      if @campania_donacion.save
        format.html { redirect_to ver_campanias_path, notice: "Se cargó la campaña correctamente." }
        format.json { render :show, status: :created, location: @campania_donacion }
      else
        flash[:alert] = "Falló la carga de la campaña."
        format.html { render :cargar, status: :unprocessable_entity }
        format.json { render json: @campania_donacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campania_donacions/1 or /campania_donacions/1.json
  def update
    @fecha = Date.parse(params[:campania_donacion][:fecha])
    params = campania_donacion_params.except(:fecha)
    @campania_donacion.dia_limite = @fecha.day
    @campania_donacion.mes_limite = @fecha.month
    @campania_donacion.anio_limite = @fecha.year
    respond_to do |format|
      if @campania_donacion.update(params)
        format.html { redirect_to ver_campanias_path, notice: "Se actualizó la campaña exitosamente." }
        format.json { render :show, status: :ok, location: @campania_donacion }
      else
        format.html { render :editar, status: :unprocessable_entity }
        format.json { render json: @campania_donacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campania_donacions/1 or /campania_donacions/1.json
  def destroy
    @campania_donacion.destroy!

    respond_to do |format|
      format.html { redirect_to ver_campanias_path, notice: "Se eliminó la campaña." }
      format.json { head :no_content }
    end
  end

  def cargar
    @campania_donacion = CampaniaDonacion.new
  end

  def editar
    @campania_donacion = CampaniaDonacion.find(params[:id])
    @fecha = Date.new(@campania_donacion.anio_limite, @campania_donacion.mes_limite, @campania_donacion.dia_limite)
  end

  def realizar_pago
    require 'mercadopago'
    nombre_campania = params[:nombre_campania]
    monto = params[:monto].to_f
    # Configurar MercadoPago con tus credenciales
    sdk = Mercadopago::SDK.new('APP_USR-2528404435302975-120515-ea5ff1627260ce802d0ab8d340f595e1-1579974650')

    # Redirigir al usuario a la página de pago de MercadoPago
    preference_data = {
      items: [
        {
          title: "Donacion para #{nombre_campania}",
          unit_price: monto,
          currency_id: 'ARS',
          quantity: 1
        }
      ],
      notification_url: 'https://7209-181-170-91-200.ngrok.io/webhooks',
      transaction_amount: monto,
      description: nombre_campania,
    }

    preference_response = sdk.preference.create(preference_data)
    preference = preference_response[:response]
    init_point = preference_response[:response]['init_point']

    redirect_to ver_campanias_path(init_point: init_point), allow_other_host: true

  end

def actualizar_donacion

  sdk = Mercadopago::SDK.new('APP_USR-2528404435302975-120515-ea5ff1627260ce802d0ab8d340f595e1-1579974650')
  payload = JSON.parse(request.body.read)
    # Dependiendo del evento que recibas (puede ser payment, merchant_order u otros),
    # puedes extraer información como el ID de pago, estado, etc.
    if payload['type'] == 'payment'
      payment_id = payload['data']['id']
      payment_info = sdk.payment.get(payment_id)

      monto = payment_info[:response]["additional_info"]["items"].first["unit_price"].to_f
      titulo = payment_info[:response]["additional_info"]["items"].first["title"]
      nombre_campania = titulo.sub(/^Donacion para /, '')

      # Buscar la campaña de donación por un identificador único, como el ID
      @campania_donacion = CampaniaDonacion.find_by(nombre: nombre_campania)

      # Verificar si se encontró la campaña de donación antes de actualizar el monto total
      if @campania_donacion
        @campania_donacion.monto_actual += monto
        @campania_donacion.save # Guardar el cambio en la base de datos
      else
        # Manejar el caso en que no se encuentre la campaña de donación
        # Puedes registrar un error, enviar una notificación, etc.
        puts "No se encontró la campaña de donación con el título: #{nombre_campania}"
      end
    end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campania_donacion
      @campania_donacion = CampaniaDonacion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def campania_donacion_params
      params.require(:campania_donacion).permit(:nombre, :motivo, :beneficiario, :monto_total, :monto_actual, :dia_limite, :mes_limite, :anio_limite, :imagen, :fecha)
    end
end
