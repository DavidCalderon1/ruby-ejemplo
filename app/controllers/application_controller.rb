class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_meta

  private
    def set_meta
      @meta_title = 'Consultas Jurídicas'
      @meta_description = 'Razón legal es un sitio de consultas juridícas 
      que le dice dónde, cómo y qué hacer en sus trámite con la justicia 
      Colombiana. (Tutela, alimentos, divorcio, hurto, demanda civil, etc)'
    end
end
