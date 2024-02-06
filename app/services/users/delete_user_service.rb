module Users
  class DeleteUserService
    attr_reader :id

    def initialize(id)
      @id = id
    end

    def call
      @user = User.find(id)
      @user.destroy
    end
  end
end
