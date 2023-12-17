from sqlalchemy import create_engine, or_
from sqlalchemy.orm import sessionmaker
from ORM import Person

def return_session(): 
    USER = "root"
    PASSWORD = "Vsixp1jg3Kc7"
    HOST = "127.0.0.1"
    DB = "pysql"
    PORT = "3306"
    CONNECT = f"mysql+pymysql://{USER}:{PASSWORD}@{HOST}:{PORT}/{DB}"

    engine = create_engine(CONNECT, echo=False)
    Session = sessionmaker(bind=engine)
    return Session()

session = return_session()
person = Person(
    name="Linek", 
    user="Niki", 
    passw="852963"
)

# x = session.query(Person).all()
#   x = session.query(Person).filter(Person.name == 'Linek').filter(Person.user == 'Niki').all()
# x = session.query(Person).filter_by(name="Linek")
# for i in x:
#     print(i.name, i.user, i.passw)

# x = session.query(Person).filter(or_(Person.name == 'Linek', Person.user == 'Niki')).all()

# for i in x:
#     print(i.name, i.user, i.passw)

# x = session.query(Person).filter(Person.id == 1).all()
# x[0].name = 'Lineks'
# session.commit()

# for i in x:
#     print(i.name, i.user, i.passw)

#  x = session.query(Person).filter(Person.id == 1).delete()
# x = session.query(Person).filter(Person.id == 1).one()
# session.delete(x)
# session.commit()

# for i in x:
#     print(i.name, i.user, i.passw)