class Builder
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :prototype, :count

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
    parsed_prototype = ActiveSupport::JSON.decode(self.prototype)
    self.count.to_i.times.map do
      build_from_prototype(parsed_prototype)
    end
  end

  def build_from_prototype(prototype)
    instance = {}
    prototype.each do |field|
      field.each_pair do |name, value|
        instance[name] = case value
        when 'first_name'
          Faker::Name.first_name
        when 'last_name'
          Faker::Name.last_name
        else
          value
        end
      end
    end
    instance
  end
end