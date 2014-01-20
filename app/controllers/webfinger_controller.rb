class WebfingerController < ApplicationController
  layout :false
  
  def host_meta
    render content_type: "application/xml"
  end
  
  def query
    render nothing: true, status: 400 unless params[:resource].present?
    unless params[:resource][0...5]=="acct:"
      render text: "acct: not found", status: 404 
      return
    end
    if user = User.find_by(identifier: params[:resource][5...200])
      render json: {
                        "subject" => user.identifier,
                        "links" => [{
                            "rel" => "http://opentaskstandard.org/rel/account",
                            "href" => "https://opentaskstandard.com/#{user.identifier}"}
                          ]
                    }, content_type: "application/jrd+json"
    else
      render nothing: true, status: 404
    end
  end
end