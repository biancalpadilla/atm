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