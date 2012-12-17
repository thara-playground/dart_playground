
void main() {
  
  // Get the current date and time.
  var now = new Date.now();
  
  // Create a new Date with the local time zone.
  var y2k = new Date(2000, 1, 1, 0, 0, 0, 0);
  
  // You can also use named parameters. ********************************
  y2k = new Date(2000, 1, 1, 0, 0, 0, 0);
  
  // Specify a UTC date and time in milliseconds since Unix epoch.
  y2k = new Date.fromMillisecondsSinceEpoch(946684800000, isUtc: true);
  
  // Parse an ISO 8601 date.
  y2k = new Date.fromString("2000-01-01T00:00:00Z");
  assert(y2k.millisecondsSinceEpoch == 946684800000);

  // Add one year
  var y2001 = y2k.add(const Duration(days : 366));
  assert(y2001.year == 2001);
  
  // Substract 30 days.
  var december2000 = y2001.subtract(const Duration(days: 30));
  assert(december2000.year == 2000);
  assert(december2000.month == 12);
  
  // Calculate the difference between two dates.
  // Returns a Duration object.
  var duration = y2001.difference(y2k);
  assert(duration.inDays == 366); // y2k was a leap year.
  
}

