class FreeAgent
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  POSITIONS = %w[Forward Defense Goaltender]
  PROGRAMS = %w[A B C D Over-30 Adult-Hockey-Skills Adult-Rookie-Class Dynamic-Skills]
  SKILL_LEVEL = %w[Advanced Intermediate Novice Beginner]
  LEVELS_PLAYED = [ 'Never played competitively, just pond hockey',
                    'Never played or skated until recently',
                    'Youth house league',
                    'Youth travel A/B hockey', 
                    'Youth travel tier 1 or tier 2',
                    'High School',
                    'Junior B/ Junior A tier 2 or 3',
                    'Junior A tier 1/ Major Junior',
                    'ACHA D2 or D3',
                    'ACHA D1/ NCAA D3',
                    'NCAA D1/ Minor Pro/ Euro Pro/ NHL' ]
  GOALS = [ 'Learn how to skate and play hockey',
            'Improve skills to transition from beginner to novice',
            'Improve skills to transition from novice to intermediate',
            'Play in the best and most competitive league that is suitable to my skill level',
            'Join a team and enjoy the camaraderie and exercise' ]
  
  def self.POSITIONS
    POSITIONS
  end
  
  def self.PROGRAMS
    PROGRAMS.collect{ |p| p.humanize }
  end
  
  def self.SKILL_LEVEL
    SKILL_LEVEL.collect{ |s| s.humanize }
  end
  
  def self.LEVELS_PLAYED
    LEVELS_PLAYED
  end
  
  def self.GOALS
    GOALS
  end  
  
  
  
  attr_accessor :name, :email, :date_of_birth, :phone_number, :position, :programs, :skill_level, :highest_level_played, :last_competitive_team, :last_adult_league_team, :goals

  validates_presence_of :name, :email, :date_of_birth, :phone_number, :position, :skill_level, :highest_level_played, :last_competitive_team, :last_adult_league_team
  validates_date :date_of_birth
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
