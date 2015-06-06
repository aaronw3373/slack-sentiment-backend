
class AlchemyController < ApplicationController
# require './alchemyapi'
#   alchemyapi = AlchemyApi.new()
  AlchemyAPI.configure do |config|
    config.apikey = "874ad4a8a70d5bfa73df1f868fa66880189cc33d"
    config.output_mode = :json # not yet supported
  end

  def index
    @messages = Message.all
    render json: @messages
  end

  def create
    @message = Message.new(slack_params)
    @message.save
    @channel_messages = Message.where channel_id: @message[:channel_id]
    puts @channel_messages
    if @channel_messages.count > 10
      @ID = @channel_messages.minimum(:id)
      puts @ID
      @messages = @channel_messages.find(@ID)
      @messages.destroy
      stringy @message['channel_id']
    end
  end

  def stringy channel_id
    @messages = Message.all
    sentimenttext = ""
    @messages.each do |message|
      sentimenttext += message[:text]
    end

    sentiment sentimenttext, channel_id
  end

  def sentiment sentimenttext, channel_id
    @response = AlchemyAPI.search(:sentiment_analysis, text: sentimenttext)
    @score = 0;
    if @response["score"]
      @score = @response["score"]
    end
    @resource = {score: @score, channel: channel_id}
    @save = Alchemy.new(@resource)
    @save.save
  end

  def show
    @sentiment = Alchemy.where channel: params[:id]
    render json: @sentiment
  end

  private
  def slack_params
    params.require(:message).permit(:team_id, :text, :token, :user_name, :user_id, :channel_id, :channel_name, :timestamp)
  end

end
