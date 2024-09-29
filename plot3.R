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

# Ploting the sub_metering columns
# The first sub_metering line (Sub_metering_1)
plot(subset_data$Sub_metering_1, 
     type = "l", # 'l' for line plot
     xlab = "",  # No label for x-axis
     ylab = "Energy Sub Metering", 
     main = "Energy Sub Metering Over Time",
     xaxt = "n", # Suppress default x-axis
     col = "black") # Color for the first line

# Adding the second sub_metering line (Sub_metering_2)
lines(subset_data$Sub_metering_2, col = "red")

# Adding the third sub_metering line (Sub_metering_3)
lines(subset_data$Sub_metering_3, col = "blue")

# Adding custom x-axis with three ticks for Thu, Fri, and Sat
axis(1, at = c(1, length(subset_data$Sub_metering_1)/2, length(subset_data$Sub_metering_1)), labels = c("Thu", "Fri", "Sat"))

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty = 1, 
       cex = 0.6,
       xjust = 1)
