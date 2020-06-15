const express = require('express')

const app = express()

app.get('/users', (req, res) => {
  // TODO: 
  res.json([{ name: 'jatin' }])
})

app.listen(3000, () => console.log('App running'))

module.exports = app

