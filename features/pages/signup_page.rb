class SignupPage
  include Capybara::DSL

  USERNAME_FIELD = 'sign-username'.freeze
  PASSWORD_FIELD = 'sign-password'.freeze

  def fill_form(username, password)
    fill_in USERNAME_FIELD, with: username
    fill_in PASSWORD_FIELD, with: password
  end
end
