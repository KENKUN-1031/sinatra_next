require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader' if development?
require 'json'
require 'pg'
require './models' # モデル読み込み（任意）

set :database_file, 'config/database.yml'

#dbに接続できるかどうかを確認してる
get "/dbcheck" do
  begin
    ActiveRecord::Base.connection.execute("SELECT 1")
    "DB接続成功！"
  rescue => e
    "DB接続失敗: #{e.message}"
  end
end


# JSON レスポンスのサンプル
get '/api/hello' do
  { message: 'Hello from Sinatra!3' }.to_json
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

get '/api/items' do
  items = [
    { id: 1, name: 'りんご' },
    { id: 2, name: 'バナナ' },
    { id: 3, name: 'オレンジ' }
  ]
  puts items
  { items: items }.to_json
end
