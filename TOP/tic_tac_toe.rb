class Game
  WINNING_MOVES = [
    %w[00 01 02],
    %w[10 11 12],
    %w[20 21 22],
    %w[00 10 20],
    %w[01 11 21],
    %w[02 12 22],
    %w[00 11 22],
    %w[02 11 20]
  ].freeze

  def initialize
    @grid = [['', '', ''], ['', '', ''], ['', '', '']]
    puts 'Player 1 : Enter X or O '
    @player1 = gets.chomp.upcase
    @player2 = @player1 === 'X' ? 'O' : 'X'
  end

  def start
    until is_won? || is_tied?
      @current_player = @current_player === @player1 ? @player2 : @player1
      begin
        print "#{@current_player}'s move: "
        update_grid(gets.chomp)
      rescue StandardError => e
        puts e
        retry
      end
    end
    if is_won?
      puts "#{@current_player} has won the game"
    else
      puts 'Game Tied'
    end
  end

  def update_grid(coord)
    arr = coord.split('').map { |s| s.to_i }
    row = arr[0]
    col = arr[1]
    is_valid_move?(row, col)
    @grid[row][col] = @current_player
    display_grid
  end

  def display_grid
    puts '-----'
    @grid.each do |row|
      row.each do |col|
        print(col.empty? ? '.' : col, ' ')
      end
      puts
    end
    puts '-----'
  end

  private

  def is_won?
    WINNING_MOVES.any? do |row|
      row.all? do |cell|
        arr = cell.split('').map { |s| s.to_i }
        row = arr[0]
        col = arr[1]

        @grid[row][col] === @current_player
      end
    end
  end

  def is_tied?
    @grid.all? do |row|
      row.all? do |cell|
        cell != ''
      end
    end
  end

  def is_valid_move?(row, col)
    raise 'Invalid Move' if row > 2 || row < 0 || col > 2 || col < 0 || @grid[row][col] != ''
  end
end

game = Game.new
game.start
