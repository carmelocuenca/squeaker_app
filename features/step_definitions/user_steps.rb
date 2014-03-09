Given(/^there is a User$/) do
  FactoryGirl.create(:user)
end

Given(/^the User has posted the message "(.*?)"$/) do |message|
  User.count.should eql(1)
  FactoryGirl.create(:message, content: message, user: User.first)
end

When(/^I visit the page for the User$/) do
  User.count.should eql(1)
  visit(user_path(User.first))
end

Then(/^I should see "(.*?)"$/) do |text|
  page.should have_content(text)
end

Given(/^a User has posted the following messages:$/) do |messages|
  user = FactoryGirl.create(:user)
  messages_attributes = messages.hashes.map { |message_attributes| message_attributes.merge(user: user) }
  Message.create!(messages_attributes)
end