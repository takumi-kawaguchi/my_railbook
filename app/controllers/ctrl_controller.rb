class CtrlController < ApplicationController
  # around_action :around_logger, only: [:index]
  before_action :auth, only: :index

  def index
  end

  def para
    render plain: 'id parameter: ' + params[:id]
  end

  def para_array
    render plain: 'category parameter: ' + params[:category].inspect
  end

  def req_headers
    @headers = request.headers
  end

  def upload_process
    file = params[:upfile]
    name = file.original_filename
    perms = ['.jpg', '.jpeg', '.gif', '.png']

    if !perms.include?(File.extname(name).downcase)
      result = "アップできるのは画像のみです"
    elsif file.size > 1.megabyte
      result = "1mbまでです"
    else
      File.open("public/#{name}", 'wb') { |f| f.write(file.read) }
      result = "#{name}をアップしました"
    end
    render plain: result
  end

  def updb
    # binding.pry
    @author = Author.find(params[:id])
  end

  def updb_process
    @author = Author.find(params[:id])
    if @author.update(params.require(:author).permit(:data))
      render plain: "保存に成功しました"
    else
      render plain: @author.errors.full_messages[0]
    end
  end

  def cmd_response
    logger.unknown("unknown")
  end

  def get_xml
    @books = Book.all
    render xml: @books
  end

  def get_json
    @books = Book.all
    render json: @books
  end

  def cookie
    @email = cookies[:email]
  end

  def cookie_rec
    cookies[:email] = {
      value: params[:email],
      expires: 3.months.from_now,
      http_only: true
    }
    render plain: 'クッキーを保存しました。'
  end

  def session_show
    @email = session[:email]
  end

  def session_rec
    session[:email] = params[:email]
    render plain: "session restored"
  end

  def device
  end

  private

  def start_logger
    logger.debug("[START]" + Time.now.to_s)
  end

  def end_logger
    logger.debug("[END]" + Time.now.to_s)
  end

  def around_logger
    logger.debug("[START]" + Time.now.to_s)
    yield
    logger.debug("[END]" + Time.now.to_s)
  end

  def auth
    name = 'yyamada'
    passwd = 'password'
    authenticate_or_request_with_http_basic('my_railsbook') do |n, passwd|
      n == name && Digest::SHA1.hexdigest(passwd) == passwd
    end
  end
end
