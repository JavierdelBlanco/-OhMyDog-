class Perrito < ApplicationRecord
  validates :nombre, presence: true
  validates :caracteristicas, presence: true
  validates :condiciones, presence: true
  validates :raza, presence: true
  validates :color, presence: true
  validates :tamaño, presence: true

  has_many :historia_clinicas, dependent: :destroy
  belongs_to :user


  validates :nombre, uniqueness: { scope: [:user_id], message: 'ya está en uso para este usuario', if: :no_esta_fallecido? }

  def no_esta_fallecido?
    !fallecido
  end

  def tiene_historia_clinica_de_tipo?(tipo)
    historia_clinicas.any? { |hc| hc.tipo == tipo }
  end

  def self.enviar_vacunae
    puts 'Ejecutando runner'
    fecha_actual = Time.zone.now
    dia = fecha_actual.day
    mes = fecha_actual.month
    año = fecha_actual.year
    fecha = Date.new(año, mes, dia)

    perros = all
    perros.any? do |perro|
      fecha_perro = Date.new(perro.año, perro.mes, perro.dia)
      historias = perro.historia_clinicas
      vacunas = historias.where(tipoVacuna: 'vacunae')
      vacunas.any? do |vacuna|
        vacuna_fecha = Date.new(vacuna.año, vacuna.mes, vacuna.dia)
        puts 'Fecha vacuna'
        puts vacuna_fecha
        puts 'Fecha actual'
        puts fecha
        puts 'Resta'
        puts (fecha - vacuna_fecha).to_i
        if ((fecha - vacuna_fecha).to_i == 365)
          user_id = perro.user.id
          puts 'ID DEL PERRO'
          puts user_id
          PerritosMailer.notificar_refuerzo_vacunae(user_id).deliver_now
          puts 'Hay una vacuna antienfermedades para enviar mail'
        else
          puts 'Llegue por lo menos a comprobar esto'
        end
      end
    end
  end

  def self.enviar_vacunar
    puts 'Ejecutando runner'
    fecha_actual = Time.zone.now
    dia = fecha_actual.day
    mes = fecha_actual.month
    año = fecha_actual.year
    fecha = Date.new(año, mes, dia)

    perros = all
    perros.any? do |perro|
      fecha_perro = Date.new(perro.año, perro.mes, perro.dia)
      historias = perro.historia_clinicas
      vacunas = historias.where(tipoVacuna: 'vacunar')
      vacunas.any? do |vacuna|
        vacuna_fecha = Date.new(vacuna.año, vacuna.mes, vacuna.dia)
        puts 'Fecha vacuna'
        puts vacuna_fecha
        puts 'Fecha actual'
        puts fecha
        puts 'Resta'
        puts (fecha - vacuna_fecha).to_i
        if ((fecha - fecha_perro).to_i > 4*30)
          if ((fecha - vacuna_fecha).to_i == 365)
            user_id = perro.user.id
            puts 'ID DEL PERRO'
            puts user_id
            PerritosMailer.notificar_refuerzo_vacunar(user_id, perro.nombre).deliver_now
            puts 'Hay una vacuna antirrabica para enviar mail'
          end
        else
          if (((fecha - fecha_perro).to_i < 4*30) && ((fecha - fecha_perro).to_i > 2*30))
            if ((fecha - vacuna_fecha).to_i == 21)
              puts 'Hay vacuna antirrabica para notificar entre 2 y 4 meses, porque pasaron 21 dias'
              user_id = perro.user.id
              puts 'ID DEL USER'
              puts user_id
              PerritosMailer.notificar_refuerzo_vacunar(user_id, perro.nombre).deliver_now
            end
          end
        end

      end
    end
  end


end
