if process.env.MASONS_ENV == 'TEST'
  conf =
    db:
      dbName: 'masons_test'
      login: 'masons'
      password: 'masons'
      host: "#{process.env.MYSQL_HOST}"
else
  conf =
    db:
      dbName: 'masons'
      login: 'masons'
      password: 'masons'
      host: "#{process.env.MYSQL_HOST}"

module.exports = (section) ->
    return conf[section]