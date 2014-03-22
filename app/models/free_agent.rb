class FreeAgent
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  POSITIONS = %w[Forward Defense Goaltender]
  PROGRAMS = %w[A B C D O30 Adult-Hockey-Skills Adult-Rookie-Class Tournament]
  LEVELS_PLAYED = [ 'Did Not Play As Youth',
                    'House / Rec League', 
                    'High School / Midget',
                    'ACHA / NCAA / Junior / Pro' ]
  
  def self.POSITIONS
    POSITIONS
  end
  
  def self.PROGRAMS
    PROGRAMS.collect{ |p| p.humanize }
  end
  
  def self.LEVELS_PLAYED
    LEVELS_PLAYED
  end
  
  
  
  attr_accessor :name, :email, :age, :phone_number, :position, :programs,:highest_level_played

  validates_presence_of :name, :email, :age, :phone_number, :position, :highest_level_played
  validates :age, :numericality => true
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
