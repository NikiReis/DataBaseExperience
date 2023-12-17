from sqlalchemy import create_engine, Column, Table, String, Integer, ForeignKey
from sqlalchemy.ext.declarative import declarative_base 
from sqlalchemy.orm import sessionmaker

USER = "root"
PASSWORD = "Vsixp1jg3Kc7"
HOST = "127.0.0.1"
DB = "pysql"
PORT = "3306"
CONNECT = f"mysql+pymysql://{USER}:{PASSWORD}@{HOST}:{PORT}/{DB}"

engine = create_engine(CONNECT, echo=False)
Session = sessionmaker(bind=engine)
Base = declarative_base()

class Person(Base):
    __tablename__ = 'person'
    id = Column(Integer, primary_key=True)
    name = Column(String(60))
    user = Column(String(20))
    passw = Column(String(11))

Base.metadata.create_all(engine)

class Category(Base):
    __tablename__ = 'category'
    id = Column(Integer, primary_key=True)
    category = Column(String(50))

class Product(Base):
    __tablename__ = 'product'
    id = Column(Integer, primary_key=True)
    product = Column(String(50))
    idcategoria = Column(Integer, ForeignKey("catergoria.id"))