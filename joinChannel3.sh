
# Join peer0.org1.example.com to the channel.
docker exec -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/jabar.evote.com/users/Admin@jabar.evote.com/msp" peer0.jabar.evote.com peer channel fetch config -o orderer.evote.com:7050 -c composerchannel
docker exec -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/jabar.evote.com/users/Admin@jabar.evote.com/msp" peer0.jabar.evote.com peer channel join -b composerchannel_config.block

# Join peer1.org1.example.com to the channel.
docker exec -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/jabar.evote.com/users/Admin@jabar.evote.com/msp" peer1.jabar.evote.com peer channel fetch config -o orderer.evote.com:7050 -c composerchannel
docker exec -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/jabar.evote.com/users/Admin@jabar.evote.com/msp" peer1.jabar.evote.com peer channel join -b composerchannel_config.block
