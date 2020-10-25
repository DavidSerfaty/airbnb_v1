class Reservation < ApplicationRecord
  validates :start_date, :presence => { :message => "must be a valid date/time" }
  validates :end_date, :presence => {:message => "must be a valid date/time"}
  validate :start_must_be_before_end_time

  belongs_to :listing
  belongs_to :guest, class_name: "User"

  def start_must_be_before_end_time
    errors.add(:end_date, "must be after start time") unless
       start_date < end_date
  end

  def duration
    ((end_date - start_date)/3600)/24
  end

  def total_price
    listing.price * duration
  end


  # def overlaping_reservation?(datetime)
  #   Reservation.all.each do |reservation|
  #
  #   end
  # end

end
