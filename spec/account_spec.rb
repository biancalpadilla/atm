require '../lib/account'

RSpec.describe Account do

    let(:account1){Account.new("Checking",1000)}

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

end