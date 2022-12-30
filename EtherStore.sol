//This contract acts as an Ethereum vault that allows depositors to withdraw only 1 ether per week.
pragma solidity 0.8.0;

contract etherStore {
    uint256 public withdrawalLimit = 1 ether;
    mapping(address => uint256) public lastWithdrawTime;
    mapping(address => uint256) public balances;
    

    function depositFunds() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdrawFunds(uint256 _weiToWithdraw) public{
        balances[msg.sender] >= msg.value;
        require(balances[msg.sender] >= _weiToWithdraw, "Your input value is bigger than your balance");
        //limit withdrawal
        require(_weiToWithdraw] <= withdrawalLimit,"Your input is bigger than 1 ether "
        // limit the time allowed to withdraw
        require(now >= lastWithdrawTime[msg.sender] + 1 weeks);
        balances[msg.sender] -= _weiToWithdraw;
        lastWithdrawTime[msg.sender] = now;

    }
}
