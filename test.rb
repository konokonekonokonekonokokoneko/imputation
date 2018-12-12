require 'date'
(Date.parse('2017-04-01')..Date.parse('2018-03-31')).each do |date|
  puts date
end
