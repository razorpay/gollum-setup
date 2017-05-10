#!/usr/bin/env ruby
require 'rubygems'
require 'gollum/app'
require 'uri'

gollum_path = '/wiki/'
Precious::App.set(:gollum_path, gollum_path)
Precious::App.set(:wiki_options,wiki_options = {
  :live_preview => false,
  :allow_uploads => true,
  :per_page_uploads => true,
  :allow_editing => true,
  :css => true,
  :js => true,
  :mathjax => false,
  :emoji => true,
  :user_icons => 'gravatar'
})

module Precious
  class App < Sinatra::Base
    ['/*'].each do |path|
      before path do
        unless request.env['HTTP_X_FORWARDED_USER'] && request.env['HTTP_X_FORWARDED_EMAIL']
          halt 401, 'Unauthorized'
        end
        session['gollum.author'] = {
          :name => request.env['HTTP_X_FORWARDED_USER'],
          :email => request.env['HTTP_X_FORWARDED_EMAIL']
        }
      end
    end

    after do
      # This is required to ensure HTTPS is used
      # on all links
      if response.headers.key? 'Location'
        url = URI response.headers['Location']
        url.scheme = 'https'
        response.headers['Location'] = url.to_s
      end
    end
  end
end

run Precious::App
