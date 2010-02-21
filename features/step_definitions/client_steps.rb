Given /^I have clients named (.*)$/ do |names|
  names.split(',').each do |name|
    Client.create(:name => name)
  end
end
