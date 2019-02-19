CREATE TABLE IF NOT EXISTS oauth_client_details(
  client_id VARCHAR(256) PRIMARY KEY,
  resource_ids VARCHAR(256),
  client_secret VARCHAR(256),
  scope VARCHAR(256),
  authorized_grant_types VARCHAR(256),
  web_server_redirect_uri VARCHAR(256),
  authorities VARCHAR(256),
  access_token_validity INTEGER DEFAULT 36000,
  refresh_token_validity INTEGER DEFAULT 36000,
  additional_information VARCHAR(4096),
  autoapprove BIT(1)
);

CREATE TABLE IF NOT EXISTS oauth_client_token(
  token_id VARCHAR(256),
  token BLOB,
  authentication_id VARCHAR(256),
  user_name VARCHAR(256),
  client_id VARCHAR(256)
);

CREATE TABLE IF NOT EXISTS oauth_access_token(
  token_id VARCHAR(256),
  token BLOB,
  authentication_id VARCHAR(256),
  user_name VARCHAR(256),
  client_id VARCHAR(256),
  authentication BLOB,
  refresh_token VARCHAR(256)
);

CREATE TABLE IF NOT EXISTS oauth_refresh_token(
  token_id VARCHAR(256),
  token BLOB,
  authentication BLOB
);

CREATE TABLE IF NOT EXISTS oauth_code(
  code VARCHAR(256),
  authentication BLOB
);

CREATE TABLE IF NOT EXISTS oauth_approvals(
  userId VARCHAR(256),
  clientId VARCHAR(256),
  scope VARCHAR(256),
  status VARCHAR(10),
  expiresAt TIMESTAMP,
  lastModifiedAt TIMESTAMP
);

CREATE TABLE IF NOT EXISTS users(
  id INTEGER NOT NULL AUTO_INCREMENT,
  username VARCHAR(256) NOT NULL,
  password VARCHAR(256) NOT NULL,
  account_non_expired BIT(1) NOT NULL DEFAULT 1,
  account_non_locked BIT(1) NOT NULL DEFAULT 1,
  credentials_non_expired BIT(1) NOT NULL DEFAULT 1,
  enabled BIT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY(id),
  UNIQUE INDEX ux_username(username)
);

CREATE TABLE IF NOT EXISTS authorities(
  id INTEGER NOT NULL AUTO_INCREMENT,
  authority VARCHAR(256) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX ux_authority(authority)
);

CREATE TABLE IF NOT EXISTS users_authorities(
  user_id INTEGER NOT NULL,
  authorities_id INTEGER NOT NULL,
  PRIMARY KEY (user_id, authorities_id)
);

-- Clients
-- Passwords:
---- my-trusted-client: 1234
INSERT INTO oauth_client_details(client_id,
                                 client_secret,
                                 scope,
                                 authorized_grant_types,
                                 web_server_redirect_uri,
                                 authorities,
                                 autoapprove)
VALUES ("my-trusted-client",
        "$2a$10$m7BHcqyuOPyt8oVSrtY.xubF7xo5C1d7CDYABQSOZsrrICAWrWaYa",
        "root,server",
        "client_credentials,password,authorization_code,implicit",
        "http://localhost:8080/",
        "ROLE_TRUSTED_CLIENT",
        true);

-- Users
-- Passwords:
---- admin: admin
INSERT INTO users(username, password)
VALUES ("admin", "$2a$10$TGZK16ooMNWm/JXXii1HHui5nbsGZPSvhpqyi8s09DoqBGyZehGhG");

INSERT INTO authorities(authority)
VALUES("ROLE_ADMIN");

INSERT INTO users_authorities(user_id, authorities_id)
VALUES (1, 1);