# labmeeting rota generator
# Andrew Davis
# 01/16/2024

presenterList = c("Jessica Proulx",
                  "Anais Equey",
                  "Brightany Li",
                  "Marcos Garcia Teneche",
                  "Lana Zaretski",
                  "Xue Lei",
                  "Zong Chua",
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

# Generate list of Labmeeting Dates

labmeetingday <- "Friday"
weekdayToday <- weekdays(Sys.time())
nextLabMeeting <- Sys.time()

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
