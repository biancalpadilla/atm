require '../lib/atm'

RSpec.describe Atm do

	it ".creates a new atm session" do
		expect(Atm.new).to be_an_instance_of Atm
	end

end
