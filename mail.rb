require "mail"




  mail = Mail.deliver do

    from    "kyoda@ns.ie.u-ryukyu.ac.jp"
    to      "kyoda@ns.ie.u-ryukyu.ac.jp"
    subject "sub test"
    body    "body test"

  end


  mail.delivery_method(:smtp,
      address:        "ns.ie.u-ryukyu.ac.jp", 
      port:           25,
      )
  mail.deliver


#def testmail()
#
#  mail = Mail.deliver do
#
#    from    "kyoda@ns.ie.u-ryukyu.ac.jp"
#    to      "kyoda@ns.ie.u-ryukyu.ac.jp"
#    subject "sub test"
#    body    "body test"
#
#  end
#
#
#  mail.delivery_method(:smtp,
#      address:        "ns.ie.u-ryukyu.ac.jp", 
#      port:           25,
#      )
#  mail.deliver
#
#end
#
#
#
#testmail()

