const { Then } = require('@cucumber/cucumber');
const pactum = require('pactum');
const base = require('./base.steps');

Then(/^I expect response to match a json snapshot (.*)$/, async function (name) {
  base.spec.response().should.have.jsonSnapshot(name);
});

Then('I expect response should have a status {int}', function (code) {
  base.spec.response().should.have.status(code);
});

Then(/^I expect response header (.*) should be (.*)$/, function (key, value) {
  base.spec.response().should.have.header(key, value);
});

Then(/^I expect response header (.*) should have (.*)$/, function (key, value) {
  base.spec.response().should.have.headerContains(key, value)
});

Then(/^I expect response cookie (.*) should be (.*)$/, function (key, value) {
  base.spec.response().should.have.cookies(key, value);
});

Then(/^I expect response should have a json$/, function (json) {
  base.spec.response().should.have.json(JSON.parse(json));
});

Then(/^I expect response should have a json at (.*)$/, function (path, value) {
  console.log(path, value)
  base.spec.response().should.have.json(path, JSON.parse(value));
});

Then(/^I expect response should have a json like$/, function (json) {
  base.spec.response().should.have.jsonLike(JSON.parse(json));
});

Then(/^I expect response should have a json like at (.*)$/, function (path, value) {
  base.spec.response().should.have.jsonLike(path, JSON.parse(value));
});

Then(/^I expect response should have a json schema$/, function (json) {
  base.spec.response().should.have.jsonSchema(JSON.parse(json));
});

Then(/^I expect response should have a json schema at (.*)$/, function (path, value) {
  base.spec.response().should.have.jsonSchema(path, JSON.parse(value));
});

Then(/^I expect response should have a body$/, function (body) {
  base.spec.response().should.have.body(body);
});

Then(/^I expect response body should contain (.*)$/, function (value) {
  base.spec.response().should.have.bodyContains(value);
});

Then('I expect response should have {string}', function (handler) {
  base.spec.response().should.have._(handler);
});

Then('I expect response time should be less than {int} ms', function (ms) {
  base.spec.response().should.have.responseTimeLessThan(ms)
});

Then(/^I store response at (.*) as (.*)$/, function (path, name) {
  base.spec.stores(name, path);
});

Then('I wait for {int} ms', function (ms) {
  pactum.sleep(ms);
});