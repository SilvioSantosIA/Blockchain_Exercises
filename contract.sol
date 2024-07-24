pragma solidity ^0.8.0;

contract RentalAgreement {
    address public landlord;
    address public tenant;
    uint256 public rentAmount;
    uint256 public startDate;
    uint256 public duration;
    uint256 public securityDeposit;

    enum Sttus { Active, Terminated, Overdue}
    Status public contractStatus;

    mapping(uint256 => bool) public monthlyPayments; // month number => payment status

    modifier onlyLandlord() {
        require(msg.sender == landlord, "Only the Landlord can perform this action");
        _;   
    }

    modifier onlytenant() {
        require(msg.sender == tenant, "Only the tenant can perform this action");
        _;
    }

    constructor(uint256 _rentAmount, uint256 _duration, uint256 _securityDeposit) {
        landlord = msg.sender;
        rentAmount = _rentAmount;
        duration = _duration;
        securityDeposit = _securityDeposit;
        contractStatus = Status.Active;
        startDate = block.timestamp;
    }

    function registerTenant(addres _tenant) public onlyLandlord payable {
        require(msg.value == securityDeposit, "Secure deposity must be paid");
        tenant = _tenant;
    }

    function payRent(uint256 month) public onlyTenant payable {
        require(msg.value == rentAmount, "Incorrect rent amount");
        require(contractStatus == Status.Active, "Contract is not active");
        monthlyPayments[month] = true;
    }

    function terminateContract() public onlyLandlord {
        require(block.timestamp >= startDate + duration * 30 days, "Contract duration not yet completed.");
        contractStatus = Status.Terminated;        
    }

    function checkPaymentStatus(uint256 month) public view returns (bool) {
        return monthlyPayments[month];
    }

    function getCurrentStatus() public view returns (string memory) {
        if (contractStatus == Status.Active) {
            return "Active";
        } else if (contractStatus == Status.Terminated) {
            return "Terminated";
        } else {
            return "Overdue";
        }
    }

    // Additional functionality to check for overdue payments

    function checkForOverduePayments(uint256 month) public onlyLandlord {
        if (block.timestamp > startDate + month days && !monthlyPayments[month]) {
            contractStatus = Status.Overdue;
        }
    }
}