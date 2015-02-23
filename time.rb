
day_obj = Time.strptime("2014-08-08", "%Y-%m-%d")
# tomorrow
day_obj += 24 * 60 * 60
p day_obj.strftime("%Y-%m-%d")

