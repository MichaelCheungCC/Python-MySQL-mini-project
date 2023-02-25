# Create table 'local_weather_forecast' in database 'weather'

import mysql.connector
import keyring

MySQL_password=keyring.get_password("MySQL", "root")

connection = mysql.connector.connect(host='localhost',
                                     port='3306',
                                     user='root',
                                     password=MySQL_password,
                                     database='weather')

cursor = connection.cursor()

try:
    cursor.execute("create table `local_weather_forecast`("
        "`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,"
        "`date` DATE,"
        "`generalSituation` VARCHAR(1000),"
        "`tcInfo` VARCHAR(1000), "
        "`fireDangerWarning` VARCHAR(1000),"
        "`forecastPeriod` VARCHAR(1000),"
        "`forecastDesc` VARCHAR(1000),"
        "`outlook` VARCHAR(1000),"
        "`updateTime` VARCHAR(1000)"
        ");"
    )
    print('Table "local_weather_forecast" created successfully.')
except mysql.connector.Error as err:
    print(err)

cursor.close()
connection.close()