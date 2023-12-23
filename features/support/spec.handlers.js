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

addSpecHandler('delete-source', ({spec}) => {
  spec.delete('/workspaces/2Zvg9W7WdKnj0M4OQCnQMTY6PA8/sources/$S{SOURCE_ID}');
  spec.withBearerToken('$S{ID_TOKEN}');
  spec.expectStatus(200);
})