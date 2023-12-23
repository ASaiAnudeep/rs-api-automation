require('dotenv').config();
require('../../support');
const pactum = require('pactum');
const { request, settings } = require('pactum');
const { Before, After, BeforeAll } = require('@cucumber/cucumber');

let spec = pactum.spec();

BeforeAll(async () => {
  request.setBaseUrl('https://api.rudderstack.com');
  settings.setReporterAutoRun(false);
});

BeforeAll({ timeout: 10000 }, async () => {
  await pactum.spec('login');
  await pactum.spec('get-user');
});

BeforeAll({ timeout: 10000 }, async () => {
  await pactum.spec('get-source-definitions');
  await pactum.spec('get-destination-definitions');
});

Before(() => {
  spec = pactum.spec();
});

After(() => {
  spec.end();
});

module.exports = { spec }