When(/^I search for "(.*?)"$/) do |query|
  visit('/search')
  fill_in('query', with: query)
  click_button('Search')
end

Then(/^the results should be:$/) do |expected_results|
  # table is a Cucumber::Ast::Table
  find('ol.results li')
  results = [['content']] + page.all('ol.results li').map {|li| [li.text]}

  expected_results.diff!(results)
end

When(/^I enter for "(.*?)"$/) do |arg1|
  visit('/search')
  fill_in('query', with: query)
end