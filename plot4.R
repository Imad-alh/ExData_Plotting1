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

# ploting 2*2 grid, four line graphs
# Set up the plotting area with a 2x2 grid
par(mfrow = c(2, 2))

#first plot: Global_active_power
plot(subset_data$Global_active_power, 
     type = "l", # 'l' for line plot
     xlab = "",  # No label for x-axis
     ylab = "Global Active Power (kilowatts)", 
     xaxt = "n") # Suppress default x-axis

# Add custom x-axis with three ticks for Thu, Fri, and Sat
axis(1, at = c(1, length(subset_data$Global_active_power)/2, length(subset_data$Global_active_power)), 
     labels = c("Thu", "Fri", "Sat"))


# second plot: Voltage
plot(subset_data$Voltage, 
     type = "l", # 'l' for line plot
     xlab = "datetime",  
     ylab = "Voltage (volt)", 
     main = "Voltage Over Time",
     xaxt = "n", # Suppress default x-axis
     col = "black") # Color for the line

# Add custom x-axis with three ticks for Thu, Fri, and Sat
axis(1, at = c(1, length(subset_data$Voltage)/2, length(subset_data$Voltage)), labels = c("Thu", "Fri", "Sat"))


# third plot: Sub_metering
# Plot the first sub_metering line (Sub_metering_1)
plot(subset_data$Sub_metering_1, 
     type = "l", # 'l' for line plot
     xlab = "",  # No label for x-axis
     ylab = "Energy Sub Metering", 
     main = "Energy Sub Metering Over Time",
     xaxt = "n", # Suppress default x-axis
     col = "black") # Color for the first line

# Add the second sub_metering line (Sub_metering_2)
lines(subset_data$Sub_metering_2, col = "red")

# Add the third sub_metering line (Sub_metering_3)
lines(subset_data$Sub_metering_3, col = "blue")

# Add custom x-axis with three ticks for Thu, Fri, and Sat
axis(1, at = c(1, length(subset_data$Sub_metering_1)/2, length(subset_data$Sub_metering_1)), labels = c("Thu", "Fri", "Sat"))

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty = 1, 
       cex = 0.4,
       xjust = 1)


# Fourth plot: Global_reactive_power
plot(subset_data$Global_reactive_power, 
     type = "l", # 'l' for line plot
     xlab = "datetime",  
     ylab = "Global Reactive Power (kilowatt)", 
     main = "Global Reactive Power Over Time",
     xaxt = "n", # Suppress default x-axis
     col = "black") # Color for the line

# Add custom x-axis with three ticks for Thu, Fri, and Sat
axis(1, at = c(1, length(subset_data$Global_reactive_power)/2, length(subset_data$Global_reactive_power)), labels = c("Thu", "Fri", "Sat"))