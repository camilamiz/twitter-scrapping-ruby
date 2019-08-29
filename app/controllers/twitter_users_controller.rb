require 'open-uri'
require 'nokogiri'

# class TwitterUsersController < ApplicationController
#   def index
#   end
  
#   private
  
  def get_users(url)
    # t_user = TwitterUser.where(name: name).first
    html_file = open(url).read
    # html_file = open(t_user.page_address).read
    html_doc = Nokogiri::HTML(html_file)

    puts html_doc.css('a.ProfileHeaderCard-nameLink.u-textInheritColor.js-nav').inner_text
    puts html_doc.css('h2.ProfileHeaderCard-screenname.u-inlineBlock.u-dir').inner_text.strip
    puts html_doc.css('p.ProfileHeaderCard-bio.u-dir').inner_text.strip
end

# end

get_users('http://www.twitter.com/catracalivre')