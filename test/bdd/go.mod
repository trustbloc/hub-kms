// Copyright SecureKey Technologies Inc. All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0

module github.com/trustbloc/kms/test/bdd

go 1.15

require (
	github.com/cucumber/godog v0.10.0
	github.com/fsouza/go-dockerclient v1.6.6
	github.com/hyperledger/aries-framework-go v0.1.6-0.20210304143139-eb97711ddc73
	github.com/hyperledger/aries-framework-go/component/storageutil v0.0.0-20210303162231-46716728d6eb
	github.com/hyperledger/aries-framework-go/spi v0.0.0-20210303162231-46716728d6eb
	github.com/igor-pavlenko/httpsignatures-go v0.0.21
	github.com/rs/xid v1.2.1
	github.com/teserakt-io/golang-ed25519 v0.0.0-20210104091850-3888c087a4c8
	github.com/trustbloc/edge-core v0.1.6-0.20210304151911-954ad69796fc
	github.com/trustbloc/edv v0.1.6-0.20210225165224-70f0c1c3d22f
	github.com/trustbloc/hub-auth v0.1.5 // indirect
	github.com/trustbloc/hub-auth/test/bdd v0.0.0-20210128225850-81aa7953085d
	github.com/trustbloc/kms v0.0.0-00010101000000-000000000000
)

replace (
	github.com/trustbloc/kms => ../..
	// https://github.com/ory/dockertest/issues/208#issuecomment-686820414
	golang.org/x/sys => golang.org/x/sys v0.0.0-20200826173525-f9321e4c35a6
)
