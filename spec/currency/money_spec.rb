require 'spec_helper'

describe 'Money' do

	let(:money1) { Money.new_rupee(45) }
	let(:money2) { Money.new_rupee(55) }
	let(:money3) { Money.new(67) }
	let(:money4) { Money.new_rupee_paise(45, 76) }

	describe 'represenation of money' do

		it 'viewing the money with both rupee and paise' do
			expect(money4.to_s).to eq("45 Rs 76 paise")
		end

		it 'viewing the money with only paise' do
			expect(money3.to_s).to eq("0 Rs 67 paise")
		end

		it 'viewing the money with only rupee' do
			expect(money2.to_s).to eq("55 Rs 0 paise")
		end

	end

	describe 'Addition of Money' do

		it 'adding two inputs only in rupee' do
			expect((money1 + money2) == Money.new_rupee(100)).to eq(true)
		end

		it 'adding one input of rupee and one input of paise' do
			expect((money1 + money3) == Money.new_rupee_paise(45, 67)).to eq(true)
		end

		it 'adding one input of rupee and one input of rupee/paise' do
			expect((money2 + money4) == Money.new_rupee_paise(100, 76)).to eq(true)
		end

		it 'adding one input of paise and one input of rupee/paise' do
			expect((money3 + money4) == Money.new_rupee_paise(46, 43)).to eq(true)
		end

		describe 'Addition for more than two Moneys' do

			it 'adding three moneys' do
				expect((money1 + money2 + money3) == Money.new_rupee_paise(100, 67)).to eq(true)
			end

		end

	end
	
end