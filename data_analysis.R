data <- c(62,75,67,65,68,71,67,81,61,62,67,63,73,
          78,72,57,92,70,59,65,88,67,73,75,66,63,
          67,74,71,80,66,67,78,74,82,60,55,74,82,
          61,57,69,77,77,68,85,67,60,70,64)

numberOfRows = 0;
dataMaxNum = max(data);
dataMinNum = min(data);
maxClassNumInt=0;
minClassNumInt=0;

for(x in dataMaxNum:(dataMaxNum+4))
{
  if(x%%5 == 0)
  {
    maxClassNumInt = x-1;
    break;
  }
}

for(x in dataMinNum:(dataMinNum-4))
{
  if(x%%5 == 0)
  {
    minClassNumInt = x;
    break;
  }
}

numberOfRows = (maxClassNumInt+1) - minClassNumInt
numberOfRows = numberOfRows/5
print(paste("Number of rows: ",numberOfRows))

boundaryNumbers = c()
intervalNumbers = c()
frequencyNumbers = c()
midPoint = c()
for(i in seq(from=minClassNumInt, to=maxClassNumInt, by=5))
{
  loopF=0
  for(y in i:(i+4))
  {
    for(z in data)
    {
      if(z == y)
      {
        loopF = loopF+1;
      }
    }
    
  }
  frequencyNumbers = append(frequencyNumbers,loopF);
  classInterv = paste(i ,"-",i+4);
  intervalNumbers = append(intervalNumbers, classInterv);
  classBound = paste(i-0.5 ,"-",i+4.5);
  boundaryNumbers = append(boundaryNumbers,classBound);
  midPoint = append(midPoint, (i+i+4)/2);
}
groupedData <- data.frame(
  classIntervals = intervalNumbers,
  classBoundary = boundaryNumbers,
  frequency = frequencyNumbers,
  midPoint = midPoint
)
print(groupedData)

xf = midPoint*frequencyNumbers;
MeanNum = sum(xf)/sum(frequencyNumbers);
print(paste("Mean =",MeanNum))

mChecker = sum(frequencyNumbers)/2;
total = 0 
indexM = 0;
fMed1 = 0;
for(i in 1:numberOfRows)
{
  fMed1 = total;
  total = total+frequencyNumbers[c(i)]
  if(total >= mChecker)
  {
    indexM = i;
    
    break;
  }
}
classIntL = strsplit(boundaryNumbers[c(indexM)]," - ")
classIntL = as.double(classIntL[[1]][1])
classIntH = strsplit(boundaryNumbers[c(indexM)]," - ")
classIntH = as.double(classIntH[[1]][2])
w =  classIntH - classIntL;
medianNum = classIntL + ( ( ( (sum(frequencyNumbers)+1) / 2) - fMed1) / frequencyNumbers[c(indexM)] ) *w
print(paste("Median = ", medianNum))

indexM = which.max(frequencyNumbers)
classIntL = strsplit(boundaryNumbers[c(indexM)]," - ")
classIntL = as.double(classIntL[[1]][1])
classIntH = strsplit(boundaryNumbers[c(indexM)]," - ")
classIntH = as.double(classIntH[[1]][2])
w =  classIntH - classIntL;
d1 = frequencyNumbers[c(indexM)] - frequencyNumbers[c(indexM-1)]
d2 = frequencyNumbers[c(indexM)] - frequencyNumbers[c(indexM+1)]
ModeNum = classIntL+(d1/(d1+d2))*w
print(paste("Mode = ", ModeNum))

x2f = midPoint*midPoint*frequencyNumbers;
mean2 = MeanNum * MeanNum;
VarianceNum = (sum(x2f) - (sum(frequencyNumbers)*mean2)) / (sum(frequencyNumbers)-1)
print(paste("Variance = ",VarianceNum))


StandardNum = sqrt(VarianceNum)
print(paste("Standard Deviation = ",StandardNum))


cv = (StandardNum / MeanNum) * 100
print(paste("Coefficient of Variance = ",cv))

skewness = (3*(MeanNum-medianNum))/StandardNum
print(paste("Skewness = ",skewness))
