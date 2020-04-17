# frozen_string_literal: true

class Url < ApplicationRecord
  # scope :latest, -> {}
  has_many :clicks

  validates :original_url, uniqueness: true #{ scope: :short_url }

  before_create :set_short_url

  def set_short_url
    chars_array = ('a'..'z').to_a + ('A'..'Z').to_a + (1..9).to_a
    short_code = chars_array.sample(5).join
    self.short_url = short_code
  end

  def valid_url?(url)
    begin
      uri = URI.parse(url)
      uri.is_a?(URI::HTTPS)
    rescue => e
      false
    end
  end

  def increment_counter
    self.clicks_count += 1
    self.save
  end

  def set_browser_data(browser)
    self.clicks.create(
      browser: browser.name,
      platform: browser.platform.name
    )
  end

  def platform_clicks
    p_clicks = []
    self.clicks.group_by(&:platform).each do |platform,clicks|
      p_clicks << [platform, clicks.count]
    end
    p_clicks
  end

  def browser_clicks
    b_clicks = []
    self.clicks.group_by(&:browser).each do |browser,clicks|
      b_clicks << [browser, clicks.count]
    end
    b_clicks
  end
end
