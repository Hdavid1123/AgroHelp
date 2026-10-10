CREATE TABLE dim_product (
    product_id INTEGER GENERATED ALWAYS AS IDENTITY,

    cpc_code VARCHAR(10) NOT NULL,

    product_name VARCHAR(100) NOT NULL,

    product_type VARCHAR(100) NOT NULL,

    measure_unit VARCHAR(10) NOT NULL,

    CONSTRAINT pk_product
        PRIMARY KEY (product_id),

    CONSTRAINT uk_cpc_code
        UNIQUE (cpc_code)
);

CREATE TABLE dim_location (
    location_id INTEGER GENERATED ALWAYS AS IDENTITY,

    department_code VARCHAR(10) NOT NULL,

    department VARCHAR(100) NOT NULL,

    city_code VARCHAR(10) NOT NULL,

    city VARCHAR(100) NOT NULL,

    latitude DOUBLE PRECISION NOT NULL,

    longitude DOUBLE PRECISION NOT NULL, 

    CONSTRAINT pk_location
        PRIMARY KEY (location_id),

    CONSTRAINT uk_city_code
        UNIQUE (city_code)
);

CREATE TABLE dim_market (
    market_id INTEGER GENERATED ALWAYS AS IDENTITY,

    market_name VARCHAR(100) NOT NULL,

    location_id INTEGER NOT NULL,

    CONSTRAINT pk_market
        PRIMARY KEY (market_id),

    CONSTRAINT uk_market_name
        UNIQUE (market_name),

    CONSTRAINT fk_location_id
        FOREIGN KEY (location_id)
        REFERENCES dim_location(location_id)
);

CREATE TABLE dim_supplie (
    supplie_id INTEGER GENERATED ALWAYS AS IDENTITY,

    supplie_code VARCHAR(10) NOT NULL,

    supplie_name VARCHAR(100) NOT NULL,

    category VARCHAR(100) NOT NULL,

    measure_unit VARCHAR(10) NOT NULL,

    brand VARCHAR(100) NOT NULL,

    CONSTRAINT pk_supplie
        PRIMARY KEY (supplie_id),

    CONSTRAINT uk_supplie_code
        UNIQUE (supplie_code)
);

CREATE TABLE dim_source (
    source_id INTEGER GENERATED ALWAYS AS IDENTITY,

    source_name VARCHAR(100) NOT NULL,

    source_url VARCHAR(100) NOT NULL,

    source_kind VARCHAR(100) NOT NULL,

    source_description VARCHAR(200) NOT NULL,

    CONSTRAINT pk_source_id
        PRIMARY KEY (source_id),

    CONSTRAINT uk_source_url
        UNIQUE (source_url)
);

CREATE TABLE dim_energy_type (
    energy_type_id INTEGER GENERATED ALWAYS AS IDENTITY,

    energy_type_name VARCHAR(100) NOT NULL,

    category VARCHAR(100) NOT NULL,

    measure_unit VARCHAR(10) NOT NULL,

    CONSTRAINT pk_energy_type
        PRIMARY KEY (energy_type_id),

    CONSTRAINT uk_energy_type_name
        UNIQUE (energy_type_name)
);




