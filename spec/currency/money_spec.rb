require 'spec_helper'

describe 'Money' do

	let(:money1) { Money.new_rupee(45) }
	let(:money2) { Money.new_rupee(55) }
	let(:money3) { Money.new_paise(67) }
	let(:money4) { Money.new_rupee_paise(45, 76) }

	it 'viewing the money with both rupee and paise' do
		expect(money4.viewMoney).to eq("45 Rs 76 paise")
	end

	it 'viewing the money with only paise' do
		expect(money3.viewMoney).to eq("0 Rs 67 paise")
	end

	it 'viewing the money with only rupee' do
		expect(money2.viewMoney).to eq("55 Rs 0 paise")
	end

	it 'adding two inputs only in rupee' do
		expect((money1 + money2).viewMoney).to eq("100 Rs 0 paise")
	end

	it 'adding one input of rupee and one input of paise' do
		expect((money1 + money3).viewMoney).to eq("45 Rs 67 paise")
	end

	it 'adding one input of rupee and one input of rupee/paise' do
		expect((money2 + money4).viewMoney).to eq("100 Rs 76 paise")
	end

	it 'adding one input of paise and one input of rupee/paise' do
		expect((money3 + money4).viewMoney).to eq("46 Rs 43 paise")
	end
	
end