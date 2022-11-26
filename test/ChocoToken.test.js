const { expect } = require("chai");
const { ethers, upgrades } = require("hardhat");

const initialSupply = 1000000;
const tokenName = "ChocoToken";
const tokenSymbol = "CHOT";

describe("ChocoToken tests", function() {
  let ChocoTokenV1;
  let ChocoTokenV2;
  let deployer;
  let userAccount;

  describe("V1 tests", function () {
    before(async function() {
      const availableSigners = await ethers.getSigners();
      deployer = availableSigners[0];

      // const ChocoToken = await ethers.getContractFactory("ChocoTokenV1");
      const ChocoToken = await ethers.getContractFactory("ChocoToken");

      // this.ChocoTokenV1 = await ChocoToken.deploy(initialSupply);
      ChocoTokenV1 = await upgrades.deployProxy(ChocoToken, [initialSupply], { kind: "uups" });
      await ChocoTokenV1.deployed();
    });

    it('Should be named ChocoToken', async function() {
      const fetchedTokenName = await ChocoTokenV1.name();
      expect(fetchedTokenName).to.be.equal(tokenName);
    });

    it('Should have symbol "CHOT"', async function() {
      const fetchedTokenSymbol = await ChocoTokenV1.symbol();
      expect(fetchedTokenSymbol).to.be.equal(tokenSymbol);
    });

    it('Should have totalSupply passed in during deployment', async function() {
      const [ fetchedTotalSupply, decimals ] = await Promise.all([
        ChocoTokenV1.totalSupply(),
        ChocoTokenV1.decimals(),
      ]);
      const expectedTotalSupply = ethers.BigNumber.from(initialSupply).mul(ethers.BigNumber.from(10).pow(decimals));
      expect(fetchedTotalSupply.eq(expectedTotalSupply)).to.be.true;
    });

    it('Should run into an error when executing a function that does not exist', async function () {
      expect(() => ChocoTokenV1.mint123(deployer.address, ethers.BigNumber.from(10).pow(18))).to.throw();
    });
  });

  
  describe("V2 tests", function () {
    before(async function () {

      userAccount = (await ethers.getSigners())[1];

      // const ChocoTokenV2 = await ethers.getContractFactory("ChocoTokenV2");
      const ChocoTokenV2Contract = await ethers.getContractFactory("ChocoToken");
      ChocoTokenV2 = await upgrades.upgradeProxy(ChocoTokenV1.address, ChocoTokenV2Contract);
      await ChocoTokenV2.deployed();
    });

    it("Should has the same address, and keep the state as the previous version", async function () {
      const [totalSupplyForNewCongtractVersion, totalSupplyForPreviousVersion] = await Promise.all([
        ChocoTokenV2.totalSupply(),
        ChocoTokenV1.totalSupply(),
      ]);
      expect(ChocoTokenV1.address).to.be.equal(ChocoTokenV2.address);
      expect(totalSupplyForNewCongtractVersion.eq(totalSupplyForPreviousVersion)).to.be.equal(true);
    });

    it("Should revert when an account other than the owner is trying to mint tokens", async function() {
      const tmpContractRef = await ChocoTokenV2.connect(userAccount);
      try {
        await tmpContractRef.mint(userAccount.address, ethers.BigNumber.from(10).pow(ethers.BigNumber.from(18)));
      } catch (ex) {
        expect(ex.message).to.contain("reverted");
        expect(ex.message).to.contain("Ownable: caller is not the owner");
      }
    });

    it("Should mint tokens when the owner is executing the mint function", async function () {
      const amountToMint = ethers.BigNumber.from(10).pow(ethers.BigNumber.from(18)).mul(ethers.BigNumber.from(10));
      const accountAmountBeforeMint = await ChocoTokenV2.balanceOf(deployer.address);
      const totalSupplyBeforeMint = await ChocoTokenV2.totalSupply();
      await ChocoTokenV2.mint(deployer.address, amountToMint);

      const newAccountAmount = await ChocoTokenV2.balanceOf(deployer.address);
      const newTotalSupply = await ChocoTokenV2.totalSupply();
      
      expect(newAccountAmount.eq(accountAmountBeforeMint.add(amountToMint))).to.be.true;
      expect(newTotalSupply.eq(totalSupplyBeforeMint.add(amountToMint))).to.be.true;
    });
  });

});