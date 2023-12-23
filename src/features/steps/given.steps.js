const { Given } = require('@cucumber/cucumber');
const pactum = require('pactum');
const base = require('./base.steps');

Given(/^I make a (.*) request to (.*)$/, function (method, endpoint) {
  base.spec = pactum.spec();
  base.spec[method.toLowerCase()](endpoint);
});

Given(/^I set path param (.*) to (.*)$/, function (key, value) {
  base.spec.withPathParams(key, value);
});

Given(/^I set query param (.*) to (.*)$/, function (key, value) {
  base.spec.withQueryParams(key, value);
});

Given(/^I set basic authentication credentials (.*) and (.*)$/, function (username, password) {
  base.spec.withAuth(username, password);
});

Given(/^I set header (.*) to (.*)$/, function (key, value) {
  base.spec.withHeaders(key, value);
});

Given(/^I set bearer token to (.*)$/, function (value) {
  base.spec.withBearerToken(value);
});

Given(/^I set cookie (.*) to (.*)$/, function (key, value) {
  base.spec.withCookies(key, value);
});

Given(/I set body to/, function (body) {
  try {
    base.spec.withJson(JSON.parse(body));
  } catch(error) {
    base.spec.withBody(body);
  }
});

Given(/^I upload file at (.*)$/, function (filePath) {
  base.spec.withFile(filePath);
});

Given(/^I set multi-part form param (.*) to (.*)$/, function (key, value) {
  base.spec.withMultiPartFormData(key, value);
});

Given(/I set form-data to/, function (form) {
  base.spec.withForm(form);
});

Given(/I set inspection/, function () {
  base.spec.inspect();
});

Given(/^I set source write key (.*)$/, function (key) {
  base.spec.withAuth(key, "");
});