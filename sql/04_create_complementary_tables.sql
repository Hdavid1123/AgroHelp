CREATE TABLE trade_flow (
    flow_id INTEGER GENERATED ALWAYS AS IDENTITY,

    product_id INTEGER NOT NULL,

    origin_location_id INTEGER NOT NULL,

    destination_location_id INTEGER NOT NULL,

    quantity NUMERIC(12,2) NOT NULL,

    participation NUMERIC(5,2) NOT NULL,

    reference_date DATE NOT NULL,

    source_id INTEGER NOT NULL,
    
    CONSTRAINT pk_flow
        PRIMARY KEY (flow_id),

    CONSTRAINT fk_product_id
        FOREIGN KEY (product_id)
        REFERENCES dim_product(product_id),

    CONSTRAINT fk_origin_location_id
        FOREIGN KEY (origin_location_id)
        REFERENCES dim_location(location_id),
    
    CONSTRAINT fk_destination_location_id
        FOREIGN KEY (destination_location_id)
        REFERENCES dim_location(location_id),

    CONSTRAINT fk_source_id
        FOREIGN KEY (source_id)
        REFERENCES dim_source(source_id),

    CONSTRAINT ck_participation
        CHECK (participation >= 0),

    CONSTRAINT ck_quantity
        CHECK (quantity >= 0)
);

CREATE TABLE crop_stage (
    crop_stage_id INTEGER GENERATED ALWAYS AS IDENTITY,

    product_id INTEGER NOT NULL,

    location_id INTEGER NOT NULL,

    name_stage VARCHAR(10) NOT NULL,

    order_stage INTEGER NOT NULL,

    init_date DATE NOT NULL,

    end_date DATE NOT NULL,

    description_stage VARCHAR(200),

    is_sensible BOOLEAN NOT NULL,

    source_id INTEGER NOT NULL,

    CONSTRAINT pk_crop_stage
        PRIMARY KEY (crop_stage_id),

    CONSTRAINT fk_product_id
        FOREIGN KEY (product_id)
        REFERENCES dim_product(product_id),

    CONSTRAINT fk_location_id
        FOREIGN KEY (location_id)
        REFERENCES dim_location(location_id),

    CONSTRAINT fk_source_id
        FOREIGN KEY (source_id)
        REFERENCES dim_source(source_id)
);





