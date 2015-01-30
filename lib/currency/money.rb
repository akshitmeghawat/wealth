class Money

	attr_reader :value

	def initialize(value)
		@value = value
	end

  def self.new_paise(paise)
  	self.new(paise / 100)
  end

  def self.new_rupee(rupee)
  	self.new(rupee)
  end

  def self.new_rupee_paise(rupee, paise)
  	self.new(rupee + paise / 100)
  end

	def +(money2)
		self.value + money2.value
	end

end
