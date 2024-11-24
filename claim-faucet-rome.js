const axios = require('axios');
const readline = require('readline');

const AIRDROP_URL = 'https://rometestus1.testnet.romeprotocol.xyz/request_airdrop';

// Setup readline for user input
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// Function to collect recipient details from the user
const getRecipients = async () => {
  return new Promise((resolve) => {
    rl.question('Paste recipient addresses and amounts in the format "address1:amount1,address2:amount2,...". If no amount is provided, the default is 100:\n', (input) => {
      const recipients = input.split(',').map((pair) => {
        const [recipientAddr, amount] = pair.split(':');
        // If no amount is provided, set it to 100
        return { recipientAddr: recipientAddr.trim(), amount: amount ? amount.trim() : '100' };
      });
      resolve(recipients);
    });
  });
};

// Function to send airdrop requests
const sendAirdrop = async (recipient) => {
  try {
    const response = await axios.post(AIRDROP_URL, recipient);
    console.log(`Success: ${response.data.success}, Transaction Hash: ${response.data.transactionHash}`);
  } catch (error) {
    console.error(`Error for recipient ${recipient.recipientAddr}:`, error.response ? error.response.data : error.message);
  }
};

// Function to distribute airdrops
const distributeAirdrop = async (recipients) => {
  for (const recipient of recipients) {
    await sendAirdrop(recipient);
  }
};

// Main function
const main = async () => {
  const recipients = await getRecipients();
  console.log('Starting airdrop...');
  await distributeAirdrop(recipients);
  console.log('Airdrop completed.');
  rl.close();
};

// Start the script
main();