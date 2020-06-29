process.env.NODE_ENV = 'test';

const chai = require('chai');
const chaiHttp = require('chai-http');
const server = require('../src/index.js');
const {expect} = chai

chai.use(chaiHttp);

describe('users', () => {
  it('should get all Users', async () => {
    const res = await chai
      .request(server)
      .get('/users')

    expect(res.status).to.be.equal(200)
    expect(res.body).to.be.a('array')
    expect(res.body.length).to.be.equal(1)
  })
})

