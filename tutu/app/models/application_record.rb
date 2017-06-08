class ApplicationRecord < ActiveRecord::Base
  include ActiveModel::Dirty
  
  self.abstract_class = true
end
