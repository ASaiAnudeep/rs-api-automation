const pactum = require('pactum');
const { Given, Then } = require('@cucumber/cucumber');

Given(/^I create a source$/, async function () {
  await pactum.spec('create-source');
});

Then(/^I delete a source$/, async function () {
  await pactum.spec('delete-source');
});