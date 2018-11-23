# 30.SEND EMAIL FROM R
# Send Email from R
install.packages("mailR")
library(mailR)
send.mail(from="ushapeddineni@gmail.com",
          to="ushaanil09@gmail.com",
          subject="Test Email",
          body="PFA the desired document",
          html=T,
          smtp=list(host.name = "ushapeddineni@gmail.com",
                    port = 465,
                    user.name = "ushapeddineni@gmail.com",
                    passwd = "xxxxxxxxx",
                    ssl = T),
          authenticate=T,
          attach.files="C:\\Users\\kavya\\Downloads\\sample.csv")