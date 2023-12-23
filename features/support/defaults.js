require('dotenv').config();
require('./maps');
require('./spec.handlers');
require('./function.handlers');
const { request, settings, spec } = require('pactum');
const { BeforeAll } = require('@cucumber/cucumber');

BeforeAll(async () => {
  request.setBaseUrl('https://api.rudderstack.com');
  settings.setReporterAutoRun(false);
  await spec('login');
});