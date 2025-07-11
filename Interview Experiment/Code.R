#Load the data
setwd('C:/Users/Teaching/Downloads')
resumeData = read.csv('resumeData.csv',stringsAsFactors = TRUE)

#Basic summary of the data
names(resumeData)
summary(resumeData)

#Bivariate Regresssions
lm(call~ethnicity,data=resumeData)
summary(lm(call~ethnicity,data=resumeData))

#Controlling other factors
summary(lm(call~ethnicity+experience+city+honors+school+college+volunteer+quality,data=resumeData))

#Calculate the effect of two additional years of experience
thisLM = lm(call~ethnicity+experience+city+honors+school+college+volunteer+quality,data=resumeData)
names(thisLM)
thisLM$coefficients[3]*2
thisLM$coefficients['experience']*2


#A number of randomization checks
summary(lm(experience~ethnicity,data=resumeData))
summary(lm(jobs~ethnicity,data=resumeData))
summary(lm(honors~ethnicity,data=resumeData))
summary(lm(school~ethnicity,data=resumeData))
summary(lm(volunteer~ethnicity,data=resumeData))
summary(lm(experience~ethnicity,data=resumeData))