# CART Models

library(rpart)
library(rpart.plot)
library(forecast)
#install.packages("https://cran.r-project.org/bin/windows/contrib/3.3/RGtk2_2.20.31.zip", repos=NULL)
library(RGtk2)
#install.packages("rattle")
library(rattle)


# Set the working directory to folder where you have placed the Input Data
#setwd("E:\\HHges - Mkt Anyts\\Day3 Material\\Decision_Tree\\CART\\CART-Regression Tree")

Mer_Sales = read.csv(file = "./data/Predict Merchant_Sales v04.csv", header = T)

# Summarize the dataset
summary(Mer_Sales)
str(Mer_Sales)
df2 = Mer_Sales
oldnames = names(df2)
newnames = c('merchid','sales', 'loc', 'zone', 
  'helpers', 'hours', 'years', 'oage', 'oedn','cage',
   'mtype', 'type')
names(df2) = newnames
head(df2)
# Look at the average Annual_Sales()
for(i in 2:ncol(df2))
{
  if(length(unique(df2[,i])) <= 5)
  {
    Annual_Sales = aggregate(x = df2$sales, by = list(df2[,i]), FUN = mean)
    print(colnames(df2)[i])
    print(Annual_Sales)
    print("**********************************")
  }
}
#one by one
aggregate(df2$sales, by=list(df2$loc), FUN=sum)

# Make a copy of the Original Dataset
df2U = df2

# Random Sampling
set.seed(777) # To ensure reproducibility
Index = sample(x = 1:nrow(df2U), size = 0.7*nrow(df2U))
head(Index)
# Create Train dataset
df2UTrain = df2U[Index, ]
nrow(df2UTrain)
summary(df2UTrain)

# Create Test dataset
df2Utest = df2U[-Index, ]
nrow(df2Utest)
summary(df2Utest)


################# Modeling #################################

# Build a full model with default settings
library(rpart)
set.seed(123) # To ensure reproducibility of xerrors (cross validated errors while estimating complexity paramter for tree pruning)
CartFullModel = rpart(formula = sales ~ . , data = df2UTrain[,-1], 
                      method = "anova")
CartFullModel
summary(object = CartFullModel)
# Plot the Regression Tree
library(rpart.plot)
rpart.plot(CartFullModel)
rpart.plot(x = CartFullModel, type = 4,fallen.leaves = T, cex = 0.6)
title("CartFullModel") # Enlarge the plot by clicking on Zoom button in Plots Tab on R Studio

# fancyRpartPlot() function to plot the same model
# Expand the plot window in R Studio to see a presentable output
library(rattle)
fancyRpartPlot(model = CartFullModel, main = "CartFullModel", cex = 0.6) 
#library(RColorBrewer)
#fancyRpartPlot(model = CartFullModel, main = "CartFullModel", cex = 0.6) 

# The following code also produces the same output, but in a windowed form
windows()
fancyRpartPlot(model = CartFullModel, main = "CartFullModel", cex = 0.6)
# CP
printcp(x = CartFullModel)

# This produces a plot which may help particpants to look for a model depending on R-Square values produced at various splits
rsq.rpart(x = CartFullModel)

########################### Using CP to expand / Prune the tree #################################################
# Lets change rpart.control() to specify certain attributes for tree building
RpartControl = rpart.control(cp = 0.005)
set.seed(123)
CartModel_1 = rpart(formula = sales ~ . , 
                    data = df2UTrain[,-1], 
                    method = "anova", control = rpart.control(cp = 0.005))

CartModel_1

CartModel_1$where
trainingnodes = rownames(CartModel_1$frame) [ CartModel_1$where]
trainingnodes

summary(CartModel_1)
rpart.plot(x = CartModel_1, type = 4,fallen.leaves = T, cex = 0.6)

printcp(x = CartModel_1)
rsq.rpart(x = CartModel_1)




####################### Some Extra pointers in R ###########################################


# Model Evaluation Measures on test dataset using the finalized (pruned model)
# Use predict() the get the predicted values for the testset using the finalized model

# Intermediate Model: Finalize CartFullModel (Based on Tree size i.e. Depth, Variables included as well as the R-Square produced)
# Predict on testset
CartFullModelPredictTest = predict(object = CartFullModel,
            newdata = df2Utest, type = "vector")

# Calculate RMSE and MAPE manually
# Participants can calculate RMSE and MAPE using various available functions in R, but that may not
# communicate effectively the mathematical aspect behind the calculations

# RMSE
Act_vs_Pred = CartFullModelPredictTest - df2Utest$sales # Differnce
Act_vs_Pred_Square = Act_vs_Pred^2 # Square
Act_vs_Pred_Square_Mean = mean(Act_vs_Pred_Square) # Mean
Act_vs_Pred_Square_Mean_SqRoot = sqrt(Act_vs_Pred_Square_Mean) # Square Root
Act_vs_Pred_Square_Mean_SqRoot

# MAPE : Mean absoluted %
Act_vs_Pred_Abs = abs(CartFullModelPredictTest - df2Utest$sales) # Absolute Differnce
Act_vs_Pred_Abs_Percent = Act_vs_Pred_Abs/df2Utest$sales # Percent Error
Act_vs_Pred_Abs_Percent_Mean = mean(Act_vs_Pred_Abs_Percent)*100 # Mean
Act_vs_Pred_Abs_Percent_Mean

# Validate RMSE and MAPE calculation with a function in R
library(forecast)
UncappedModelAccuarcy = forecast::accuracy(f = CartFullModelPredictTest, x = df2Utest$sales)

windows()
fancyRpartPlot(model = CartModel_1, main = "Final CART Regression Tree", cex = 0.6, sub = "Model 12")
