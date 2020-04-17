rvm install 2.5.1
gem install pg -v '1.0.0' -- --with-pg-include='/Applications/Postgres.app/Contents/Versions/latest/include/'




validates :short_url, uniqueness: { scope: :original_url }
validates_format_of :original_url, :with => /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?\Z/i

url_shortener(full_url)
  ranges = ("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a
  a.sample(5).join
end

--------------------------------

def valid_url?(url)
  uri = URI.parse(url)
  uri.is_a?(URI::HTTP) && !uri.host.nil?
rescue URI::InvalidURIError
  false
end



