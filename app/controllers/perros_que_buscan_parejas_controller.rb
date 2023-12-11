class PerrosQueBuscanParejasController < ApplicationController
  before_action :set_perros_que_buscan_pareja, only: %i[ show edit update destroy ]
  include PerrosQueBuscanParejasHelper

  # GET /perros_que_buscan_parejas or /perros_que_buscan_parejas.json
  def index
    @perros_del_usuario = Perrito.where(user_id: current_user.id, fallecido: false).order(postulado: :desc)
  end

  # GET /perros_que_buscan_parejas/1 or /perros_que_buscan_parejas/1.json
  def show
  end

  # GET /perros_que_buscan_parejas/new
  def new
    @perros_que_buscan_pareja = PerrosQueBuscanPareja.new
  end

  # GET /perros_que_buscan_parejas/1/edit
  def edit
  end

  # POST /perros_que_buscan_parejas or /perros_que_buscan_parejas.json
  def create
    @perros_que_buscan_pareja = PerrosQueBuscanPareja.new(perros_que_buscan_pareja_params)

    respond_to do |format|
      if @perros_que_buscan_pareja.save
        format.html { redirect_to perros_que_buscan_pareja_url(@perros_que_buscan_pareja), notice: "Perros que buscan pareja was successfully created." }
        format.json { render :show, status: :created, location: @perros_que_buscan_pareja }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @perros_que_buscan_pareja.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /perros_que_buscan_parejas/1 or /perros_que_buscan_parejas/1.json
  def update
    respond_to do |format|
      if @perros_que_buscan_pareja.update(perros_que_buscan_pareja_params)
        format.html { redirect_to perros_que_buscan_parejas_path, notice: "Perros que buscan pareja was successfully updated." }
        format.json { render :show, status: :ok, location: @perros_que_buscan_pareja }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @perros_que_buscan_pareja.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perros_que_buscan_parejas/1 or /perros_que_buscan_parejas/1.json
  def destroy
    @perros_que_buscan_pareja.destroy!

    respond_to do |format|
      format.html { redirect_to perros_que_buscan_parejas_url, notice: "Perros que buscan pareja was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # En tu controlador o un archivo de ayuda
  def calcular_edad(dia, mes, año)
    fecha_nacimiento = Date.new(año, mes, dia)
    fecha_actual = Date.current
    edad = fecha_actual.year - fecha_nacimiento.year - (fecha_actual.month > fecha_nacimiento.month || (fecha_actual.month == fecha_nacimiento.month && fecha_actual.day >= fecha_nacimiento.day) ? 0 : 1)
    edad.positive? ? edad : 0
  end

  def postular
    @perro = Perrito.find(params[:id])

    # Actualizar los datos del perro con los ingresados en el formulario
    @perro.update(perrito_params)

    # Cambiar el estado de postulado a true
    @perro.update(postulado: true)

    # Redirigir a la página de detalles del perro
    redirect_to perros_que_buscan_parejas_path, notice: "Has postulado a #{@perro.nombre} para la busqueda de pareja."
  end

  def retirar
    @perro = Perrito.find(params[:id])

    # Eliminar registros de liked_dogs
    # LikedDog.where("perro_id = ? OR liked_dog_id = ?", @perro.id, @perro.id).destroy_all
    # Eliminar solo los ME GUSTA del PERRO
     LikedDog.where("perro_id = ?", @perro.id).destroy_all

    # Eliminar registros de disliked_dogs
    # DislikedDog.where("perro_id = ? OR disliked_dog_id = ?", @perro.id, @perro.id).destroy_all

    # Cambiar el estado de postulado a true
    @perro.update(postulado: false)

    # Redirigir a la página de detalles del perro
    redirect_to perros_que_buscan_parejas_path, notice: "Has retirado a #{@perro.nombre} de la busqueda de pareja."
  end

  def buscar_pareja
    @user_dog = Perrito.find(params[:id])
    puts "Debug: #{@user_dog.inspect}"
    @perros_que_le_gustan = LikedDog.where(perro_id: @user_dog.id).pluck(:liked_dog_id)
    #@perros_que_no_le_gustan = DislikedDog.where(perro_id: @user_dog.id).pluck(:disliked_dog_id)
  
    opposite_sex = @user_dog.sexo == 'macho' ? 'hembra' : 'macho'
  
    # perros_gustados_ids = LikedDog.where(perro_id: @user_dog.id).pluck(:liked_dog_id)
    perros_disgustados_ids = DislikedDog.where(perro_id: @user_dog.id).pluck(:disliked_dog_id)
    perros_que_me_dieron_no_me_gusta = DislikedDog.where(disliked_dog_id: @user_dog.id).pluck(:perro_id)

    perros_a_los_que_le_di_me_gusta_ids = LikedDog.where(perro_id: @user_dog.id).pluck(:liked_dog_id)
    perros_a_los_que_le_di_me_gusta_que_me_dieron_me_gusta_ids = LikedDog.where(perro_id: perros_a_los_que_le_di_me_gusta_ids, liked_dog_id: @user_dog.id).pluck(:perro_id)

  
    user_dog_raza = @user_dog.raza
    user_dog_tamano = @user_dog.tamaño
  
    # Priorizar PRIMERO RAZA, SEGUNDO MENOR DIFERENCIA DE EDAD (falta este), TERCERO MISMO TAMAÑO
    @all_dogs = Perrito
      .where.not(user_id: @user_dog.user_id)
      .where(sexo: opposite_sex, fallecido: false, postulado: true)
      .where.not(id: perros_disgustados_ids)
      .where.not(id: perros_que_me_dieron_no_me_gusta)
      .where.not(id: perros_a_los_que_le_di_me_gusta_que_me_dieron_me_gusta_ids)
      .order(
        Arel.sql("CASE WHEN raza = '#{user_dog_raza}' THEN 0 ELSE 1 END"),
        Arel.sql("CASE WHEN tamaño = '#{user_dog_tamano}' THEN 0 ELSE 1 END"))

  end

  def me_gusta
    # Obtén los parámetros del formulario
    user_dog_id = params[:user_dog_id]
    perro_id = params[:perro_id]
    called_from_buscar_pareja = params[:from_buscar_pareja]

    puts "user_dog_id: #{user_dog_id}"
    puts "perro_id: #{perro_id}"

    @user_dog = Perrito.find(params[:user_dog_id])
    perro_gustado = Perrito.find(perro_id)

    # Verifica si el perro no está en la lista de DislikedDogs
    unless DislikedDog.exists?(perro_id: perro_id, disliked_dog_id: user_dog_id)
      # Si el perro no esta en la tabla de disliked dogs, lo agrega a la tabla liked dogs
      LikedDog.create(perro_id: user_dog_id, liked_dog_id: perro_id)
      puts "¡Perro añadido a la lista de liked dogs!"
      # Redirige o realiza cualquier acción adicional que necesites

      if LikedDog.exists?(perro_id: perro_id, liked_dog_id: user_dog_id)
        # Matcheo formado
        match_notice = "¡Matcheo formado entre #{@user_dog.nombre} y #{perro_gustado.nombre}!"
        MatchMailer.enviar_correo_match(@user_dog, perro_gustado).deliver_later
        MatchMailer.enviar_correo_match(perro_gustado, @user_dog).deliver_later
      else  
        match_notice = "¡Le diste Me gusta a #{perro_gustado.nombre}!"
      end

      if called_from_buscar_pareja == 'true'
        redirect_to buscar_pareja_perros_que_buscan_pareja_path(@user_dog), notice: match_notice
      else
        redirect_to ver_perros_que_me_dieron_me_gusta_perros_que_buscan_pareja_path(@user_dog), notice: match_notice
      end
    else
      puts "Este perro te ha dado no me gusta."

      if called_from_buscar_pareja == 'true'
        redirect_to buscar_pareja_perros_que_buscan_pareja_path(@user_dog), notice: "Lo sentimos, pero #{perro_gustado.nombre} te ha dado No me gusta."
      else
        redirect_to ver_perros_que_me_dieron_me_gusta_perros_que_buscan_pareja_path(@user_dog), notice: "Lo sentimos, pero #{perro_gustado.nombre} te ha dado No me gusta."
      end
    end
  end
  
  def ya_no_me_gusta
    # Obtén los parámetros del formulario
    user_dog_id = params[:user_dog_id]
    perro_id = params[:perro_id]
    called_from_buscar_pareja = params[:from_buscar_pareja]

    liked_dog = LikedDog.find_by(perro_id: user_dog_id, liked_dog_id: perro_id)
    liked_dog.destroy if liked_dog.present?
    
    @user_dog = Perrito.find(params[:user_dog_id])
    perro_gustado = Perrito.find(perro_id)

    if called_from_buscar_pareja == 'true'
      redirect_to buscar_pareja_perros_que_buscan_pareja_path(@user_dog), notice: "Ya no te gusta #{perro_gustado.nombre}."
    else
      redirect_to ver_los_matcheos_de_mi_perro_perros_que_buscan_pareja_path(@user_dog), notice: "Ya no te gusta #{perro_gustado.nombre}."
    end
  end

  def no_me_gusta
    # Obtén los parámetros del formulario
    user_dog_id = params[:user_dog_id]
    perro_id = params[:perro_id]
    called_from_buscar_pareja = params[:from_buscar_pareja]

    DislikedDog.create(perro_id: user_dog_id, disliked_dog_id: perro_id)

    # Redirige o realiza cualquier acción adicional que necesites
    @user_dog = Perrito.find(params[:user_dog_id])
    perro_no_gustado = Perrito.find(perro_id)

    if called_from_buscar_pareja == 'true'
      redirect_to buscar_pareja_perros_que_buscan_pareja_path(@user_dog), notice: "Le diste No me gusta a #{perro_no_gustado.nombre}."
    else
      redirect_to ver_perros_que_me_dieron_me_gusta_perros_que_buscan_pareja_path(@user_dog), notice: "Le diste No me gusta a #{perro_no_gustado.nombre}."
    end
  end

  def ver_mis_no_me_gusta

    @user_dog = Perrito.find(params[:id])

    perros_disgustados_ids = DislikedDog.where(perro_id: @user_dog.id).pluck(:disliked_dog_id)
    @perros_disgustados = Perrito.where(id: perros_disgustados_ids)
  end

  def retirar_no_me_gusta
    # Obtén los parámetros del formulario
    user_dog_id = params[:user_dog_id]
    perro_id = params[:perro_id]

    disliked_dog = DislikedDog.find_by(perro_id: user_dog_id, disliked_dog_id: perro_id)
    disliked_dog.destroy if disliked_dog.present?
    
    @user_dog = Perrito.find(params[:user_dog_id])
    perro_no_gustado = Perrito.find(perro_id)
    redirect_to ver_mis_no_me_gusta_perros_que_buscan_pareja_path(@user_dog), notice: "Retiraste el No me gusta a #{perro_no_gustado.nombre}."
  end
  
  def ver_perros_que_me_dieron_me_gusta

    @user_dog = Perrito.find(params[:id])

    perros_que_me_dieron_me_gusta_ids = LikedDog.where(liked_dog_id: @user_dog.id).pluck(:perro_id)
    perros_a_los_que_le_di_me_gusta_ids = LikedDog.where(perro_id: @user_dog.id).pluck(:liked_dog_id)
    perros_a_los_que_le_di__no_me_gusta_ids = DislikedDog.where(perro_id: @user_dog.id).pluck(:disliked_dog_id)

    @perros_que_me_dieron_me_gusta = Perrito.where(id: perros_que_me_dieron_me_gusta_ids).where.not(id: perros_a_los_que_le_di_me_gusta_ids).where.not(id: perros_a_los_que_le_di__no_me_gusta_ids)
  end
  
  def ver_los_matcheos_de_mi_perro

    @user_dog = Perrito.find(params[:id])

    perros_a_los_que_le_di_me_gusta_ids = LikedDog.where(perro_id: @user_dog.id).pluck(:liked_dog_id)
    perros_a_los_que_le_di_me_gusta_que_me_dieron_me_gusta_ids = LikedDog.where(perro_id: perros_a_los_que_le_di_me_gusta_ids, liked_dog_id: @user_dog.id).pluck(:perro_id)

    @matches = Perrito.where(id: perros_a_los_que_le_di_me_gusta_que_me_dieron_me_gusta_ids)
  end
  
  
  
  


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_perros_que_buscan_pareja
      @perros_que_buscan_pareja = Perrito.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def perrito_params
      params.require(:perrito).permit(:nombre, :dia, :mes, :año, :caracteristicas, :condiciones, :raza, :sexo, :color, :tamaño, :user_id, :fallecido, :tipo, :foto, :descripcion, :postulado, :fecha_celo_inicio)
    end
end
