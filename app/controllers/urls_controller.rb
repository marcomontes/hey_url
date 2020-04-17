# frozen_string_literal: true

class UrlsController < ApplicationController
  def index
    @url = Url.new
    @urls = Url.all
  end

  def create
    Url.create(original_url: params[:url][:original_url])
  end

  def show
    @url = Url.where(short_url: params[:url]).last

    @daily_clicks = [
      ['1', 13],
      ['2', 2],
      ['3', 1],
      ['4', 7],
      ['5', 20],
      ['6', 18],
      ['7', 10],
      ['8', 20],
      ['9', 15],
      ['10', 5]
    ]

    @browsers_clicks = @url.browser_clicks
    @platform_clicks = @url.platform_clicks
  end

  def visit
    url = Url.where(short_url: params[:url]).last
    url.increment_counter
    url.set_browser_data(browser)
    redirect_to url.original_url
  end

  def latest
    Url.last(10)
  end
end
