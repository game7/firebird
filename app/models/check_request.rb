class CheckRequest
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  attr_accessor :first, :last, :email, :phone_number, :team_name, :team_level, :date_needed, :team_expense, :amount, :payable_to, :delivery_method, :mailing_address

  validates_presence_of :first, :last, :email, :phone_number, :team_name, :team_level, :date_needed, :team_expense, :amount, :payable_to, :delivery_method
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
