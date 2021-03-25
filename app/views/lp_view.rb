class LpView
  def display(lps)
    lps.each do |lp|
      puts "#{lp.id}. #{lp.artist} - #{lp.title} - #{lp.year} - R$ #{lp.price}"
    end
  end

  def ask_for_lp_artist
    puts "What's the artist's name?"
    gets.chomp
  end

  def ask_for_lp_title
    puts "What's the LP's title?"
    gets.chomp
  end

  def ask_for_lp_year
    puts "What's the year of release?"
    gets.chomp
  end

  def ask_for_lp_price
    puts "What's the LP price?"
    gets.chomp.to_i
  end

  def ask_for_lp_index
    puts "In what index is the LP?"
    gets.chomp.to_i
  end

  def show_lp
    puts "#{lp.id}. #{lp.artist} - #{lp.title} - #{lp.year} - R$ #{lp.price}"
  end

  def ask_for_new_lp_artist
    puts "What's the LP's right artist?"
    gets.chomp
  end

  def ask_for_new_lp_title
    puts "What's the LP's right title?"
    gets.chomp
  end

  def ask_for_new_lp_year
    puts "What's the LP's correct year?"
    gets.chomp
  end

  def ask_for_new_lp_price
    puts "What's the LP's new price?"
    gets.chomp
  end
end
