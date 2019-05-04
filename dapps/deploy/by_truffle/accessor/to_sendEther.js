// This script is for node.js.

(async function (){
  const accessor = require('./accessor_web3_server.js');

  const accessor_web3 = await accessor.GetWeb3();

  const accounts = await accessor_web3.eth.getAccounts();
  console.log("Address");
  console.log(" - accounts[0]: " + accounts[0]);
  console.log(" - accounts[1]: " + accounts[1]);

  let balance0 = 0;
  let balance1 = 0;
  balance0 = await accessor_web3.eth.getBalance(accounts[0]);
  balance1 = await accessor_web3.eth.getBalance(accounts[1]);
  console.log("Balance(before)");
  console.log(" - accounts[0]: " + balance0 + " Wei");
  console.log(" - accounts[1]: " + balance1 + " Wei");

  const amountEther = 12;
  const amountWei = amountEther * 10 ** 18;
  await accessor_web3.eth.sendTransaction({from:accounts[0],to:accounts[1],value:amountWei});
  console.log("Transfer");
  console.log("   " + amountWei + " Wei");
  console.log("   " + accounts[0] + " >>");
  console.log("   " + accounts[1]);

  balance0 = await accessor_web3.eth.getBalance(accounts[0]);
  balance1 = await accessor_web3.eth.getBalance(accounts[1]);
  console.log("Balance(after)");
  console.log(" - accounts[0]: " + balance0 + " Wei");
  console.log(" - accounts[1]: " + balance1 + " Wei");
})();

