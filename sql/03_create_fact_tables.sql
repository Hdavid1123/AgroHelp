CREATE TABLE fact_product_price (
    product_price_id INTEGER GENERATED ALWAYS AS IDENTITY,

    product_id INTEGER NOT NULL,

    market_id INTEGER NOT NULL,

    product_price_date TIMESTAMP NOT NULL,

    price NUMERIC(12,2) NOT NULL,

    currency VARCHAR(10) NOT NULL,

    CONSTRAINT pk_product_price
        PRIMARY KEY (product_price_id),

    CONSTRAINT fk_product_id
        FOREIGN KEY (product_id)
        REFERENCES dim_product(product_id),
    
    CONSTRAINT fk_market_id
        FOREIGN KEY (market_id)
        REFERENCES dim_market(market_id),

    CONSTRAINT ck_product_price
        CHECK (price >= 0)
);

CREATE TABLE fact_supplie_price (
    supplie_price_id INTEGER GENERATED ALWAYS AS IDENTITY,

    supplie_id INTEGER NOT NULL,

    supple_price_date TIMESTAMP NOT NULL,

    price NUMERIC(12,2) NOT NULL,

    currency VARCHAR(10) NOT NULL,

    measure_unit VARCHAR(10) NOT NULL, 

    CONSTRAINT pk_supplie_price
        PRIMARY KEY (supplie_price_id),

    CONSTRAINT fk_supplie_id
        FOREIGN KEY (supplie_id)
        REFERENCES dim_supplie(supplie_id)
);

CREATE TABLE fact_import (
    import_id INTEGER GENERATED ALWAYS AS IDENTITY,

    product_id INTEGER NOT NULL,

    import_date TIMESTAMP NOT NULL,

    quantity NUMERIC(20,2) NOT NULL,

    import_value NUMERIC(20,2) NOT NULL,

    currency VARCHAR(10) NOT NULL,

    source_id INTEGER NOT NULL,

    import_code VARCHAR(10),

    CONSTRAINT pk_import
        PRIMARY KEY (import_id),

    CONSTRAINT fk_product_id
        FOREIGN KEY (product_id)
        REFERENCES dim_product(product_id),

    CONSTRAINT uk_import_code
        UNIQUE (import_code)
);

CREATE TABLE fact_weather (
    weather_id INTEGER GENERATED ALWAYS AS IDENTITY,

    location_id INTEGER NOT NULL,

    weather_date TIMESTAMP NOT NULL,

    mean_temperature DOUBLE PRECISION NOT NULL,

    min_temperature DOUBLE PRECISION NOT NULL,

    max_temperature DOUBLE PRECISION NOT NULL,

    precipitation DOUBLE PRECISION NOT NULL,

    humidity DOUBLE PRECISION NOT NULL,

    solar_radiation DOUBLE PRECISION NOT NULL,

    source_id INTEGER NOT NULL,

    CONSTRAINT pk_weather
        PRIMARY KEY (weather_id),

    CONSTRAINT fk_location_id
        FOREIGN KEY (location_id)
        REFERENCES dim_location(location_id),

    CONSTRAINT fk_source_id
        FOREIGN KEY (source_id)
        REFERENCES dim_source(source_id)
);

CREATE TABLE fact_energy_price (
    energy_price_id INTEGER GENERATED ALWAYS AS IDENTITY,

    energy_type_id INTEGER NOT NULL,

    location_id INTEGER NOT NULL,
    
    energy_price_date TIMESTAMP NOT NULL,

    price NUMERIC(20,2) NOT NULL,

    currency VARCHAR(10) NOT NULL,

    measure_unit VARCHAR(10) NOT NULL,

    source_id INTEGER NOT NULL,

    CONSTRAINT pk_energy_price
        PRIMARY KEY (energy_price_id),

    CONSTRAINT fk_energy_type_id
        FOREIGN KEY (energy_type_id)
        REFERENCES dim_energy_type(energy_type_id)
);



