import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import * as dotenv from "dotenv";


dotenv.config();

const SEPOLIA_RPC_URL = process.env.INFURA_PROJECT_ID || "";
const PRIVATE_KEY = process.env.PRIVATE_KEY || "";
const ETHERSCAN_API_KEY = process.env.ETHERSCAN_API_KEY || "";

if (!SEPOLIA_RPC_URL || !PRIVATE_KEY) {
  console.error("Please set SEPOLIA_RPC_URL and PRIVATE_KEY in your .env file");
  process.exit(1);
}

const config: HardhatUserConfig = {
  solidity: "0.8.28",
  networks: {
    hardhat: {},
    sepolia: {
      url: SEPOLIA_RPC_URL, // RPC URL for Sepolia
      accounts: [PRIVATE_KEY], // Private key for the deployment account
    },
  },
  
  etherscan: {
    apiKey: ETHERSCAN_API_KEY, // Optional: For verifying contracts on Etherscan
  },
};

export default config;