class DashboardsController < ApplicationController
  def index
    @processos = Processo.all
    @riscos = Risco.all
    @controles = Controle.all
  end
end
