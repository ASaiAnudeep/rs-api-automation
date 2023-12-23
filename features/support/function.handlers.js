const dayjs = require('dayjs')

const { addDataFuncHandler  } = require('pactum').handler;

addDataFuncHandler('GetDate', (ctx) => {
  const value = parseInt(ctx.args[0]);
  const unit = ctx.args[1];
  return dayjs().add(value, unit).toISOString();
});