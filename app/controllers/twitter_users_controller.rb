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
        @twitter_user= TwitterUser.new(twitter_user_params)
        url = @twitter_user.page_address
        html_doc = get_user(url)
        @twitter_user.username = html_doc.css('h2.ProfileHeaderCard-screenname.u-inlineBlock.u-dir').inner_text.strip
        @twitter_user.description = html_doc.css('p.ProfileHeaderCard-bio.u-dir').inner_text.strip
        if @twitter_user.save
            redirect_to twitter_user_path(@twitter_user), notice: 'User saved successfully'
        else
            render :new
        end
    end
    
        def show
            @twitter_user = TwitterUser.find(params[:id])
        end
    
    private
    def get_user(url)
        # t_user = TwitterUser.where(name: name).first
        html_file = open(url).read
        # html_file = open(t_user.page_address).read
        html_doc = Nokogiri::HTML(html_file)
        return html_doc
    end
    
    def twitter_user_params
        params.require(:twitter_user).permit(:name, :page_address)
    end
end

# get_user('http://www.twitter.com/catracalivre')