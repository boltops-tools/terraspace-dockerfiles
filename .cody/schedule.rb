# Run at 12:00 pm (UTC) every day
cron("0 12 * * ? *") unless Cody.env == "development"
