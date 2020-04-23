const express = require('express')

const app = express()

app.get('/users', (req, res) => {
  const users = [
    {
      id: 1,
      name: 'Jatin Katyal'
    }
  ]
  res.json(users)
})

app.listen(3000, () => console.log('App running'))

module.exports = app

