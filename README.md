# API Assessment Project

# Platform requirements
Python: 3.8.1
MySQL: 5.7
Django: 3.0

# Database
Use 'api_assessment.sql' file to load the database with all required tables.

# API Endpoints
Default:
http://localhost:8000/employees/

With query string:
http://localhost:8000/employees/?chunk=2

Default page size = 10 records per page
If you want to change records per page, just change below value as per requirement in 'settings.py' file.
'PAGE_SIZE': 10,
