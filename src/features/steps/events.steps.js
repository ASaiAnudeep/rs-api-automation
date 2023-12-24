const { spec, parse } = require('pactum');
const { Given, Then } = require('@cucumber/cucumber');

Given(/^I record total sent events as (.*)$/, async function (name) {
  await spec()
    .get('/workspaces/$S{WORKSPACE_ID}/sources/$S{SOURCE_ID}/eventMetrics')
    .withBearerToken('$S{ID_TOKEN}')
    .withQueryParams('start', '$F{GetStartOfDay}')
    .withQueryParams('end', '$F{GetEndOfDay}')
    .stores(name, 'totalSent');
});

Given(/^I record total delivered events as (.*)$/, async function (name) {
  await spec()
    .get('/workspaces/$S{WORKSPACE_ID}/destinations/$S{DESTINATION_ID}/eventMetrics')
    .withBearerToken('$S{ID_TOKEN}')
    .withQueryParams('start', '$F{GetStartOfDay}')
    .withQueryParams('end', '$F{GetEndOfDay}')
    .stores(name, 'totalDelivered');
});

Then('total sent events should be increased by {int}', (expected) => {
  const old_sent_events = parse('$S{INIT_SENT_EVENTS}');
  const new_sent_events = parse('$S{NEW_SENT_EVENTS}');
  const actual = new_sent_events - old_sent_events;
  if (actual !== expected) {
    throw "total sent events should be increased by " + expected + " but was " + actual;
  }
});

Then('total delivered events should be increased by {int}', (expected) => {
  const old_delivered_events = parse('$S{INIT_DELIVERED_EVENTS}');
  const new_delivered_events = parse('$S{NEW_DELIVERED_EVENTS}');
  const actual = new_delivered_events - old_delivered_events;
  if (actual !== expected) {
    throw "total delivered events should be increased by " + expected + " but was " + actual;
  }
});