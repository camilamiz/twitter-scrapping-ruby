require 'open-uri'
require 'nokogiri'

class TwitterUsersController < ApplicationController
    def index
        if params[:query].present?
            sql_query = "name ILIKE :query OR page_address ILIKE :query"
            @twitter_user = TwitterUser.where(sql_query, query: "%#{params[:query]}%").first
        else
            @twitter_users = TwitterUser.all
        end
    end

    def new
        @twitter_user = TwitterUser.new
    end

    def create
        @twitter_user= TwitterUser.new
    end
  
    private
    def get_users(url)
        # t_user = TwitterUser.where(name: name).first
        html_file = open(url).read
        # html_file = open(t_user.page_address).read
        html_doc = Nokogiri::HTML(html_file)

        puts html_doc.css('a.ProfileHeaderCard-nameLink.u-textInheritColor.js-nav').inner_text
        puts html_doc.css('h2.ProfileHeaderCard-screenname.u-inlineBlock.u-dir').inner_text.strip
        puts html_doc.css('p.ProfileHeaderCard-bio.u-dir').inner_text.strip
    end

end

# get_users('http://www.twitter.com/catracalivre')