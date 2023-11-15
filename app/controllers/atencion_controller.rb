class User::AtencionController

    def index
        if current_user.tipo_usuario == 'veterinario'
            @users = User.all
        else
            redirect_to root_path, alert: 'No tienes permisos para ver esta página.'
        end
    end

    def ver_perfil
        @users = User.all
    end


end
