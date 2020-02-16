require 'rubygems'
require 'bundler'

Bundler.require

# definitions
BASE_LIBS = [
  'active_record'
]

APP_BASE = [
  './app/concerns/loggable',
  './app/concerns/public_serializable',
  './app/models/application_record',
  './app/models/bill',
  './app/models/bill/gas',
  './app/models/bill/water',
  './app/models/bill/electricity',
]

APP = [
  './app/helpers/numbers',
  './app/controllers/bills_controller',
  './app/circuit_board'
]

db_config = {
  adapter: 'sqlite3',
  database: './datasource/manager/db/development.sqlite3'
}

# run require statements
[*BASE_LIBS, *APP_BASE, *APP].each do |rb|
  require rb
end

# configure locale
I18n.load_path << './app/locales/ja.yml'
I18n.default_locale = :ja

# connect to db
ActiveRecord::Base.establish_connection(**db_config)

# main
run CircuitBoard
