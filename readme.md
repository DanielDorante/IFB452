# File structure
IFB452
|
|_____CSS
|  |
|  |_____style.css
|
|_____pages
|  |
|  |_____auditorlogin.html
|  |
|  |_____senddata.html
|  |
|  |_____validatedata.html
|  |
|  |_____viewdata.html
|
|_____index.html
|
|_____main.sol
|
|_____readme.md


# Requirements
- Remix IDE; for Solidity development & deployment
- Metamask wallet; for Ethereum
- lite-server

# Setup

**Complie and deploy smart contract**

1. Open Remix IDE in browser such as Chrome.
2. Open the main.sol file in Remix IDE.
3. Compile the main.sol contract.
4. In the Delpy and run transactions tab, select Injected Provider as the environment to connect Remix with MetaMask.
5. Connect your MetaMask wallet when prompted.
6. Deploy the contract.
7. Copy the deployed contract's address and ABI, and paste it into the appropriate sections of your HTML files.
  
**Run the local web Server**

1. Open a terminal from the parent project directory
2. Run the command lite-server to run the lite webserver
3. This will start a local server and open the app in your default browser.
   
# Working process

**Submitting Environmental Data**
1. From the homepade (index.html), click the Submit button to submitte senvironmental data. MetaMask will prompt you to allow wallet access and confirm the transaction.
2. On successful submission, the data will be stored on the blockchain but will only be visible after the auditor validation.
   
**Auditor Validation**
1. To validate the submission, click the Validate Action button on the submit data page, or use the Auditor Validation button at the top right corner of the homepage. Both optons lead to the auditor login page.
2. For this project the login details are open. You can enter any login details or leave it blank and click Login to get access to the validation page.
3. On the validation page, enter the Submission ID which is starting from 1 for the first submission and gets incremented by 1 for each subsequent submission.
4. Click Load Submission to retrieve the submission details. This button will load the submission matched to the id to validate. If the submission is already validated, the message will be shown that it is validated already. Otherwise, click If the data is already validated, the message will be shown that it is validated already.alidate button and confirm the transaction via MetaMask to validate the submission.
   
**Viewing Submissions and Scores**
1. Navigate to the View Scores and Submissions page via the View Score and Submissions button.
2. On this page, you can enter the submission id to view the submitted data and to check the score, you can enter the wallet address. The page will display the relevant data and scores accordingly.

# Notes
- Make sure MetaMask is connected to the same network as your deployed contract
