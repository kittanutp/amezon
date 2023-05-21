class ApplicationController < ActionController::API
  rescue_from StandardError, with: :exception_handler

  def get_offset
    return (params[:page].to_i - 1 ) * (params[:limit].to_i)
  end

  def paginate(object)
    page = params[:page].to_i
    limit = params[:limit].to_i

    if page > 0 and limit > 0
      total_result = object.count
      total_page = (total_result / limit).ceil

      if page < total_page
        next_page = page + 1
      else
        next_page = false
      end
      return {
        total_result: total_result,
        next_page: next_page,
        total_page: total_page
      }
    else
      return {
        total_result: total_result,
        next_page: false,
        total_page: 1
      }
    end

  end

  private

  def exception_handler(e)
     render json: {message: e.message}, status: 400
  end

end
