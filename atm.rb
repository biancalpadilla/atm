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
		@starting_checking_balance = checking_account
		@starting_savings_balance = savings_account
	end

	def run
		checking_account = Account.new("Checking Account", @starting_checking_balance)
		savings_account = Account.new("Savings Account", @starting_savings_balance)

		while true
			puts "--------ATM-------"
			puts "1. Check balance"
			puts "2. Make a Deposit"
			puts "3. Make a Withdrawal"
			puts "4. Make a Transfer"
			puts "5. Logout"
			puts "------------------"

			option1 = gets.chomp.to_i

			case option1
			when 1
				savings_account.show_balance()
				checking_account.show_balance()
			when 2
				puts "Which account would you like to deposit into?"
				puts "1. Savings Account"
				puts "2. Checking Account"
				option2 = gets.chomp.to_i

				puts "How much?"
				dep_amount = gets.chomp.to_i

				case option2
				when 1
					savings_account.deposit(dep_amount)
				when 2
					checking_account.deposit(dep_amount)
				end
			when 3
				puts "Which account would you like to withdraw from?"
				puts "1. Savings Account"
				puts "2. Checking Account"
				option3 = gets.chomp.to_i

				puts "How much?"
				wit_amount = gets.chomp.to_i

				case option3
				when 1
					savings_account.withdraw(wit_amount)
				when 2
					savings_account.withdraw(wit_amount)
				end
			when 4
				puts "From which account would you like to transfer out of?"
				puts "1. Savings Account"
				puts "2. Checking Account"
				option4 = gets.chomp.to_i

				puts "How much?"
				trans_amount = gets.chomp.to_i

				case option4
				when 1
					savings_account.transfer(checking_account,trans_amount)
				when 2
					checking_account.transfer(savings_account,trans_amount)
				end
			when 5
				break
			end
		end
	end
end
