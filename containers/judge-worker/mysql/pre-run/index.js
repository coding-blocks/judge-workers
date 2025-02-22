const mysql = require('mysql2/promise');

const TESTCASE = process.argv[2];
const SOURCE = process.argv[3];

const init = async () => {
  let connection;
  try {
    connection = await mysql.createConnection({
      host: process.env.DB_HOST,
      user: process.env.DB_USER,
      database: process.env.DB_NAME,
      password: process.env.DB_PASSWORD,
      multipleStatements: true,
    })
    
    await connection.query(TESTCASE);
    const [result] = await connection.query(SOURCE);
    console.log(JSON.stringify(result));
    
  } catch(err) {
    console.error(err.sqlMessage ? err.sqlMessage: 'Something went wrong.')
  }
  if (connection) {
    connection.destroy();
  }
}

init();