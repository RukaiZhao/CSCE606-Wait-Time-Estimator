Given /the following patients exist/ do |patients_table|
  patients_table.hashes.each do |patient|
      Patient.create!(patient)
  end
end

When (/^I direct to the signin page$/) do
    visit root_path
end

When (/^I direct to the admin page$/) do
    visit staff_path
end

Then /^I must be on admin page$/ do
    visit staff_path
end

Then /^I shoud be on signin page$/ do
    visit root_path
end

Then /^I should see error message "(.*)"$/ do |displayed_text|
    expect(page).to have_content(displayed_text)
end

Then /^I should see confirm message "(.*)"$/ do |displayed_text|
    expect(page).to have_content(displayed_text)
end

Then /^I should not see error message "(.*)"$/ do |displayed_text|
    page.should have_no_content(displayed_text)
end

Then /^I should see my estimated wait time "(.*)"$/ do |displayed_text|
    expect(page).to have_content(displayed_text)
end

Then /^I should not see "(.*)" and "(.*)"$/ do | name, phone|
	page.should have_no_content(name)
	page.should have_no_content(phone)
end
	

Then /^I should see a message showing number of patients "(.*)"$/ do |displayed_text|
	expect(page).to have_content(displayed_text)
end 




