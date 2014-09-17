require "mail"

mail = Mail.deliver do

  from    "kyoda@ns.ie.u-ryukyu.ac.jp"
  to      "kyoda@ns.ie.u-ryukyu.ac.jp"
  subject "sub test"
  body    "body test"

end


