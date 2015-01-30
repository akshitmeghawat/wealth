#
class Money

	attr_reader :value

	def initialize(value)
		@value = value
	end

  def self.new_paise(paise)
  	self.new(paise)
  end

  def self.new_rupee(rupee)
  	self.new(rupee * 100)
  end

  def self.new_rupee_paise(rupee, paise)
  	self.new((rupee * 100) + paise)
  end

	def +(money2)
		Money.new(@value + money2.value)
	end

	def viewMoney
		"#{@value / 100} Rs #{@value % 100} paise"
	end

end
