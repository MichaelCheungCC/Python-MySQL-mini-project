# Insert a record from HKO API

import mysql.connector
import keyring
import requests

MySQL_password=keyring.get_password("MySQL", "root")

r=requests.get('https://data.weather.gov.hk/weatherAPI/opendata/weather.php?dataType=flw&lang=en')
r_json=r.json()
weather_key=r_json.keys()
weather_value=r_json.values()

connection = mysql.connector.connect(host='localhost',
                                     port='3306',
                                     user='root',
                                     password=MySQL_password,
                                     database='weather')

cursor = connection.cursor()

cursor.execute("INSERT INTO `local_weather_forecast`" 
               "(`date`, `generalSituation`, `tcInfo`, `fireDangerWarning`, `forecastPeriod`, `forecastDesc`, `outlook`, `updateTime`)" 
               "VALUES (CURDATE(),'{}','{}','{}','{}','{}','{}','{}');".format(*weather_value)
)

cursor.close()
connection.commit()
connection.close()