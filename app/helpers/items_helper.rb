module ItemsHelper
  def days_left(item)
    (item.created_at.to_date + 7.days < Date.today) ? 'Overdue' : distance_of_time_in_words(Date.today, item.created_at.to_date + 7.days)
  end
end
