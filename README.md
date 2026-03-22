# Mautic Setup Instructions

## Prerequisites
- PHP 7.3 or later
- MySQL 5.7 or later
- Web Server (Apache or Nginx)

## Installation Steps
1. **Download Mautic**:  
   You can download the latest version of Mautic from the [official website](https://www.mautic.org/download).

2. **Upload to Server**:  
   Upload the extracted Mautic files to your web server directory (e.g., /var/www/html/mautic/).

3. **Set Permissions**:  
   Make sure the following directories are writable by the web server:
   - `app/cache`
   - `app/logs`
   - `app/uploads`

   You can set the permissions with:
   ```bash
   chmod -R 775 app/cache app/logs app/uploads
   ```
   And change ownership:
   ```bash
   chown -R www-data:www-data /path/to/mautic
   ```

4. **Create a Database**:  
   Create a new MySQL database for Mautic.
   ```sql
   CREATE DATABASE mautic_db;
   ```

5. **Configure Mautic**:  
   Access Mautic via your web browser and follow the setup wizard. You will need the database details you created earlier.

## Running Mautic
- Once the setup is complete, access Mautic by navigating to `/mautic` in your browser.
- Log in with the credentials you set up during installation.

## Additional Notes
- Ensure you have cron jobs set up according to the Mautic documentation to automate tasks.
