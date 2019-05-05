# [dapp_sendEther](https://github.com/zombietimes/dapp_sendEther)
This is a sample application of DApps.  

## Overview
[dapp_sendEther](https://github.com/zombietimes/dapp_sendEther) allows sending Ether(testnet) on the blockchain.  
It allows accessing to Ganache(Ethereum) and Loom Network.  
It allows accessing through Express server(application server).  
- [DApps : Medium](https://medium.com/swlh/understanding-dapps-decentralized-applications-8f3668ebdc9a)  
- [Ganache : Official](https://truffleframework.com/docs/ganache/overview)  
- [Loom Network SDK : Official](https://loomx.io/developers/)  
- [Express : Official](https://expressjs.com/)  

## Description
Let's run and analyze the sample DApps.  
You can understand deeply by editing the sample code.  
I think that it is worth learning the smart contract development.  
I focus on Ethereum and Loom Network as the DApps.  

### Sample DApps
I created some sample smart contracts below.  
I hope to be useful to you when you develop DApps.  
- [Hello world : HelloZombies.sol](https://github.com/zombietimes/dapp_helloWorld)
- [ERC20 : Coin20.sol](https://github.com/zombietimes/dapp_erc20)
- [ERC721 : Asset721.sol](https://github.com/zombietimes/dapp_erc721)
- [Multi contract : ImportZombies.sol](https://github.com/zombietimes/dapp_multiContract)
- [Sending Ether](https://github.com/zombietimes/dapp_sendEther) : Here!

### Setting up the development environment.
The script file [setup0000_all](https://github.com/zombietimes/setup0000_all) is useful to set up the development environment.  
It consists of the external script files below.  
- [setup0000_all](https://github.com/zombietimes/setup0000_all)  

### Environment
This script file is for Ubuntu(Linux).  
I recommend that you use VirtualBox + Ubuntu.  

## Usage
After setting up the development environment by [setup0000_all](https://github.com/zombietimes/setup0000_all),  
run `ubuntuCmd_setupDapp_sendEther.sh` on Ubuntu console window.  
You can access to the blockchain through Express server from the browser.  

### Compile and deploy to Ganache
At first, we have to compile and deploy the smart contract.  
The role of `ubuntuCmd_setupDapp_sendEther.sh` is below.  
- Copy the smart contract to Truffle project.
- Run Truffle console to Ganache(Ethereum private test network).
- Create Express project to run the smart contract through web server.
```sh
# Ubuntu commands.
git clone https://github.com/zombietimes/dapp_sendEther.git
cd dapp_sendEther
sh ./ubuntuCmd_setupDapp_sendEther.sh
```
![dapp_sendEther_0000](https://user-images.githubusercontent.com/50263232/57186743-d3d2fd00-6f1f-11e9-81e4-868e19b5d289.png)  
After running Ganache, press the Enter key.  
![dapp_sendEther_0001](https://user-images.githubusercontent.com/50263232/57186747-e0efec00-6f1f-11e9-993b-c6f3527a34d8.png)  

### Truffle console to Ganache
The next step is the operation on Truffle console.  
Confirm to send some Ether from account0 to account1.  
```sh
# Truffle commands.
web3.eth.getAccounts().then(ret=>accounts=ret)
addr0 = accounts[0]
addr1 = accounts[1]
web3.eth.getBalance(accounts[0]).then(ret=>balance=ret)
web3.eth.getBalance(accounts[1]).then(ret=>balance=ret)
amountEther = 12
amountWei = amountEther * 10 ** 18
web3.eth.sendTransaction({from:accounts[0],to:accounts[1],value:amountWei})
web3.eth.getBalance(accounts[0]).then(ret=>balance=ret)
web3.eth.getBalance(accounts[1]).then(ret=>balance=ret)
.exit
```
The balance of account0(0x655...) is 100 Ether.  
The balance of account1(0x576...) is 100 Ether.  
![dapp_sendEther_0002](https://user-images.githubusercontent.com/50263232/57186749-ecdbae00-6f1f-11e9-9bcc-1122f0f520c0.png)  
![dapp_sendEther_0003](https://user-images.githubusercontent.com/50263232/57186750-f8c77000-6f1f-11e9-8a0c-bf457a3ad27d.png)  
Sending 12 Ether from account0(0x655...) to account1(0x576...).  
![dapp_sendEther_0004](https://user-images.githubusercontent.com/50263232/57186754-0846b900-6f20-11e9-8db7-689334986867.png)  
The balance of account0(0x655...) is 88 Ether.  
The balance of account1(0x576...) is 112 Ether.  
![dapp_sendEther_0005](https://user-images.githubusercontent.com/50263232/57186757-14cb1180-6f20-11e9-9593-2186718a6f8b.png)  
![dapp_sendEther_0006](https://user-images.githubusercontent.com/50263232/57186760-1f85a680-6f20-11e9-9401-6f83b896f649.png)  

### Web server to Ganache
The next step is the operation on Ubuntu console.  
`to_sendEther.js` is the sample code written by node.js.  
You can send some Ether by using it.  
```sh
# Ubuntu commands.
cd ~/dapps/deploy/by_truffle/accessor
node ./to_sendEther.js
```
The balance of account0(0x655...) is 88 Ether.  
The balance of account1(0x576...) is 112 Ether.  
Sending 12 Ether from account0(0x655...) to account1(0x576...).  
The balance of account0(0x655...) is 76 Ether.  
The balance of account1(0x576...) is 124 Ether.  
![dapp_sendEther_0007](https://user-images.githubusercontent.com/50263232/57186763-2c09ff00-6f20-11e9-936c-f6d3e6ba2ed7.png)  
![dapp_sendEther_0008](https://user-images.githubusercontent.com/50263232/57186767-35936700-6f20-11e9-9fd2-43d823a385dc.png)  

### Browser to Web server to Ganache
The final step is web browsing.  
You can send some Ether by accessing to the web server.  
See the console window in the developer tool of the browser.  
```sh
# Ubuntu commands.
cd ~/dapps/web/by_express/sendEther
node ./bin/www
```
```sh
# Browser.
http://127.0.0.1:3000
```
![dapp_sendEther_0009](https://user-images.githubusercontent.com/50263232/57186773-4217bf80-6f20-11e9-992d-946badef5c58.png)  
The balance of account0(0x655...) is 76 Ether.  
The balance of account1(0x576...) is 124 Ether.  
Sending 12 Ether from account0(0x655...) to account1(0x576...).  
The balance of account0(0x655...) is 64 Ether.  
The balance of account1(0x576...) is 136 Ether.  
![dapp_sendEther_0010](https://user-images.githubusercontent.com/50263232/57186776-4e038180-6f20-11e9-9183-72b810139373.png)  
![dapp_sendEther_0011](https://user-images.githubusercontent.com/50263232/57186778-5956ad00-6f20-11e9-9889-b5064d06bd0a.png)  

## Requirement
I confirmed that it works on Ubuntu Desktop 18.04 in VirtualBox.  
It works on the environment below.  
- On Ubuntu.
- Google Chrome.
- [setup0000_all](https://github.com/zombietimes/setup0000_all)

## Relative link
### Overview
- [Ethereum : Official](https://www.ethereum.org/)
- [Ethereum : Wikipedia](https://en.wikipedia.org/wiki/Ethereum)
- [Loom Network : Official](https://loomx.io/)
- [Loom Network : Binance wiki](https://info.binance.com/en/currencies/loom-network)

### Development
- [Online editor : EthFiddle](https://ethfiddle.com/)
- [Online editor : Remix](https://remix.ethereum.org/)

### Learning
- [Online learning : CryptoZombies](https://cryptozombies.io/)
- [Grammar : Solidity](https://solidity.readthedocs.io/)
- [Grammar : Best Practices](https://github.com/ConsenSys/smart-contract-best-practices)

### DApps
- [DApps : CryptoKitties](https://www.cryptokitties.co/)
- [DApps : Zombie Battle ground](https://loom.games/en/)

## Messages
Do you believe that the decentralized world is coming?  
When do you use [DApps](https://en.wikipedia.org/wiki/Decentralized_application)?  
Why?  

## License
BSD 3-Clause, see `LICENSE` file for details.  

