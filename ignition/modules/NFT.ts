import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";



const NFTModule = buildModule("NFTModule", (m) => {
  

  const nft = m.contract("NFT", ["OSENI", "SEN"]);

  return { nft};
});

export default NFTModule;