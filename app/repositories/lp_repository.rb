require "csv"
require_relative "../models/lp"

class LpRepository
  attr_writer :lps
  attr_accessor :next_id, :csv_file

  def initialize(csv_file)
    @csv_file = csv_file
    @lps = []
    @next_id = 1 if @lps.empty?
    load_csv if File.exist?(@csv_file)
  end

  def create(lp)
    lp.id = @next_id
    @lps << lp
    @next_id += 1
    save_csv
  end

  def destroy(lp_index)
    @lps.delete_at(lp_index - 1)
    save_csv
  end

  def all
    @lps
  end

  def find(index)
    @lps.select { |lp| lp.id == index }.first
  end

  def edit(selected_lp, lp_artist, lp_title, lp_year, lp_price)
    @lps[selected_lp].artist = lp_artist
    @lps[selected_lp].title = lp_title
    @lps[selected_lp].year = lp_year
    @lps[selected_lp].price = lp_price
    save_csv
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << %w[id artist title year price]
      @lps.each do |lp|
        csv << [lp.id, lp.artist, lp.title, lp.year, lp.price]
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:artist] = row[:artist]
      row[:title] = row[:title]
      row[:year] = row[:year].to_i
      row[:price] = row[:price].to_i
      @lps << Lp.new(row)
    end
    @next_id = @lps.last.id + 1 unless @lps.empty?
  end
end
