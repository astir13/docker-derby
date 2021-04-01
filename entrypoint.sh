#!/bin/bash
if [[ -f /keys/ServerKeyStore && -f /keys/ServerTrustStore ]]; then /startsecure.sh; else /startunsecure.sh; fi
