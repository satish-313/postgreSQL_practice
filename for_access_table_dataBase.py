import os

from sqlalchemy import create_engine
from sqlalchemy.orm import scoped_session , sessionmaker

engine = create_engine('postgresql://postgres:satish@localhost/postgres')
db = scoped_session(sessionmaker(bind = engine))

def main():
    flights = db.execute("SELECT origin , destination ,duration FROM flights").fetchall()
    for f in flights:
        print(f"{f.origin} to {f.destination} , {f.duration} minute. ")

if __name__ == "__main__":
    main()

