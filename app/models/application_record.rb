class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def deletelater
  end
end
