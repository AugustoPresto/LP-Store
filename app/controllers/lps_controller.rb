require_relative '../models/lp'
require_relative '../views/lp_view'

class LpsController
  def initialize(lp_repository)
    @lp_repository = lp_repository
    @view = LpView.new
  end

  def list
    lps = @lp_repository.all
    @view.display(lps)
  end

  def add
    artist = @view.ask_for_lp_artist
    title = @view.ask_for_lp_title
    year = @view.ask_for_lp_year
    price = @view.ask_for_lp_price
    lp = Lp.new(artist: artist, title: title, year: year, price: price)
    @lp_repository.create(lp)
  end

  def find
    selected_lp = @lp_repository.find(@view.ask_for_lp_index)
    puts "#{selected_lp.id}. #{selected_lp.artist} - #{selected_lp.title} - #{selected_lp.year} - #{selected_lp.price}"
  end

  def destroy
    lp_index = @view.ask_for_lp_index
    @lp_repository.destroy(lp_index)
  end

  def edit
    selected_lp = @view.ask_for_lp_index - 1
    lp_artist = @view.ask_for_new_lp_artist
    lp_title = @view.ask_for_new_lp_title
    lp_year = @view.ask_for_new_lp_year
    lp_price = @view.ask_for_new_lp_price
    @lp_repository.edit(selected_lp, lp_artist, lp_title, lp_year, lp_price)
  end
end
