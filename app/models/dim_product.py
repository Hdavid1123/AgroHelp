from sqlalchemy import String
from sqlalchemy.orm import Mapped, mapped_column

from app.database import Base


class DimProduct(Base):
    __tablename__ = "dim_product"

    id_product: Mapped[int] = mapped_column(
        primary_key=True
    )

    nombre: Mapped[str] = mapped_column(
        String(100),
        nullable=False,
    )

    segmento: Mapped[str | None] = mapped_column(
        String(50),
        nullable=True,
    )