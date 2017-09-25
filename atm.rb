class Account

    attr_accessor :type, :amount

    def initialize(type, amount)
        @type = type
        @amount = amount
    end

    def deposit(amount)
        self.amount += amount
        p "Depositing $#{amount} in your #{self.type}."
    end

    def withdraw(amount)
        if amount <= self.amount
            self.amount -= amount
            p "Withdrawing $#{amount} from your #{self.type}."
            return true
        else
            p "You don't have enough funds."
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

  STARTING_CHECKING_BALANCE = 100.0
  STARTING_SAVINGS_BALANCE = 100.0

  def run
    checking_account = Account.new("Checking Account", STARTING_CHECKING_BALANCE)
    savings_account = Account.new("Savings Account", STARTING_SAVINGS_BALANCE)

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