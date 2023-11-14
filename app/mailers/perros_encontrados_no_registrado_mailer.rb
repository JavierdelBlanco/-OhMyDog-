class PerrosEncontradosNoRegistradoMailer < ApplicationMailer

  def enviar_correo_perros_encontrados_no_registrado(perro)
      @perro = perro
      mail(to: perro.mail, subject: 'identificador para poder administrar tu publicacion en OhMYDog.')
  end

end
