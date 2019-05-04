# This script is for Ubuntu Ver18.04.
#!/bin/sh

CONTRACT_NAME_LOWER=sendEther
PATH_DAPPS=~/dapps
PATH_EXPRESS=$PATH_DAPPS/web/by_express
cd $(dirname $0)
PATH_CURRENT=$PWD

echo "\n<Setup>"
echo "Set up the express project."
echo "\n"
cd $PATH_EXPRESS
sudo apt-get install node-express-generator -y
npm install express-generator --save
express $CONTRACT_NAME_LOWER
cd $PATH_EXPRESS/$CONTRACT_NAME_LOWER
npm install

echo "\n<Setup>"
echo "Copy the files."
echo "\n"
mkdir -p $PATH_DAPPS
cp -rf $PATH_CURRENT/dapps/* $PATH_DAPPS/

echo "\nDone?"
echo "Run Ganache."
echo ""
echo "[Enter] to continue."
echo "\n"
read Wait;

echo "\n<Setup>"
echo "Run truffle console to access to Ganache."
echo ""
echo "[Enter] to continue."
echo "\n"
read Wait;
cd ~/dapps/deploy/by_truffle
truffle console --network ganache

echo "\n<Help>"
echo "<Ubuntu commands>"
echo "cd ~/dapps/deploy/by_truffle"
echo "truffle console --network ganache"
echo "truffle console --network loom"
echo ""
echo "cd ~/dapps/loomNetwork"
echo "./loom run"
echo "lsof -i"
echo "ps -aux | grep xxxx"
echo "kill yyyy"
echo ""
echo "cd ~/dapps/web/by_express/$CONTRACT_NAME_LOWER"
echo "node ./bin/www"
echo "http://127.0.0.1:3000"
echo ""
echo "\n"


