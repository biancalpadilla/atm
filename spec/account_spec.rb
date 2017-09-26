require '../lib/account'

RSpec.describe Account do

	let(:account1){Account.new("Checking",1000)}
	let(:account2){Account.new("Savings",1000)}

	it ".creates a new account" do
		expect(Account.new("Checking", 100)).to be_an_instance_of Account
	end

	it ".#type returns the Account type" do
		expect(Account.new("Checking", 100).type).to eql("Checking")
	end

	it ".#amount returns the Account amount" do
		expect(Account.new("Checking", 100).amount).to eql(100)
	end

	it ".#type returns an Account type" do
		expect(account1.type).to eql("Checking")
	end

	it ".#amount returns an Account amount" do
		expect(account1.amount).to eql(1000)
	end

	it ".#amount= returns a new account amount" do
		expect(account1.amount = 1500).to eql(1500)
	end

	it "#deposits $20" do
		account1.deposit(20)
		expect(account1.amount).to eql(1020)
	end

	it "#withdraws $20" do
		account1.withdraw(20)
		expect(account1.amount).to eql(980)
	end

	it "#transfers $500 from account1 to account2" do
		account1.transfer(account2,500)
		expect(account1.amount).to eql(500)
		expect(account2.amount).to eql(1500)
	end

end
