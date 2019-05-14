## Initial setup
This setup was only necessary in the first time we built the network. This setup includes how to create MSP and other configurations in permissioned blockchain.

**A. MSP**
1. `$ cd composer`
2. `$ cryptogen generate --config=./crypto-config.yaml`

> Hyperledger Fabric provides binary executable file to create MSP easily. Its name is **cryptogen**. It consumes a *.yaml file as a reference to create needed MSP, for instances, what organizations are there in the network, and how many peers are in an organization.
The configuration is in **composer/crypto-config.yaml**.

**B.  Genesis block and configuration**
1. ` $ cd composer`
2. ` $ configtxgen -profile TwoOrgsOrdererGenesis -channelID system-orderer-channel -outputBlock ./channel-artifacts/genesis.block`
3. ` $ configtxgen -profile TwoOrgsChannel -outputCreateChannelTx ./channel-artifacts/channel.tx -channelId composerchannel`

> Hyperledger Fabric provides binary executable file to  create genesis block and channel configuration. Its name is **configtxgen**. It consumes a *.yaml file as a reference to create needed configuration.
The configuration is in **composer/configtx.yaml**.

## 'Which' does 'what'
1. **startFabric.sh**, **startFabric2.sh**, and **startFabric3.sh** create necessary docker containers in each machine. They create orderer, Jatim, and Jabar organization respectively.
2. **joinChannel2.sh**, and **joinChannel3.sh** join Jatim and Jabar to *composerchannel* respectively. In **joinChannel2.sh** there is also command to create channel.
3. **deployingScriptJatim.sh** installs and starts smart contract. It also creates admin cards (alice@evote-network.card (Jatim) and bob@evote-network.card (Jabar)).

## How to setup the network
1.  `$ ./startFabric.sh` *In machine provided to be used as Orderer organization*
2. `$ ./startFabric2.sh`*In machine provided to be used as Jatim organization*
3. `$ ./startFabric3.sh`*In machine provided to be used as Jabar organization*
4. `$ ./joinChannel2.sh`*In machine provided to be used as Jatim organization*
5. `$ ./joinChannel3.sh`*In machine provided to be used as Jabar organization*
6. `$ cd composer`*In machine provided to be used as Jatim organization*
7. `$ ./deployingScriptJatim.sh 0.1.0`*In machine provided to be used as Jatim organization*


## Next step
Run application in Pemilu_Network repository