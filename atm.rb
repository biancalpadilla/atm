class Account

	attr_accessor :type, :amount

	def initialize(type, amount)
		@type = type
		@amount = amount
	end

	def deposit(amount)
		self.amount += amount
		puts "Depositing $#{amount} in your #{self.type}."
		show_balance()
	end

	def withdraw(amount)
		if amount <= self.amount
			self.amount -= amount
			puts "Withdrawing $#{amount} from your #{self.type}."
			show_balance()
			return true
		else
			puts "You don't have enough funds."
			return false
		end
	end

	def transfer(toAccount, amount)
		w = self.withdraw(amount)
		if w
			toAccount.deposit(amount)
		else
			puts "#{self.type} has insufficient funds to transfer"
		end
	end

	def show_balance
		puts "Your balance in #{self.type} is: $#{self.amount}"
	end

end

class Atm

	def initialize(checking_account = 0, savings_account = 0)
		@checking_account = Account.new("Checking Account", checking_account)
		@savings_account = Account.new("Savings Account", savings_account)
	end

	def run

		while true

			case atm_message()
			when 1
				show_balance()
			when 2
				deposit()
			when 3
				withdraw()
			when 4
				transfer()
			when 5
				break
			end
		end

	end

	def atm_message
		puts "--------ATM-------"
		puts "1. Check balance"
		puts "2. Make a Deposit"
		puts "3. Make a Withdrawal"
		puts "4. Make a Transfer"
		puts "5. Logout"
		puts "------------------"

		choice = gets.chomp.to_i
		return choice
	end

	def show_balance
		@savings_account.show_balance()
		@checking_account.show_balance()
	end

	def deposit
		puts "Which account would you like to deposit into?"
		puts "1. Savings Account"
		puts "2. Checking Account"
		choice = gets.chomp.to_i

		puts "How much?"
		amount = gets.chomp.to_i

		case choice
		when 1
			@savings_account.deposit(amount)
		when 2
			@checking_account.deposit(amount)
		end
	end

	def withdraw
		puts "Which account would you like to withdraw from?"
		puts "1. Savings Account"
		puts "2. Checking Account"
		choice = gets.chomp.to_i

		puts "How much?"
		amount = gets.chomp.to_i

		case choice
		when 1
			@savings_account.withdraw(amount)
		when 2
			@checking_account.withdraw(amount)
		end
	end

	def transfer
		puts "From which account would you like to transfer out of?"
		puts "1. Savings Account"
		puts "2. Checking Account"
		choice = gets.chomp.to_i

		puts "How much?"
		amount = gets.chomp.to_i

		case choice
		when 1
			@savings_account.transfer(@checking_account, amount)
		when 2
			@checking_account.transfer(@savings_account, amount)
		end
	end

end
