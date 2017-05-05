class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to  :attraction

  def user
    User.find(user_id)
  end

  def attraction
    Attraction.find(attraction_id)
  end

  def take_ride
    if ok_to_ride[:user_ride_eligible]
      update_user_tickets
      update_user_nausea
      update_user_happiness
    end
    ok_to_ride[:response_to_user]
  end

  def update_user_tickets
    user.update(tickets: user.tickets -= attraction.tickets)
  end

  def update_user_nausea
    user.update(nausea: user.nausea += attraction.nausea_rating)
  end

  def update_user_happiness
    user.update(happiness: user.happiness += attraction.happiness_rating)
  end

  def ok_to_ride
    if !tickets? && !height?
      {user_ride_eligible: false, response_to_user: "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."}
    elsif !tickets? && height?
      {user_ride_eligible: false, response_to_user: "Sorry. You do not have enough tickets to ride the #{attraction.name}."}
    elsif tickets? && !height?
      {user_ride_eligible: false, response_to_user: "Sorry. You are not tall enough to ride the #{attraction.name}."}
    else
      {user_ride_eligible: true, response_to_user: "Jump on board."}
    end
  end

  def tickets?
    User.find(user_id).tickets >= Attraction.find(attraction_id).tickets
  end

  def height?
    User.find(user_id).height >= Attraction.find(attraction_id).min_height
  end


end
