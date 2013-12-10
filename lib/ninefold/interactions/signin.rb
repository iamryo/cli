module Ninefold
  class Interaction::Signin < Ninefold::Interaction
    def run
      10.times do
        username = ask("Username:")
        password = ask("Password:", :echo => false)

        with_spinner do
          @user.signin(username, password)
        end

        return done if @user.signed_in?

        error "\nSorry. That username and password was invalid. Please try again"
      end

      error "\nCould not log in"
    end
  end
end
