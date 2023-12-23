const { When } = require('@cucumber/cucumber');
const base = require('./base.steps');

When('I receive a response', async function () {
  await base.spec.toss();
});