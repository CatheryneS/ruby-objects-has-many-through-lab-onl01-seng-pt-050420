class Patient
  attr_accessor :name 
  @@all = []
  
  def initialize(name)
    @name = name
    @@all.push(self)
  end
  
  def self.all
    @@all
  end
  
  def new_appointment(date, doctor)
    Appointment.new(date, self, doctor)
  end
  
  def appointments 
    Appointment.all.select {|app| app.patient == self}  
  end
  
  def doctors
    appointments.map(&:doctor) #{|app| app.doctor}
  end
end