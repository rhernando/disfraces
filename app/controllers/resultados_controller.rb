class ResultadosController < ApplicationController
  before_filter :authenticate_user!
  def generar
    if current_user.admin?
      disfraces = Disfraz.all.sort_by { rand }
      User.all.each do |u|


        u.disfraz = disfraces.pop

        u.save!

        flash.now[:notice] = 'Resultado generados'
      end
    else
      flash.now[:error] = 'No eres administrador'
    end
  end

  def ver
    return if current_user.disfraz.blank?


    @disfraz = Disfraz.find current_user.disfraz
    @otros = @disfraz.users
  end

  def total_usuarios
    @usuarios = User.all
  end
end
