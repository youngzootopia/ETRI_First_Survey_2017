class StoryController < ApplicationController
  # for InvalidAuthenticityToken
  protect_from_forgery with: :exceptions

  def get_guide
    user = User.find(current_user.id)
    stories = user.Stories

  end

  def get_html
  end

  def get_data
    req_diquest
  end

  private
  def req_diquest
    query = JSON.parse request.GET[:data]
    # "type" => "json" 제거
    query.delete("type")
    # value가 ""(공백)인 값 제거
    query = query.reject { |key, value| value == '' }
    query_str = ''
    query.each do |key, value|
      query_str += key.to_s + '='
      query_str += value.to_s + '&'
    end
    query_str[-1] = ''
    url = URI.parse("http://58.72.188.33:8080/lod/search.do?" + query_str)
    req = Net::HTTP::Get.new(url.to_s)
    @res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }

    if query[:seq] == 1
      request.format = :json
      respond_to do |format|
      format.json { render :json => [shot_id_List: @res] }
      end
    end

  end
end
