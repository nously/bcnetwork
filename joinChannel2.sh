# Create the channel
docker exec -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/jatim.evote.com/users/Admin@jatim.evote.com/msp"  peer0.jatim.evote.com peer channel create -o orderer.evote.com:7050 -c composerchannel -f /var/hyperledger/channel-artifacts/channel.tx

# Join peer0.org1.example.com to the channel.
docker exec -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/jatim.evote.com/users/Admin@jatim.evote.com/msp" peer0.jatim.evote.com peer channel join -b composerchannel.block

# Join peer1.org1.example.com to the channel.
docker exec -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/jatim.evote.com/users/Admin@jatim.evote.com/msp" peer1.jatim.evote.com peer channel fetch config -o orderer.evote.com:7050 -c composerchannel
docker exec -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/jatim.evote.com/users/Admin@jatim.evote.com/msp" peer1.jatim.evote.com peer channel join -b composerchannel_config.block
