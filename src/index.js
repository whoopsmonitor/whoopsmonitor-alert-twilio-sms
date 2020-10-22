const accountSid = process.env.WM_TWILIO_ACCOUNT_SID
const authToken = process.env.WM_TWILIO_AUTH_TOKEN
const from = process.env.WM_TWILIO_FROM
const to = process.env.WM_TWILIO_TO
const SMS_LENGTH = process.env.SMS_LENGTH * 1 || 160

const WM_CHECK_NAME = process.env.WM_CHECK_NAME
const WM_CHECK_OUTPUT = process.env.WM_CHECK_OUTPUT
const WM_CHECK_EXIT_CODE = process.env.WM_CHECK_EXIT_CODE


let exitMsg = ''

switch (WM_CHECK_EXIT_CODE) {
  case 0:
    exitMsg = 'ok'
    break

  case 1:
    exitMsg = '!'
  break

  case 2:
  default:
    exitMsg = '!!!'
  break
}


let body = `[${exitMsg}][${WM_CHECK_NAME}] ${WM_CHECK_OUTPUT}`

// strip to 160 chars - default SMS length
body = body.substring(0, SMS_LENGTH)

try {
  const client = require('twilio')(accountSid, authToken, {
    lazyLoading: true
  })

  client.messages.create({
    body,
    to,
    from
  })
  .then((message) => {
    console.log('[ok] Message sent to Twilio.')
    console.log(message.sid)
    process.exit(0)
  }).catch(err => {
    console.error('[failed] It is not possible to send a message to Twilio.')
    console.error(err)
    process.exit(2)
  })

} catch (err) {
  console.error('[failed] It is not possible to send a message to Twilio.')
  console.error(err)
  process.exit(2)
}
