
now_obj = Time.strptime("2014-08-08", "%Y-%m-%d")
now_obj += 24 * 60 * 60
p now_obj.strftime("%Y-%m-%d")

