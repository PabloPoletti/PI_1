from sqlalchemy import create_engine, MetaData
from sqlalchemy.ext.declarative import declarative_base




CONEXION = 'mysql://root:@localhost:3306/pi_1'

engine =create_engine(CONEXION, pool_pre_ping=True)

meta = MetaData()

conn = engine.connect()