// SPDX-License-Identifier: MIT
pragma solidity >0.6.6 <0.9.0;

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";
// no longer needed after solidity 0.8
// solidity automatically checks for overflow issues
import "@chainlink/contracts/src/v0.6/vendor/SafeMathChainlink.sol";

// should be able to accept payment
contract FundMe {
    // with this we can now call SafeMathChainlink lib functions on uint256 type within this contract
    using SafeMathChainlink for uint256;

    mapping(address => uint256) public addressToAmountFunded;
    address[] public funders;
    address public owner;

    // immediatelly executed once we deploy this contract
    constructor() public {
        owner = msg.sender;
    }

    function fund() public payable {
        // $50
        uint256 minimumUSD = 50 * 10 ** 18;
        // get minimum amount of value in USD
        // -> We need to know what the ETH -> USD conversion rate is
        // guard - stops execution & reverts if the condition is invalid
        require(getConversionRate(msg.value) >= minimumUSD, "You need to spend more ETH!");

        addressToAmountFunded[msg.sender] += msg.value;
        
        // let's ignore the fact that funders which fund multiple times are added multiple times in array
        funders.push(msg.sender);
    }

    function getVersion() public view returns(uint256) {
        // in order to find where this interface is located on some testnet (eg. kovan chain)
        // https://docs.chain.link/docs/ethereum-addresses/
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x9326BFA02ADD2366b30bacB125260Af641031331);

        return priceFeed.version();
    }

    function getPrice() public view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x9326BFA02ADD2366b30bacB125260Af641031331);
        (
            // values in tuples can be ignored, by eluding them and leaving their "spots" empty
            ,
            int256 answer,
            ,
            ,
        ) = priceFeed.latestRoundData();
        return uint256(answer * 10000000000); // return price in Wei
        // will return something like
        // uint256: 310691401104
        // the number is so big, because it*s multiplied by 10**8
        // so it doesn't have to deal with decimal places, because solidity can't store decimals
        // so the value of 1 eth per usd in this case is:
        // 3106.91401104$
    }

    function getConversionRate(uint256 ethAmount) public view returns(uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1000000000000000000;
        return ethAmountInUsd;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "you're not the owner");
         // wherever the _; statement is, this is where the rest of the code will be injected;
        _;
    }

    function withdraw() payable onlyOwner public {
        // msg.sender.transfer - transfer money to the sender
        // address(this) - the address of this contract
        // address(this).balance - total amount of money on specified address (in Wei)
        msg.sender.transfer(address(this).balance);

        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        // create a new empty array
        funders = new address[](0);
    }
}
