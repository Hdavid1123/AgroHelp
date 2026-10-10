import pandas as pd
from pathlib import Path

path = Path.cwd()

while path != path.parent:
    if (path / ".git").exists():
        break
    path = path.parent

base_path = path
data_path = path / "data"

product_prices_path = data_path / "Product_prices"
input_prices_path = data_path / "Input_prices"
radiation_NdS = data_path / "Radiation_NdS"

dfProductPrices2026 = pd.read_excel(
    product_prices_path / "SerieHistoricaMayorista-2026.xlsx",
    skiprows=2,
    header=3
).iloc[:-2]

dfProductPrices2026 = dfProductPrices2026.drop(
    columns=['Código CPC',
             'Código departamento',
             'Código municipio'])