require 'spec_helper'

describe 'Money' do

	let(:money1) { Money.new_rupee(45) }
	let(:money2) { Money.new_rupee(55) }
	let(:money3) { Money.new(67) }
	let(:money5) { Money.new_rupee_paise(0, 67)}
	let(:money4) { Money.new_rupee_paise(45, 76) }

	describe 'Equality' do
    it 'should follow reflexivity' do
      expect(money1).to eq(money1)
    end

    it 'should follow symmetry' do
      expect(money3 == money5). to eq(money5 == money3)
    end

    it 'should compare money object with nil' do
      expect(money1).not_to eq(nil)
    end

    it 'should compare money object with object of different Class' do
      expect(money2).not_to eq(1)
    end

  end

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
			expect(money1 + money2).to eq(Money.new_rupee(100))
		end

		it 'adding one input of rupee and one input of paise' do
			expect(money1 + money3).to eq(Money.new_rupee_paise(45, 67))
		end

		it 'adding one input of rupee and one input of rupee/paise' do
			expect(money2 + money4).to eq(Money.new_rupee_paise(100, 76))
		end

		it 'adding one input of paise and one input of rupee/paise' do
			expect(money3 + money4).to eq(Money.new_rupee_paise(46, 43))
		end

		describe 'Addition for more than two Moneys' do

			it 'adding three moneys' do
				expect(money1 + money2 + money3).to eq(Money.new_rupee_paise(100, 67))
			end

		end

	end

	describe 'Subtraction of money' do 

		it 'subtracting two inputs only in rupee' do
			expect(money2 - money1).to eq(Money.new_rupee(10))
		end

		it 'subtracting one input of rupee and one input of paise' do
			expect(money1 - money3).to eq(Money.new_rupee_paise(44, 33))
		end

		it 'subtracting one input of rupee and one input of rupee/paise' do
			expect(money2 - money4).to eq(Money.new_rupee_paise(9, 24))
		end

		it 'subtracting one input of paise and one input of rupee/paise' do
			expect(money4 - money3).to eq(Money.new_rupee_paise(45, 9))
		end

	end

	describe 'Sorting of money' do

  	it 'sorting of money objects based on attribute: value overloading <=> operator' do
  		expect([money2,money3,money1].sort).to  eq([money3, money1, money2])
  	end

  end

  describe 'Comparision of money' do

  	it 'comaprison of money less than condition' do
  		expect(money1 < money2).to eq true
  	end

  	it 'comaprison of money less than condition' do
  		expect(money1 > money2).to eq false
  	end

  	it 'comaprison of money less than condition' do
  		expect(money1 == money2).to eq false
  	end

  	it 'comaprison of money less than condition' do
  		expect(money1 <= money4).to eq true
  	end

  	it 'comaprison of money less than condition' do
  		expect(money1 >= money3).to eq true
  	end

  end

end