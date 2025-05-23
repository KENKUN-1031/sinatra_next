require 'sinatra'
require 'json'
require 'pg'

# 簡易的な DB 接続例（環境変数で調整可）
DB = PG.connect(
  host: ENV.fetch('DB_HOST', 'db'),
  dbname: ENV.fetch('POSTGRES_DB', 'db'),
  user: ENV.fetch('POSTGRES_USER', 'postgres'),
  password: ENV.fetch('POSTGRES_PASSWORD', 'password')
)

before do
  content_type :json
end

# JSON レスポンスのサンプル
get '/api/hello' do
  { message: 'Hello from Sinatra!' }.to_json
end

# DB からデータ取得のサンプル（テーブル users がある想定）
get '/api/users' do
  users = DB.exec('SELECT id, name FROM users').map { |r| { id: r['id'], name: r['name'] } }
  { users: users }.to_json
end

# HTML レスポンスのサンプル
get '/' do
  content_type :html
  '<h1>Sinatra Backend</h1><p>Port 8080</p>'
end

