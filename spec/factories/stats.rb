require 'date'
FactoryBot.define do
  factory :stat do
  	online {true}
    switch {true}
    countdown {5}
    current {345}
    power {369}
    voltage {2256}
    date_time {DateTime.now}
  end
end