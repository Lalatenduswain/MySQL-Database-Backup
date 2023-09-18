# MySQL Database Backup Script With Environment Variables

This Bash script allows you to create daily backups of your MySQL database, saving them in the specified destination directory while retaining only the latest 10 backups. It's a convenient way to ensure your data is backed up regularly.

## Usage

1. **Clone the Repository:**

   Clone this repository to your server where you want to set up the database backup script.

   ```bash
   git clone https://github.com/Lalatenduswain/MySQL-Database-Backup.git
   ```

2. **Edit the Configuration (Optional):**

   You can modify the MySQL username, password, database name, and backup directory in the script (`backup_mysql.sh`) to match your setup.

3. **Make the Script Executable:**

   Make the `backup_mysql.sh` file executable.

   ```bash
   chmod +x backup_mysql.sh
   ```

4. **Test the Backup Script:**

   Before scheduling the script as a cron job, test it by running it manually:

   ```bash
   ./backup_mysql.sh
   ```

   This will create a backup of your MySQL database.

5. **Schedule as a Cron Job:**

   To schedule the script as a daily cron job at 3:00 AM, open your crontab configuration:

   ```bash
   crontab -e
   ```

   Add the following line to run the script every day at 3:00 AM:

   ```bash
   0 3 * * * /path/to/backup_mysql.sh
   ```

   Replace `/path/to/backup_mysql.sh` with the actual path to your script.

6. **Save and Exit**: Save the crontab configuration.

## Using MySQL Passwords with Environment Variables

To securely use MySQL passwords set through environment variables when interacting with the MySQL client, follow these steps:

1. **Set Environment Variables**:

   Before using the MySQL client, set the MySQL username and password as environment variables in your shell session. Replace `"your_username"` and `"your_password"` with your actual MySQL username and password.

   ```bash
   export MYSQL_USER="your_username"
   export MYSQL_PASSWORD="your_password"
   ```

2. **Use Environment Variables in MySQL Client**:

   When running the MySQL client (`mysql` command), reference the environment variables for the MySQL username and password as follows:

   ```bash
   mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD"
   ```

   After running this command, the MySQL client will use the values of the `MYSQL_USER` and `MYSQL_PASSWORD` environment variables to authenticate you to the MySQL server.

3. **Unset Environment Variables (Optional)**:

   After you've finished using the MySQL client, consider unsetting the environment variables to clear sensitive data from your environment:

   ```bash
   unset MYSQL_USER
   unset MYSQL_PASSWORD
   ```

   This practice ensures that sensitive information is not exposed in your environment after usage.

## Donations

If you want to show your appreciation, you can donate via [Buy Me a Coffee](https://www.buymeacoffee.com/lalatendu.swain)

## Author

- **Lalatendu Swain**
- GitHub: [https://github.com/Lalatenduswain](https://github.com/Lalatenduswain)
- Website: [https://blog.lalatendu.info/](https://blog.lalatendu.info/)

## Disclaimer

This script is provided as-is and may require modifications or updates based on your specific environment and requirements. Use it at your own risk. The author of the script is not liable for any damages or issues caused by its usage.
