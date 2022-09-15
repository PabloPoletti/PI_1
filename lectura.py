import mysql.connector
from mysql.connector import Error

try:
    conexion=mysql.connector.connect(
        host='127.0.0.1',
        port='',
        user='root',
        password='',
        db='pi_1'

    )
    if conexion.is_connected():
        print('conexion exitosa')
        
        cursor=conexion.cursor()
        cursor.execute('SELECT database();')
        registro=cursor.fetchone()
        print('Conectado a las BD: ', registro)
        cursor.execute('SELECT count(circuitId), circuitId, name FROM races2 group by circuitId order by 1 desc limit 3')
        resultados=cursor.fetchall()
        for fila in resultados:
            print(fila[0], fila[1], fila[2] )
        print('Total de Registros: ', cursor.rowcount)

except Error as ex:
    print('Error durante la conexion:', ex)

finally:
    if conexion.is_connected():
        conexion.close() # Se Cerro La Conexion
        print('La conexion ha finalizado.')
