class RefereeRequest
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  attr_accessor :name, :email, :team_name, :team_level, :game_date, :game_time, :game_location, :on_ice_officials, :scorekeeper

  validates_presence_of :name, :email, :team_name, :team_level, :game_date, :game_time, :game_location, :on_ice_officials, :scorekeeper
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

end
