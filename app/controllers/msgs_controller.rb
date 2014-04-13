require 'twilio-ruby'
class MsgsController < ApplicationController
  before_action :set_msg, only: [:show, :edit, :update, :destroy]
  before_filter :set_twilio_client, :only=> [:create]

  ACCOUNT_SID = 'AC034a8ba1534d6591f2df9ac3d39744e0'
  AUTH_TOKEN = '33e9a02b4ae7de51230f7e7dcbc13143'
  # GET /msgs
  # GET /msgs.json
  def index
    @msgs = Msg.all
  end

  # GET /msgs/1
  # GET /msgs/1.json
  def show
  end

  # GET /msgs/new
  def new
    @msg = Msg.new
  end

  # GET /msgs/1/edit
  def edit
  end

  # POST /msgs
  # POST /msgs.json
  def create
    @msg = Msg.new(msg_params)

    respond_to do |format|
      if @msg.save
        # @client.account.messages.create(
        #   :from => '+18582174961',
        #   :to => "+1#{@msg.phone}",
        #   :body => @msg.content
        # )
        format.html { redirect_to @msg, notice: 'Msg was successfully created.' }
        format.json { render action: 'show', status: :created, location: @msg }
      else
        format.html { render action: 'new' }
        format.json { render json: @msg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /msgs/1
  # PATCH/PUT /msgs/1.json
  def update
    respond_to do |format|
      if @msg.update(msg_params)
        format.html { redirect_to @msg, notice: 'Msg was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @msg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /msgs/1
  # DELETE /msgs/1.json
  def destroy
    @msg.destroy
    respond_to do |format|
      format.html { redirect_to msgs_url }
      format.json { head :no_content }
    end
  end

  def auth
    redirect_to "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxc66d592367cb2667&redirect_uri=http%3A%2F%2F128.54.37.25%2Fmsgs%2Fnew&response_type=code&scope=snsapi_userinfo&state=2014#wechat_redirect"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_msg
      @msg = Msg.find(params[:id])
    end

    def set_twilio_client
      @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def msg_params
      params.require(:msg).permit(:content, :phone)
    end
end
