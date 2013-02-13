class ApplicationController < ActionController::Base

  include TheRole::Requires

  protect_from_forgery

  def access_denied
    render :text => 'access_denied: requires an role' and return
  end

  alias_method :login_required,     :require_login
  alias_method :role_access_denied, :access_denied

  skip_before_filter :role_required

  private
  def not_authenticated
    redirect_to login_url, :alert => "First log in to view this page."
  end
end
