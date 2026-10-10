project/
│
├── data/
│   ├── raw/
│   ├── staging/
│   └── processed/
│
├── config/
│   ├── ventas.yaml
│   ├── clima.yaml
│   └── productos.yaml
│
├── src/
│   ├── ingestion/
│   ├── cleaning/
│   ├── validation/
│   ├── transformations/
│   │   ├── ventas.py
│   │   ├── clima.py
│   │   └── productos.py
│   └── loading/
│
├── sql/
│   ├── dimensions/
│   ├── facts/
│   └── ml/
│
└── pipeline.py