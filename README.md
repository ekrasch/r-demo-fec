# r-demo-fec
Short demo of R and RStudio basics, using campaign finance data from the FEC. 


# Intro to R using FEC Data

The goal of this intro demo/workshop is to introduce you to R and
RStudio. While this will in no means make you proficient in R, my hope
is that it make spark an interest in data or make you aware of a new
tool you could learn to expand your capabilities.

R is a free software environment for statistical programming, data
analysis, and general coding. I prefer to use R in the IDE (integrated
development environment) RStudio. RStudio makes R a little more user
friendly and sets up your interface well for ease of use. To download
and install R and RStudio, view the install instructions.

### Touring RStudio

When you first open RStudio, you will see three windows.

On the left is your console, where you can type code and see its result. 
In the upper right, you have the environment window, where you can see objects you have created- usually variables or data sets. 
In the lower right, you have a files pane, which will show files as you import or create them. 
You can also change the panes through the tabs on the top of each pane to view different things as you code. 
This will be most important in the lower right pane, where we may want to view the plots we create or seek help.

# R Basics

As I mentioned, you can type code in the console. Let's begin there.

#### Some Notes on Syntax and Code Formatting
In this case (and in almost all of my day-to-day coding) I tend to add spaces between my numbers, symbols and commands. 
I think this makes it more readable, but you should feel free to eliminate the spaces or double space. 
The only time spacing in R matters to how your code executes is when there is a line break: your code will not execute across a line break, except in special cases where a single command spans multiple lines.

R is very picky about spelling and capitalization, and won't give many hints when you get this wrong, other than saying "Object Not Found". 
For this reason, I would suggest using consistent naming conventions.
For example, I like to make my variable and data set names a short as possible, using all lower case and separating words with underscores. 

### R as a calculator

We can use basic math symbols in R, just like in a calculator. 
To run code (or 'execute' code) in the console, simply hit enter.

```{r}
4 + 5 
```

If you ever type an incomplete expression, R will ask you to finish the command in the console by adding a '+'. 

```{r error = TRUE}
1/
```
You can exit this by clicking escape, or by finishing the expression. 

```{r}
1/
2 
```

### Complex Math Functions

You can also use more complex math functions.

```{r}
5^2
log(20)
```

### PEMDAS

When completing math expressions with multiple operations, R uses PEMDAS, without the need for prompting by using unnecessary parenthesis.
You can write code with as few or as many parenthesis as you like- keep in mind what kind of notation will be most readable for you.

```{r}
4 + 7 * 2^3
2 + (7 * (3^2))
```
However, R does not recognize a parenthesis as a multiplication operator without the multiplication sign.
```{r error = TRUE}
4 + 7 (2^3)    
```

### Warnings and Errors

Warnings and errors will happen, no matter how comfortable you are with R. 
A *warning* means your code has run, but R thinks something may be off about it- either it didn't do what R think you might want to do, something had to be coerced, or any one of a host of things that don't prevent your code from running but may give an unexpected or incorrect output. 
An *error* means your code was halted- usually this is a syntax or spelling error, or something wasn't loaded in correctly. 
Most errors are fairly easy to fix if with a simple google, or search in the help panel.

### Variables

You can create and save variables in R using an assignment arrow. 
There are other ways to assign things, but the arrow is the most infallable (and can make your code easier to read than the other methods).

You can use the variable you create in math functions or any other code.

```{r}
x <- 3
y <- x^3
z <- x + y
```
```{r echo = FALSE}
x
y
z
```

Keep in mind, if you change one variable, you will have to re-run any code that uses it for your other variables to be updated.

### Saving

Running code in the console puts our variables and anything else we create into the environment, but this is not a way to save the objects or the code we used to create these objects. 
To create savable, reproducible code, let's start an ***R project***.

`File -> New Project`

You can name your project whatever you like, but try to make it a concise but descriptive name (I chose to name my project "FEC-demo").
It may ask you to save your workspace- click no. 
For best reproducibility practices, you will want to avoid saving your workspace. 
More on this soon.

Once your new project opens, you can check to make sure R is working in the right place by running `wd()`. 
This checks the *working directory* of your project, and should return the project you just created. 
The working directory is the place that your code, plots, and files will save to; you can think about it like the home for this specific project within your computer, making it easier to organize inputs and find outputs.

After creating a project, let's create an ***R Script***.

`File -> New File -> R Script`

This should add a fourth pane to your view- this is your script. 
Anything you type here can be saved, rerun without copy-pasting, and edited in-place. 
Get in the habit of saving any code you use to create objects you want to be able to create again.
This way, you can avoid saving your workspace image (all the things you typed or ran in a single session), and rely on your script.
This is preferable because it means anyone you send your code to, including yourself running your code on a different device, should have all the code they need to recreate everything important.
It also means you can see all the steps it took for you to get from an input to an output, making it easy to make changes and find issues.
This is a practice called 'reproducibility', and is one of the benefits of coding in R.

Code in the script does not automatically run when you hit return. 
To run code in your script, click 'Run' in the upper right hand of the pane, or use a keyboard shortcut to run the current line:

* Mac: Command + Return
* Windows: Ctrl + Enter

# Installing & Loading Packages

R has lots of functionality on its own, as we have seen and will continue to explore. 
We may want additional functionalities to do fancier operations, make prettier plots, or do something using a more streamlined method. 
To gain these functionalities, we will need to install and load *packages*.

Think about each package like a book on your bookshelf. 
Each book contains unique knowledge.
To use the informatino in a book, you first need to obtain it- this is like the installing step.

You only need to install a package once each time you update R (not RStudio) or when you switch to a new device. You can do this by running `install.packages()` with the name of the package in the parenthesis within quotations. Lets try:
```{r eval = FALSE}
install.packages("tidyverse")
```

Or, you can install packages in the Packages tab of the lower right pane by clicking the tab, clicking 'Install', then typing the name of any packages you want to install.

Because you only need to install packages once, I usually do this in the console, without saving it to my code.

While you only need to download a package once, you will have to load any packages you want to use each time you open up a new session of R.
You can think of this like pulling your book off your bookshelf. 
Packages that you have installed are 'on your shelf', but you can't read them unless you pull them off and open them up.

I suggest typing out the command to load packages at the top of every R script or file- this makes it easy for you and others to know what packages you need for a script, and to see which packages you may need to install when you update R or change machines.

```{r}
library(tidyverse)
```

The output that appears below the `library()` command tells us everything that was loaded.
The `tidyverse` package loads in a whole group of packages needed for reading, manipulating, and visualizing data, hence why this output is so long.

### Install & Load Packages for demo

Let's install the other packages we will need for the demo. 

```{r eval = FALSE}
install.packages("knitr")
install.packages("forcats")
```
```{r, warning = FALSE}
library(knitr, forcats)
``` 

You can put packages together in a library command separated by commas, as above, or in their own line, like this:
```{r}
library(knitr)
library(forcats)
```

# Importing Data

R can use many, many types of files.
We will be working with a CSV file. 
CSV stands for comma separated value because data values are usually separated by commas 'behind the scenes' of the dataset.
It is a common data type, as it can be opened in Excel, any system like R, or as a plain text file. 

You can import data in two main ways: via a command or in the files panel. 
I recommend using a hybrid of both to make sure you get your file path correct. 
Your file path are the directions given to R that tell it where to find your file in your computer.
Ideally, we will put our data inside our working directory that we created earlier, which will make it easier to find.

In the top ribbon of the files tab, navigate back to home by clicking on the house then navigate to the file you want to import just like you would in your computer file folder. 
Click on the file, then select 'Import Dataset'. 
A dialogue window should pop up with a small code window in the lower right corner. 
Copy and paste this code from the window into your script (you can exit this dialogue box by clicking 'Cancel'), then change the suggested name for the dataset to your preferred name. 
You can also edit the name in the window, click 'Import', then copy and paste the code from the console to your script. 
You could use the name R suggests, but these are often long and non-descript.

In this case, let's name our dataset `fec_raw`. 

```{r}
fec_raw <- read_csv("politicalcontributions_smalldonations_q1q2_2024.csv")
```

Your filepath may be different than mine, because you might have your data stored in a different folder; this is why I like using the files panel to make sure I have the right filepath.

For this demo, we will use FEC political contributions data from the first half of 2024. For notes on the data, see the "Codebook" file.

When we import a dataset, it can be useful to view the first few rows, which we can do with `head()`.
If you want to learn more about the function, you can type it preceded by a question mark to pull up the help file in the lower right pane.

```{r}
head(fec_raw) 
?head
```

You can view column names in a similar way.
You can also get help by using the `help()` command.

```{r}
colnames(fec_raw) 
help(colnames)
```

I like to view the column names so I can refer back to them.
This is useful for proper spelling, the inclusion of spaces, and really long column names that I may not want to take the time to type out.

# Data Manipulation

Data manipulation is not as bad as it sounds; it is simply the transformation of data to make it easier to read or understand, create new variables, clean out errors, or filter for relevance.

### Selecting Columns & Rows, Renaming

We can select the columns we want to use (or remove the columns we don't) using the `select()` command from the tidyverse.
The arguments of `select()` are similar to many other functions in R: first, the name of the dataset you want to apply the function to, then any specifications for the function. 
For `select()`, the second argument is a column we want to keep or remove.
Preceding the column name with `!` indicates to R that we want to remove a column, not keep it.

Lets remove the index column, which is a number given to each observation. 
```{r}
fec <- select(fec_raw, !"...1") 
```

When we use tidyverse functions, we can use something called a pipe `%>%`. 
This allows us to string multiple functions together, which is useful to prevent unnecessary repetition.
When using a pipe, we can start by specifying the dataset we want to work with for the whole chunk of code, then attach functions.
In the attached functions, we don't need to specify the dataset- we already told R what we want to work on at the beginning of the pipe. 

```{r}
fec <- fec_raw %>% 
  select(donor_city,
         donation_date,
         contribution_receipt_amount)
```

Note, we can input multiple columns into the `select()` function separated by commas.
The above columns are being kept, not gotten rid of, because we did not add an `!` in front of any variable names.
I can split this function across multiple commas by ending each line with a comma, which will tell R I am not done and to look at the next line.

Multiple pipes can be strung together to apply different functions. Let's add `rename()` to give a column a better name and `filter()` to get rid of rows based on a condition (to see why we are filtering here, see the Codebook).
Pipes are especially useful because they allow us to remove repetition then stringing together multiple functions like this.
```{r}
fec <- fec_raw %>% 
  select(donor_city,
         donation_date,
         contribution_receipt_amount) %>%
  rename(amount = contribution_receipt_amount) %>%
  filter(amount > 0)
```
See, we were able to run three functions that would normally all need us to specify the dataframe we were working from without repeating ourselves!

This is starting to look like a lot of code. 
In R, we can add notes (called 'comments') right in our code by using pound signs `#`. 
Anything that follows the `#` will be omitted from your code.
This makes it really useful as a tool to add notes to yourself, but make sure you put it after all your code- anything to the right of the `#` on a line will not run.

```{r}
fec <- fec_raw %>% 
  select(donor_city, # select columns
         donation_date,
         contribution_receipt_amount) %>%
  rename(amount = contribution_receipt_amount) %>% #new col name = old col name
  filter(amount > 0) # removes rows based on condition
```

This can also be used as a way to selectively omit lines of code. 
If one line doesn't work, or you want to compare the results of one line versus another, you can type both out and omit one by commenting it out. 
Let's check this out by comparing the number or rows left in our `fec` dataframe to one where we comment out `filter()` and the pipe preceeding it. We can use `nrow()` to simply print the number of rows in a dataset.
```{r}
fec_no_filter <- fec_raw %>% 
  select(donor_city, # select columns
         donation_date,
         contribution_receipt_amount) %>%
  rename(amount = contribution_receipt_amount) #%>% #commented out pipe
  #filter(amount > 0) # commented out filter, as a test
```
```{r}
nrow(fec)
nrow(fec_no_filter)
```

### Summary

Once we have our data narrowed down, we can look at a summary of all our variables: 

```{r}
summary(fec) 
```

Or we can get a summary for just one variable. Using a dollar sign allows us to specify a single column in a dataframe using the notation `dataframe$column`. This notation works many places in R.
```{r}
summary(fec$amount)
```


### Grouped Summary

Maybe we want to look at a summary, but we want something other than a broad five-number summary. If we want to look at contributions by city, we could `filter()` based on city and run the above `summary()` for every city. This means we would have to specify a *ton* of cities, which is tedious and error prone.

Or, we can use `group_by()` and `summarize()` to get summaries by group. 

`group_by()` creates a grouped object to operate on, returning results for each group in the dataset without making you repeat yourself. Within `summarize()`, we can create new columns of a summary table based on the groups we created.

```{r}
fec_by_city <- fec %>% 
  group_by(donor_city) %>% 
  summarize(total_amt = sum(amount))
head(fec_by_city)
```

This creates a new summary dataframe, giving us the sum of each city (or whatever unit we want to see). We can make multiple summary columns in one `summarize()` command.
```{r}
fec_by_city <- fec %>% 
  group_by(donor_city) %>% 
  summarize(total_amt = sum(amount), # can also spell summarise() 
            count = n(), # n() returns number of rows
            amt_pp = (sum(amount) / n())) # gives amount per person
head(fec_by_city)
```

# Plotting

We can use the data we have imported or created to make visualizations. You can plot in base R, without importing any packages, or in one of many plotting packages. The most common plotting package is ggplot, which is part of the tidyverse.

### Plotting in Base R
Plotting in base R is quick, but it takes some work to make the plots look pretty. I find it best for the exploratory plots I make when I am trying to explore the data when don't mind a simplistic look. 

Here, let's make a boxplot of contributions per person. We can use the dollar sign notation to specify the column we want to graph.

```{r}
boxplot(fec_by_city$amt_pp)
```

Let's also make a scatterplot that relates contribution per resident to overall contributions for each city. Scatterplots require us to specify an x and then a y variable, separated by commas.
```{r}
plot(fec_by_city$amt_pp, fec_by_city$total_amt)
```

From these plots, we can tell that there are a few cities that have much higher contributions per person, but there doesn't appear to be a clear, strong relationship between amount per person and the total amount donated in a city. 

### Plotting with GGplot
Plotting in ggplot takes a little more effort, but it gives us a lot more flexibility. 
The plots can be easier to read and we can make them much prettier: we are able to add multiple layers to the same plot, change colors and labels, and customize the plot in fun ways. 

GGplot uses the 'grammar of graphics'.
In a nutshell, this means that we build the plot using layers.
First, specify the dataset. 
```{r}
ggplot(fec_by_city)
```

A blank plot, great! 
R has our data but doesn't know what we want to do with it yet.

Next, let's add some axes. 
We want amount per person (`amt_pp`) on the x axis and total amount (`total_amt`) on the y axis. 
Keep in mind, both of these are still grouped by city, because `fec_by_city` was created using `group_by`, so it will plot our data by city.

```{r}
ggplot(fec_by_city, aes(x = amt_pp, y = total_amt))
```

This gives us the ranges of each of our variables of interest and some axis labels, which lets us know R accepted our variables is ready to graph.

Let's add a graphing layer.

```{r}
ggplot(fec_by_city, aes(x = amt_pp, y = total_amt)) +
  geom_point()
```

This produces the same plot we made with base R, but with a couple bonuses.
First, we have a gridded background that makes some of our data easier to read.
We can specify a theme in another graphical layer if we want to change from the default.
We can also do fun things like change the color of the points, or the axis labels.

For fun, and to show off the capabilities of ggplot just a little more, let's play with another plot.
Because ggplot is in the tidyverse, we can use the tidyverse pipe and manipulate our data in the same chunk as we make our plot. 
This code chunk:

* specifies our data
* selects the 10 cities with highest total donation amounts
* plots our axes, using `fct_reorder()` to arrange our x values from highest to lowest value of `total_amt`
* colors the columns based on the the amount donated per person for that county
* specifies that we want a bar graph (bar and column do the same thing in R, but have different specifications)
* edits the axis and legend labels
* makes the background theme 'minimal', a white background with light grey grid
* flips the x and y axes, for readability or style

```{r}
fec_by_city %>% 
  top_n(10, total_amt) %>% # selects 10 highest total cities
  ggplot(aes(x = fct_reorder(donor_city, total_amt), #make sure our x values are arranged
             y = total_amt, 
             fill = amt_pp)) + #color columns based on amount per person
  geom_col() + # plotting layer
  labs(title = "Top 10 Cities by Total Donations", # labels 
       x = "City", 
       y = "Total Donations", 
       fill = "Avg. Donation") + 
  theme_minimal() + # make background more simple
  coord_flip() # flip x & y
```

This shows that we can dictate color (even based on a variable), change labels, and even switch the axes if we want: everything in ggplot custom. 

# Conclusion

R has even more capabilities that we covered here.
The CRAN has over 10,000 packages and growing, meaning there are tens of thousands of functions for you to discover.
For example, Shiny can make interactive graphics, APIs pull huge amounts of data, and many packages can create maps from scratch. 
Inside RStudio, you can make word documents or power-points that seamlessly blend code with text using markdown.

By learning the basics of R, a world of data is at your fingertips for you to explore.