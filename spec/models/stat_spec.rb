require 'rails_helper'

RSpec.describe Stat, type: :model do
  
  it {should validate_presence_of(:online)}
  it {should validate_presence_of(:switch)}
  it {should validate_presence_of(:countdown)}
  it {should validate_presence_of(:current)}
  it {should validate_presence_of(:power)}
  it {should validate_presence_of(:voltage)}
  it {should validate_presence_of(:date_time)}


end
