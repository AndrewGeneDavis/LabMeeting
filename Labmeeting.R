# labmeeting rota generator
# Andrew Davis
# 01/16/2024

lastPresenter <- "Jessica Proulx"
presenterList <- c("Jessica Proulx",
                  "Brightany Li",
                  "Marcos Garcia Teneche",
                  "Lana Zaretski",
                  "Carolina Cano Macip",
                  "Xue Lei",
                  "Zong Chua",
                  "Anais Equey",
                  "Theophilos Tzaridis",
                  "Sha Li",
                  "Armin Gandhi",
                  "Aaron Havas",
                  "Laurence Haddadin",
                  "Rouven Arnold",
                  "Hiroshi Tanaka",
                  "Karl Miller",
                  "Shanshan Yin",
                  "Peter Adams",
                  "Adarsh Rajesh",
                  "Kate Lin",
                  "Tianhui Liu",
                  "Andrew Davis",
                  "Michael Alcaraz")

length(presenterList)

# Generate list of Labmeeting Dates

labmeetingday <- "Friday"
weekdayToday <- weekdays(Sys.time())
nextLabMeeting <- Sys.time()

# Find next labmeeting date by using today and the day of the week from above
for(i in 1:7){
  if(weekdays(nextLabMeeting) == labmeetingday){
    break
  }
  nextLabMeeting <- Sys.time() + (60*60*24*i)
  if(i == 7){
    print("Error: Check weekday spelling")
    break
  }
}
nextLabMeeting <- as.Date(as.character(nextLabMeeting), format = '%Y-%m-%d')

# Restructure presenter order to start after the last presenter
tryCatch(
  {
  lastPresenterIndex <- which(presenterList == lastPresenter)
  if(lastPresenterIndex == length(presenterList)){
    presenterOrder <- presenterList
  }else{
    presenterOrder <- c(presenterList[(lastPresenterIndex+1):length(presenterList)], presenterList[1:lastPresenterIndex])
  }
  
  dateList <- c()
  for(i in 0:(length(presenterList)-1)){
    dateList <- c(dateList, nextLabMeeting + (7*i))
  }
  dateList <- as.Date(dateList)
  
  outputFrame <- data.frame(presenterOrder, dateList)
  print(outputFrame)
  }
)
print(getwd())
write.csv(file = "./Labmeeting_Order.csv", x = outputFrame)