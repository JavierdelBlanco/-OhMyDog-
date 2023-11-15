class PerrosEncontrado < ApplicationRecord
  attr_accessor :action_type, :usuario_autenticado

  before_create :generate_token_if_not_registered
  after_create :enviar_correo_perros_encontrados_no_registrado

  has_one_attached :foto

  validates :foto, presence: true
  validates :nombre_dueno, presence: true
  validates :apellido_dueno, presence: true
  validates :direccion_dueno, presence: true
  validates :numero_dueno, presence: true

  validate :foto_content_type
  validate :validar_email
  validate :nombre_unico_para_usuario_actual

  def foto_content_type
    if foto.attached? && !foto.content_type.in?(%w(image/jpeg image/jpg image/png image/gif image/webp))
      errors.add(:foto, 'El formato de imagen no es válido.')
    end
  end

  def validar_email
    if !usuario_autenticado
      if mail.present?
        if !mail.include?('@')
          errors.add(:mail, 'El email debe contener el símbolo "@"')
        elsif User.exists?(email: mail)
          errors.add(:mail, 'Este email ya ha sido registrado en la veterinaria')
        else
          puts "Correo electrónico válido: #{mail}"
        end
      else
        puts "Correo electrónico no presente"
      end
    else
      puts "Usuario autenticado, no se valida el correo electrónico."
    end
  end


  def nombre_unico_para_usuario_actual
    if usuario_autenticado
      if action_type == 'create'
        if PerrosEncontrado.exists?(nombre: nombre, mail: mail, status: 'Se busca al dueño')
          errors.add(:nombre, "Ya tienes una publicacion con este nombre de perro!")
        end
      else
        existing_perro = PerrosEncontrado.find_by(nombre: nombre, mail: mail, status: 'Se busca al dueño')
        if existing_perro && existing_perro.id != id
          errors.add(:nombre, "Ya tienes una publicacion con este nombre de perro!.")
        end
      end
    end
  end

  private

  def generate_token_if_not_registered
    generate_token unless usuario_autenticado
  end

  def generate_token
    self.token = SecureRandom.urlsafe_base64
  end

  def enviar_correo_perros_encontrados_no_registrado

    #token = params[:token]
    #@perro = PerrosEncontrado.find_by(token: params[:token])

    if !self.usuario_autenticado
      PerrosEncontradosNoRegistradoMailer.enviar_correo_perros_encontrados_no_registrado(self).deliver_now
    end

  end

end
