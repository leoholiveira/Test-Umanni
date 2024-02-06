module Users
  class ImportUsersService
    require 'csv'
    attr_reader :file, :params

    def initialize(file)
      @file = file
    end

    def call
      csv ||= CSV.parse(csv_file_path, col_sep: ",", row_sep: :auto, skip_blanks: true)

      csv.each_with_index do |row, index|
        next if index == 0

        params = generate_data(row)

        User.create(params)
      end

      return true
    end

    private

    def generate_data(row)
      {
        fullname: row[0],
        email: row[1],
        avatar_image: row[4],
        user_type: row[2],
        password: row[3],
        password_confirmation: row[3]
      }
    end

    def csv_file_path
      @csv_file_path ||= File.read(file)
    end
  end
end
