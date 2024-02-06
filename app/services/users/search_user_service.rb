module Users
  class SearchUserService
    attr_reader :type

    def initialize(type)
      @type = type
    end

    def call
      response_user
    end

    private

    def response_user
      if type == 'admin'
        users = User.where(user_type: 'admin')
      elsif type == 'client'
        users = User.where(user_type: 'client')
      else
        users = User.all
      end

      users.order(id: 'ASC')
    end
  end
end
