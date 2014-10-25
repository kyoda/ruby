require "mail"




def testmail()

  mail = Mail.new do

    from    "kyoda@ns.ie.u-ryukyu.ac.jp"
    to      "e085720@gmail.com"
    subject "sub test"
    body    "body test"

  end


  mail.delivery_method(:smtp,
      address:        "ns.ie.u-ryukyu.ac.jp", 
      port:           25,
      )
  mail.deliver

end




testmail()
