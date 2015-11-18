module ItemsHelper
  def days_left(item)
    due_date = item.created_at.to_date + 7.days
    (due_date < Date.today) ? 'Overdue' : distance_of_time_in_words(Date.today, due_date)
  end
end
