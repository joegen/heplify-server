-- name: create-hep_proto_100_logs
CREATE TABLE IF NOT EXISTS hep_proto_100_logs (
  id BIGSERIAL NOT NULL,
  sid varchar NOT NULL,
  create_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
  protocol_header jsonb NOT NULL,
  data_header jsonb NOT NULL,
  raw varchar NOT NULL
) PARTITION BY RANGE (create_date);

-- name: create-hep_proto_35_report
CREATE TABLE IF NOT EXISTS hep_proto_35_report (
  id BIGSERIAL NOT NULL,
  sid varchar NOT NULL,
  create_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
  protocol_header jsonb NOT NULL,
  data_header jsonb NOT NULL,
  raw varchar NOT NULL
) PARTITION BY RANGE (create_date);

-- name: create-hep_proto_5_rtcp
CREATE TABLE IF NOT EXISTS hep_proto_5_rtcp (
  id BIGSERIAL NOT NULL,
  sid varchar NOT NULL,
  create_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
  protocol_header jsonb NOT NULL,
  data_header jsonb NOT NULL,
  raw varchar NOT NULL
) PARTITION BY RANGE (create_date);

-- name: create-hep_proto_1_call
CREATE TABLE IF NOT EXISTS hep_proto_1_call (
  id BIGSERIAL NOT NULL,
  sid varchar NOT NULL,
  create_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
  protocol_header jsonb NOT NULL,
  data_header jsonb NOT NULL,
  raw varchar NOT NULL
) PARTITION BY RANGE (create_date);

-- name: create-hep_proto_1_register
CREATE TABLE IF NOT EXISTS hep_proto_1_register (
  id BIGSERIAL NOT NULL,
  sid varchar NOT NULL,
  create_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
  protocol_header jsonb NOT NULL,
  data_header jsonb NOT NULL,
  raw varchar NOT NULL
) PARTITION BY RANGE (create_date);

-- name: create-hep_proto_1_default
CREATE TABLE IF NOT EXISTS hep_proto_1_default (
  id BIGSERIAL NOT NULL,
  sid varchar NOT NULL,
  create_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
  protocol_header jsonb NOT NULL,
  data_header jsonb NOT NULL,
  raw varchar NOT NULL
) PARTITION BY RANGE (create_date);
