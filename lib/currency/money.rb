#Money takes rupee and paise as input and provides functionality of adding, subtracting, sorting and comparing money
class Money

	attr_reader :paise
 
  include Comparable

	def initialize(paise)
		@paise = paise
	end

  def self.new_rupee(rupee)
  	self.new(rupee * 100)
  end

  def self.new_rupee_paise(rupee, paise)
  	self.new((rupee * 100) + paise)
  end

	def +(money2)
		Money.new(@paise + money2.paise)
	end

  def -(money2)
		Money.new(@paise - money2.paise)
	end

	def paise_to_rupee
		@paise / 100
	end

	def paise_without_rupee
		@paise % 100
	end

	def to_s
		"#{paise_to_rupee} Rs #{paise_without_rupee} paise"
	end

	def ==(money2)
		return false unless money2.class == Money
		@paise == money2.paise
	end

	def <=>(other)
   self.paise <=> other.paise
  end

	private :paise_to_rupee, :paise_without_rupee

end
