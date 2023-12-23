const { addSpecHandler  } = require('pactum').handler;

addSpecHandler('login', ({spec}) => {
  spec.post('/login');
  spec.withJson({
    "email": "$M{ENV.RS_EMAIL}",
    "password": "$M{ENV.RS_PASSWORD}"
  });
  spec.expectStatus(200);
  spec.stores('ID_TOKEN', 'idToken');
});

addSpecHandler('get-user', ({spec}) => {
  spec.get('/getUser');
  spec.withBearerToken('$S{ID_TOKEN}');
  spec.expectStatus(200);
  spec.stores('WORKSPACE_ID', 'workspaces[0].id');
});

addSpecHandler('create-source', ({spec}) => {
  spec.post('/workspaces/$S{WORKSPACE_ID}/sources');
  spec.withBearerToken('$S{ID_TOKEN}');
  spec.withJson({
    "name": "test",
    "sourceDefinitionId": "$S{SOURCE_DEFINITIONS[name=Javascript].id}",
    "accountId": null,
    "config": {}
  });
  spec.expectStatus(200);
  spec.stores('SOURCE_ID', 'id');
  spec.stores('SOURCE_WRITE_KEY', 'writeKey');
});

addSpecHandler('get-sources', ({spec}) => {
  spec.get('/workspaces/$S{WORKSPACE_ID}/sources');
  spec.withBearerToken('$S{ID_TOKEN}');
  spec.expectStatus(200);
});

addSpecHandler('delete-source', ({spec}) => {
  spec.delete('/workspaces/$S{WORKSPACE_ID}/sources/$S{SOURCE_ID}');
  spec.withBearerToken('$S{ID_TOKEN}');
  spec.expectStatus(200);
});

addSpecHandler('get-source-definitions', ({spec}) => {
  spec.get('/web/source-definitions');
  spec.withBearerToken('$S{ID_TOKEN}');
  spec.expectStatus(200);
  spec.stores('SOURCE_DEFINITIONS', '.');
});

addSpecHandler('get-destination-definitions', ({spec}) => {
  spec.get('/web/destination-definitions');
  spec.withBearerToken('$S{ID_TOKEN}');
  spec.expectStatus(200);
  spec.stores('DESTINATION_DEFINITIONS', '.');
});