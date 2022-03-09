require "sequel"
require "logger"

#mode
type = ENV.fetch("APP_ENV", "acme_database")

#find path
db_path = File.dirname(__FILE__)
db = "#{db_path}/#{type}.sqlite3"

# find the path to the log
log_path = "#{File.dirname(__FILE__)}/../log/"
log = "#{log_path}/#{type}.log"

# create log directory if it does not exist
Dir.mkdir(log_path) unless File.exist?(log_path)

# set up the Sequel database instance
DB = Sequel.sqlite(db, logger: Logger.new(log))
