class Table
    attr_accessor :table
    def initialize
        self.table = [["1","2","3"],["4","5","6"],["7","8","9"]]
        show
    end

    def show
        table_display = self.table.map do |row|
            cells = row.map do |cell|
                cell.center(6,' ')
            end
            cells.join('|')
        end
        table_display.insert(1,*["--------------------"])
        table_display.insert(3,*["--------------------"])
        puts "===================="
        puts table_display
        puts "===================="
    end

    def place(num,xo)
        self.table.map! do |row|
            cells = row.collect do |cell|
                if cell == num
                    cell = xo.to_s
                else
                    cell 
                end
            end
            cells
        end
        self.show
    end

    def game_end(xo)
        
        win_game = false
        win_game = self.table.any? do |row|
            row.all? { |col| col == xo } 
        end
        return true if win_game == true
        win_game = self.table.each_index.map do |col_index|
            3.times.all? do |row_index|
                self.table[row_index][col_index] == xo 
                # row_index == 3
            end
        end
        return true if win_game.any?
        win_game = 3.times.all? do |index|
                self.table[index][index] == xo 
        end
        return true if win_game == true
        win_game = 3.times.all? do |index|
            self.table[-1-index][index] == xo
        end
        return true if win_game == true
    end

    def player(xo)
        printf "Player #{xo}: "
        
        user_input = gets.chomp
        
        while self.table.any? {|row| (row-["X","0"]).include?(user_input)} == false do
            exit if user_input == "0" or user_input == "exit"
            printf "Player #{xo}: "
            user_input = gets.chomp
        end  
        self.place(user_input,xo)
        if self.game_end(xo) 
            puts "player #{xo} Win!!"
            exit
        end
    end

    def game_start
        9.times do |time|
            if time.even?
                self.player("X")
            else
                self.player("O")
            end
        end
        puts "It is a tie!"
    end
end


table = Table.new()
table.game_start
