# Purpose: Abstract class for all models to inherit from
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end
