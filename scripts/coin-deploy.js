const hre = require("hardhat");
const hreHelper = async () => {
    const [deployer] = await hre.ethers.getSigners();
    console.log("deploying contract: ", 'coinflip.sol', " w/ account: ", deployer.address)

    const contractFactory = await hre.ethers.getContractFactory('CoinFlip');       //compile the code
    const contract = await contractFactory.deploy();                            //initial deployment
    await contract.deployed();                                                        //confirm/wait until it has finished deployment

    console.log("my contract's address: ", contract.address);
};
const main = async () => {
    try {
        await hreHelper();
        process.exit(0);
    } catch (e) {
        console.log(e);
        process.exit(1);
    }
};
main();