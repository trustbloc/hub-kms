# Run via CLI

The `kms-rest` server can be built from within the `cmd/kms-rest` directory with `go build`.

## Run the server

Start the server with `./kms-rest start [flags]`.

## Parameters

Parameters can be set by command line arguments or environment variables:

```
    --host-url string                       The URL to run the KMS instance on. Format: HostName:Port.
    --base-url string                       An optional base URL value to prepend to a location returned in the Location header. Alternatively, this can be set with the following environment variable: KMS_BASE_URL

-l, --log-level string                      Logging level to set. Supported options: critical, error, warning, info, debug. Defaults to "info". Alternatively, this can be set with the following environment variable: KMS_LOG_LEVEL

-c, --tls-cacerts stringArray               Comma-separated list of CA certs path. Alternatively, this can be set with the following environment variable: KMS_TLS_CACERTS
-s, --tls-systemcertpool string             Use system certificate pool. Possible values [true] [false]. Defaults to false if not set. Alternatively, this can be set with the following environment variable: KMS_TLS_SYSTEMCERTPOOL

    --tls-serve-cert string                 The path to the server certificate to use when serving HTTPS. Alternatively, this can be set with the following environment variable: KMS_TLS_SERVE_CERT
    --tls-serve-key string                  The path to the private key to use when serving HTTPS. Alternatively, this can be set with the following environment variable: KMS_TLS_SERVE_KEY

    --secret-lock-key-path string           The path to the file with key to be used by local secret lock. If missing noop service lock is used. Alternatively, this can be set with the following environment variable: KMS_SECRET_LOCK_KEY_PATH

    --database-type string                  The type of database to use for storing metadata about keystores and associated keys. Supported options: mem, couchdb. Alternatively, this can be set with the following environment variable: KMS_DATABASE_TYPE
    --database-url string                   The URL of the database. Not needed if using in-memory storage. For CouchDB, include the username:password@ text if required. Alternatively, this can be set with the following environment variable: KMS_DATABASE_URL
    --database-prefix string                An optional prefix to be used when creating and retrieving the underlying database. Alternatively, this can be set with the following environment variable: KMS_DATABASE_PREFIX

    --primary-key-database-type string      The type of database to use for storing primary keys. Supported options: mem, couchdb. Alternatively, this can be set with the following environment variable: KMS_PRIMARY_KEY_DATABASE_TYPE
    --primary-key-database-url string       The URL of the database for primary keys. Not needed if using in-memory storage. For CouchDB, include the username:password@ text if required. Alternatively, this can be set with the following environment variable: KMS_PRIMARY_KEY_DATABASE_URL
    --primary-key-database-prefix string    An optional prefix to be used when creating and retrieving the underlying database for primary keys. Alternatively, this can be set with the following environment variable: KMS_PRIMARY_KEY_DATABASE_PREFIX

    --local-kms-database-type string        The type of database to use for storing local KMS secrets (e.g. keys for Keystore). Supported options: mem, couchdb. Alternatively, this can be set with the following environment variable: KMS_LOCAL_KMS_DATABASE_TYPE
    --local-kms-database-url string         The URL of the database for local KMS. Not needed if using in-memory storage. For CouchDB, include the username:password@ text if required. Alternatively, this can be set with the following environment variable: KMS_LOCAL_KMS_DATABASE_URL
    --local-kms-database-prefix string      An optional prefix to be used when creating and retrieving the underlying local KMS database. Alternatively, this can be set with the following environment variable: KMS_LOCAL_KMS_DATABASE_PREFIX

    --key-manager-storage-type string       The type of storage to use for key manager. Supported options: mem, couchdb, edv. Alternatively, this can be set with the following environment variable: KMS_KEY_MANAGER_STORAGE_TYPE
    --key-manager-storage-url string        The URL of storage for key manager. Not needed if using in-memory storage. For CouchDB, include the username:password@ text if required. Alternatively, this can be set with the following environment variable: KMS_KEY_MANAGER_STORAGE_URL
    --key-manager-storage-prefix string     An optional prefix to be used when creating and retrieving the underlying key manager storage. Alternatively, this can be set with the following environment variable: KMS_KEY_MANAGER_STORAGE_PREFIX

    --cache-expiration string               An optional value for cache expiration. If not set caching is disabled. Supports valid duration strings, e.g. 10m, 60s, etc. Alternatively, this can be set with the following environment variable: KMS_CACHE_EXPIRATION

    --hub-auth-url string                   The URL of Hub Auth server to use for fetching secret share for secret lock. If not specified secret lock based on primary key is used. Alternatively, this can be set with the following environment variable: KMS_HUB_AUTH_URL
    --hub-auth-api-token string             A static token used to protect the GET /secrets API in Hub Auth. Alternatively, this can be set with the following environment variable: KMS_HUB_AUTH_API_TOKEN

    --enable-cors string                    Enables CORS. Possible values [true] [false]. Defaults to false if not set. Alternatively, this can be set with the following environment variable: KMS_CORS_ENABLE
    --enable-zcaps string                   Enables ZCAPs authz on all endpoints (except createKeyStore). Default is false. Alternatively, this can be set with the following environment variable: KMS_ZCAP_ENABLE
```

## Example

```sh
$ cd cmd/kms-rest
$ go build
$ ./kms-rest start --host-url localhost:8076 --database-type couchdb --database-url admin:password@couchdb.example.com:5984 --database-prefix keystore \
--primary-key-database-type couchdb --primary-key-database-url admin:password@couchdb.example.com:5984 --primary-key-database-prefix kms_pk \
--local-kms-database-type couchdb --local-kms-database-url admin:password@couchdb.example.com:5984 --local-kms-database-prefix kms \
--key-manager-storage-type couchdb --key-manager-storage-url admin:password@couchdb.example.com:5984 --key-manager-storage-prefix kms_km
```
