require 'aspect'

Aspect.define do

  with_instance_of(Portfolio).before(:save) do |instance|
    puts "before #{instance.class}#save"
  end

  with_instance_of(Portfolio).after(:save) do |instance|
    puts "after #{instance.class}#save"
  end

  with_class(Portfolio).before(:create) do |klass|
    puts "before #{klass}.create"
  end

  with_class(Portfolio).after(:create) do |klass|
    puts "after #{klass}.create"
  end

end


Aspect.define do

  with_instance_of(Gallery).before(:save) do |instance|
    puts "before #{instance.class}#save"
  end

  with_instance_of(Gallery).after(:save) do |instance|
    puts "after #{instance.class}#save"
  end

  with_class(Gallery).before(:create) do |klass|
    puts "before #{klass}.create"
  end

  with_class(Gallery).after(:create) do |klass|
    puts "after #{klass}.create"
  end

end