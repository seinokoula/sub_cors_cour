//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "hardhat/console.sol";

/**
 * A simple smart contract for managing student certificates
 */
contract YourContract {
    // State Variables
    address public immutable owner;
    string public greeting = "Student Certificate Manager";
    uint256 public totalCounter = 0;
    mapping(address => uint) public userCertificateCount;

    // Certificate storage
    mapping(address => string) public certificateData;
    mapping(address => string) public certificateGrades;

    // Events
    event CertificateIssued(
        address indexed student,
        string data,
        string grade
    );

    constructor(address _owner) {
        owner = _owner;
    }

    /**
     * Function that allows setting a certificate for a student
     */
    function setGreeting(
        address studentAddress,
        string memory data,
        string memory grade
    ) public {
        require(studentAddress != address(0), "Invalid student address");
        
        // Store certificate data
        certificateData[studentAddress] = data;
        certificateGrades[studentAddress] = grade;
        
        // Update counters
        totalCounter += 1;
        userCertificateCount[studentAddress] += 1;

        // Emit the event
        emit CertificateIssued(
            studentAddress,
            data,
            grade
        );
    }

    /**
     * Function to get a student's certificate
     */
    function getCertificate(address studentAddress) 
        public 
        view 
        returns (
            string memory data,
            string memory grade,
            uint256 count
        ) 
    {
        return (
            certificateData[studentAddress],
            certificateGrades[studentAddress],
            userCertificateCount[studentAddress]
        );
    }
}
