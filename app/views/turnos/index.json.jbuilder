json.array! @turnos, partial: "turnos/turno", as: :turno
json.partial! "turnos/turno", turno: @turno
