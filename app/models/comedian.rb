class Comedian < ActiveRecord::Base
  has_many :specials

  def initialize(comedian_params)
    @id          = comedian_params["id"] if comedian_params["id"]
    @name        = comedian_params["name"]
    @age         = comedian_params["age"]
    @database    = SQLite3::Database.new('db/comedians_app_development.db')
    @database.results_as_hash = true
  end

  def self.average_age
    average(:age)
  end

  def self.find_by(age)
    comedian = database.execute("SELECT * FROM comedians WHERE age=?", "#{age}")
    comedian.map do |comedian|
      Comedian.new(comedian)
    end
  end
end
