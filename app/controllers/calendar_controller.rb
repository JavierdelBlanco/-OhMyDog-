class CalendarController < ApplicationController
  def index
    @veterinarias = VeterinariasDeGuardium.all
  end
end
