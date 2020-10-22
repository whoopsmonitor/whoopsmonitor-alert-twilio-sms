# whoopsmonitor-alert-twilio-sms
Alert that sends SMS via Twilio.

## Build
```sh
docker build -t whoopsmonitor-alert-twilio-sms .
```

## Run image
```bash
docker run --rm --env-file .env whoopsmonitor-alert-twilio-sms
```

## Environmental variables
 - `WM_TWILIO_ACCOUNT_SID` - Your Account SID from www.twilio.com/console
 - `WM_TWILIO_AUTH_TOKEN` - Your Auth Token from www.twilio.com/console
 - `WM_TWILIO_FROM` - Number you send the SMS from.
 - `WM_TWILIO_TO` - Number you send the SMS to.

### Example
Details of the check in Whoops Monitor configuration tab or for the `.env` file.

```yaml
WM_TWILIO_ACCOUNT_SID=sid
WM_TWILIO_AUTH_TOKEN=token
WM_TWILIO_FROM=+1111111111
WM_TWILIO_TO=+111111111111
```

## Alert specification
Please read further details in the [alert docs](https://github.com/whoopsmonitor/whoopsmonitor/blob/master/docs/custom-alert.md).
