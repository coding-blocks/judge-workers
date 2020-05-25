process.env.NODE_ENV = 'test';

const chai = require('chai');
const chaiHttp = require('chai-http');
const server = require('../src/index.js');
const should = chai.should();

chai.use(chaiHttp);

describe('users', () => {
  it('should get all Users', () => {
    chai.request(server)
      .get('/users')
      .end((err, res) => {
        res.should.have.status(200);
        res.body.should.be.a('array');
        res.body.length.should.be.eql(1);
      });
  })
})

