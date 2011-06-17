module BlogsHelper

  def format_time create_time
    create_time.strftime("%Y-%m-%d %I:%M")
  end
end
