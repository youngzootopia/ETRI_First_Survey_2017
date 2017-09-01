class StoryController < ApplicationController
  # for InvalidAuthenticityToken
  protect_from_forgery with: :exceptions

  def get_guide
    user = User.find(current_user.id)
    stories = user.Stories

    unless stories.empty?
      render 'get_html'
    end
  end

  def get_html
  end

  def get_data
    @query = JSON.parse params[:data]
    # "type" => "json" 제거
    @query.delete('type')
    # value가 ""(공백)인 값 제거
    @query = @query.reject { |key, value| value == '' }
    seq = @query.delete('SEQ')

    if seq == 1 # Start Query
      start_query = StartQuery.new
      start_query.user_id = current_user.id
      start_query.query = @query

      if start_query.save # Start Query Save
        story = Story.new
        story.user_id = current_user.id
        story.start_query_id = start_query.id

        if story.save # Story Save
          req_diquest
          tag_save seq
          make_res
        else # Story Save Error
          make_error_res
        end
      else # Start Query Save Error
        make_error_res
      end
    else # Other Query
    end
  end

  private
    def req_diquest
      begin
        # diquest query 만들기
        query_str = ''
        @query.each do |key, value|
          query_str += key.to_s + '='
          query_str += value.to_s + '&'
        end
        query_str[-1] = ''
        url = URI.parse("http://58.72.188.33:8080/lod/search.do?" + query_str)
        req = Net::HTTP::Get.new(url.to_s)
        res = Net::HTTP.start(url.host, url.port) {|http|
          http.request(req)
        }

        # response 파싱
        @data = res.body.force_encoding("utf-8").gsub("\n", '')
        @data = @data.gsub("\t", '')
        @data = @data.gsub('\\', '')
        @data = @data.gsub('\"', '"')
        @data = "[" + @data[@data.index('{'), @data.size + 1]

      rescue SystemCallError
        make_error_res
      end
    end

    def tag_save seq
    end

    def make_res
    end

    def make_error_res
      request.format = :json
      respond_to do |format|
        format.json { render :json => [shot_id_list: '', start_time_list: '', end_time_list: '',
                      media_url_list: '', thumb_list: '', story_id: '', error: true] }
      end
    end
end
