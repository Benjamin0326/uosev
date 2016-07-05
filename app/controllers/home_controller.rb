class HomeController < ApplicationController
  def index
		#unless user_signed_in?
		#	redirect_to '/users/sign_in'
		#end
  end
  def write_db

    # crawling with nokogiri
    require 'nokogiri'
    require 'open-uri'

    doc = Nokogiri::XML(open("http://wise.uos.ac.kr/uosdoc/api.ApiApiSubjectList.oapi?apiKey=201605329QCU92763&year=#{params[:year]}&term=A#{params[:term]}0&subjectNm=%"),nil,'EUC-KR')

    doc.xpath('//list').each do |node|
      lecture=Lecture.new

      lecture.subject_no=node.xpath('subject_no').text.strip
      lecture.subject_nm=node.xpath('subject_nm').text.strip
      lecture.class_div=node.xpath('class_div').text.strip
      lecture.subject_div=node.xpath('subject_div').text.strip
      lecture.dept=node.xpath('dept').text.strip
      lecture.credit=node.xpath('credit').text.strip
      lecture.prof_nm=node.xpath('prof_nm').text.strip

      lecture.save
    end
    redirect_to '/'
  end
end
