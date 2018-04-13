class AuthenticationHelper
  def authenticated_header(user)
      contents = { :user_id => user.id, :expiration => 24.hours.from_now.to_i }
      token = JwtService.encode(contents)
      { 'Authorization': "Bearer #{token}" }
  end
end
