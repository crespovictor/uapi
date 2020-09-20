require 'rails_helper'

RSpec.describe "Stats", type: :request do
	let!(:stats) { create_list(:stat, 15) }
	let(:stat_id) { stats.first.id }

	describe "GET /stats" do
		before { get '/stats' }
		it "return stats" do
			get stats_path
			expect(response).to have_http_status(200)
    	end
  	end

  	describe 'POST /stats' do
  		let(:valid_attributes) { { online: 'true', switch: "true", countdown: "0", current: "460", power: "359", voltage: "2275", date_time: "2020-09-18 12:30:59 -0700" } }

    	context 'when the request is valid' do
      		before { post '/stats', params: valid_attributes }

      		it 'creates a stat' do
        		expect(json['online']).to eq(true)
      		end

      		it 'returns status code 201' do
       	 		expect(response).to have_http_status(201)
      		end
    	end

    	context 'when the request is invalid' do
      		before { post '/stats', params: { online: 'false', switch: 'false' } }

      		it 'returns status code 422' do
        		expect(response).to have_http_status(422)
      		end

      		it 'returns a validation failure message' do
        		expect(response.body)
          			.to match(/Validation failed: Online can't be blank, Switch can't be blank, Countdown can't be blank, Current can't be blank, Power can't be blank, Voltage can't be blank, Date time can't be blank/)
      		end
    	end
  	end

  	# Test suite for GET /stats/:id
  	describe 'GET /stats/:id' do
    	before { get "/stats/#{stat_id}" }

    	context 'when the record exists' do
      		it 'returns the stat' do
        		expect(json).not_to be_empty
        		expect(json['id']).to eq(stat_id)
      		end

      		it 'returns status code 200' do
        		expect(response).to have_http_status(200)
      		end
   		 end

    	context 'when the record does not exist' do
      		let(:stat_id) { 100 }

      		it 'returns status code 404' do
        		expect(response).to have_http_status(404)
      		end

      		it 'returns a not found message' do
        		expect(response.body).to match(/Couldn't find Stat/)
      		end
    	end
  	end
end

