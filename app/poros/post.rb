class Post
  attr_reader :user,
              :content,
              :link,
              :created_at

  def initialize(data)
    @user = find_user_by_id(data[:attributes][:user_id])
    @content = data[:attributes][:content]
    @created_at = data[:attributes][:created_at]
    @link = data[:attributes][:link]
  end

  def created_at_format
    @created_at.to_date.strftime('%A %B %-d, %Y').sub!(/\d?\d/) do |day|
      case day
        when "1", "21", "31" then "#{day}st"
        when "2", "22" then "#{day}nd"
        when "3", "23" then "#{day}rd"
        else "#{day}th"
      end
    end
  end

  def find_user_by_id(user_id)
    User.find(user_id)
  end
end
