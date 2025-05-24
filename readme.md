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


# Requirement
- Remix
- Metamask wallet
- lite-server

# Setup
- Open remix web from chrome browser. Open the main.sol file in remix web. Compile the main.sol file. After compiling, select <Injected Provider - MetaMask> from the environment. Connect your metamask wallet. After that Deploy your contract, copy the contract address and ABI data in your html code.
- once the setup is done open terminal from the parent directory and enter lite-server to run the lite webserver.

# Working process
- From the homepage, click on submit button to submit the env data. Allow the wallet access via metamask.
- on successfull submission of data. Data can be viewed only after auditor validates the data.
- To validate the submission, click on validate action button from submitdata page, or go back to homepage and login in to auditor validation button at the top right corner of homepage. Either option leads you to auditor login page. For the project the login details are open.. you can enter any login details or keep it blank also.., and enter login to get access to the validation page.
- upon entering the validation page, enter submission id(starts from 1 on your first submission of data and its incremental of second third forth, etc...) and click on load submission. This button will load the submission matched to the id to validate. If the data is already validated, the message will be shown that it is validated already.
- Click on validate button and allow from metamask wallet to validate the submission. 
- Finally to view submission and check score, go to view score and submissions button. From this page you can enter the submission id to view the submitted data and for the score you can enter the wallet address.

