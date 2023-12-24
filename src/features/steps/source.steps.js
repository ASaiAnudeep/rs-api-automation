const pactum = require('pactum');
const { Given, Then } = require('@cucumber/cucumber');

Given(/^I create a source$/, async function () {
  await pactum.spec('create-source');
});

Given(/^I have a source$/, async function () {
  await pactum.spec('get-sources')
    .stores('SOURCE_ID', 'sources[0].id')
    .stores('SOURCE_WRITE_KEY', 'sources[0].writeKey');
});

Given(/^I have a destination$/, async function () {
  await pactum.spec('get-destinations')
    .stores('DESTINATION_ID', 'destinations[0].id');
});

Then(/^I delete a source$/, async function () {
  await pactum.spec('delete-source');
});