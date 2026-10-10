import os
from dotenv import load_dotenv
from sqlalchemy import create_engine
from sqlalchemy.orm import DeclarativeBase, sessionmaker


load_dotenv()

DATABASE_URL = os.getenv("DATABASE_URL")

if not DATABASE_URL:
    raise RuntimeError(
        "No se ha configurado la variable DATABASE_URL"
    )

# Motor de conexión a la base de datos
engine = create_engine(
    DATABASE_URL,
    pool_pre_ping=True,
)

class Base(DeclarativeBase):
    pass

# Fábrica de sesiones
SessionLocal = sessionmaker(
    bind=engine,
    autoflush=False,
    expire_on_commit=False,
)