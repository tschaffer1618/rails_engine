class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.random
    count = self.count
    random_offset = rand(count)
    random_resource = self.offset(random_offset).first
  end
end
