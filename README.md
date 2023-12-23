# rs-api-automation

This framework provides a structured approach to test the RudderStack API using PactumJS for API interactions and CucumberJS for test case definition and execution.

## Getting Started

### Prerequisites:

- Node.js and npm (or yarn) installed
- Basic knowledge of JavaScript, CucumberJS, and PactumJS

### Installation:

- Clone this repository
- Install dependencies: npm install

### Configure RudderStack API Credentials:

- Create a .env file in the project root and add your RudderStack API credentials:

```env
RS_EMAIL="<email>"
RS_PASSWORD="<password>"
RS_DATA_PLANE_URL="<url>"
```

## Run Tests:

- Execute the test suite: `npm test`
