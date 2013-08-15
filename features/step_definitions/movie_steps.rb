# Step for populating the DB with movies
Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header
    Movie.create!(movie)
  end
end

# Check for movie's director
Then /the director of "(.*)" should be "(.*)"/ do |m, d|
  if page.respond_to? :should
  	page.should have_content(m)
    page.should have_content("Director: " + d)
  else
    assert page.has_content?(m)
    assert page.has_content?("Director: " + d)
  end
end