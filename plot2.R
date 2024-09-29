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


# ploting Global_active_power lineGraph
plot(subset_data$Global_active_power, 
     type = "l", # 'l' for line plot
     xlab = "",  # No label for x-axis
     ylab = "Global Active Power (kilowatts)", 
     xaxt = "n") # Suppress default x-axis

# Add custom x-axis with three ticks for Thu, Fri, and Sat
axis(1, at = c(1, length(subset_data$Global_active_power)/2, length(subset_data$Global_active_power)), 
     labels = c("Thu", "Fri", "Sat"))