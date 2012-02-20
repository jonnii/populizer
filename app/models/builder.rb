class Builder
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :prototype

  validates_presence_of :prototype

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def persisted?
    false
  end


  def make
    result = {}

    schema =  ActiveSupport::JSON.decode(self.prototype)

    schema.each do |field|
      field.each_pair do |name, value|
        result[name] = case value
        when 'first_name'
          Faker::Name.first_name
        when 'last_name'
          Faker::Name.last_name
        else
          value
        end
      end
    end

    result
  end
end