# Ruby 3.0.0 イメージを使用
FROM ruby:3.0.0

# 必要なパッケージ
RUN apt-get update \
  && apt-get install -y --no-install-recommends build-essential libpq-dev \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Gemfile を先にコピーして bundle install
COPY Gemfile Gemfile.lock ./
RUN bundle install

# 残りのソースをコピー
COPY . .

# Sinatra デフォルトポート
EXPOSE 8080

# Rackup で起動
CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "--port", "8080"]
