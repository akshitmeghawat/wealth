require 'spec_helper'

describe 'Money' do

	let(:money1) { Money.new_rupee(45) }
	let(:money2) { Money.new_rupee(5) }
	let(:money3) { Money.new_paise(67) }
	let(:money4) { Money.new_rupee_paise(45, 76) }

	it 'adding two inputs only in rupee' do
		expect(money1 + money2).to eq(50)
	end

	it 'adding one input of rupee and one input of paise' do
		expect(money1 + money3).to eq(45.67)
	end

	it 'adding one input of rupee and one input of rupee/paise' do
		expect(money1 + money4).to eq(90.76)
	end

	it 'adding one input of paise and one input of rupee/paise' do
		expect(money3 + money4).to eq(46.43)
	end
	
end