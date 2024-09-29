library(data.table)

# Loading the files
data <- fread("household_power_consumption.txt", sep = ";")

# Convert 'Date' to Date type 
data[, Date := as.Date(Date, format = "%d/%m/%Y")]

# Filter for dates 2007-02-01 and 2007-02-02
subset_data <- data[Date >= "2007-02-01" & Date <= "2007-02-02"]

# Converting columns to numeric types
subset_data[, Global_active_power := as.numeric(Global_active_power)]
subset_data[, Global_reactive_power := as.numeric(Global_reactive_power)]
subset_data[, Voltage := as.numeric(Voltage)]
subset_data[, Global_intensity := as.numeric(Global_intensity)]
subset_data[, Sub_metering_1 := as.numeric(Sub_metering_1)]
subset_data[, Sub_metering_2 := as.numeric(Sub_metering_2)]
subset_data[, Sub_metering_3 := as.numeric(Sub_metering_3)]

# ploting the Global Active Power histogram
hist(subset_data$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     col = "red",
     border = "black")

