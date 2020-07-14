module Concerns::Findable
  
  def find_by_name(name)
    self.all.detect do |ins|
      ins.name == name
    end
  end
  
  def find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name)
    end
  end
end