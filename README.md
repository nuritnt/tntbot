# tntbot

## how should this bot work?

This is a Slack bot which is built a boilerplate from [slack-ruby-bot] (https://github.com/slack-ruby/slack-ruby-bot). The tasks of this bot is to listen to all conversations, and [react] if a link is posted by a user.
If a posted link is [new], it should be added to a [list]. If it has been [already posted], the bot should [notify] that this link was already mentioned.  

## getting started with a Bot
- [x] [create a new bot user in slack](https://github.com/slack-ruby/slack-ruby-bot/blob/master/TUTORIAL.md#create-a-bot-user)
- [x] create the folder structure
- [x] create first bot file

### Todo-List
- [x] active listener
- [x] regex for urls
- [x] rakefile: create/migrate/rollback/reset
- [x] find or initialize by method
- [x] database GUI
- [x] add rails
- [x] fix [message loop protection](https://github.com/slack-ruby/slack-ruby-bot#message-loop-protection)
- [ ] fix user_id
- [ ] fix channel_id


### BOT find or create by reactions
- [x] new = "you just posted a link!"
- [x] add to list
- [x] already posted
- [x] notify "you already posted that link"

### Database table
- [x] url_id
- [x] channel
- [x] user_id
- [x] posted date

## Extenstions:
- [ ] show entry options edit/update/delete - if yes, for who? every user?
- [ ] user = related to mail?username?user_id? - what if someone changes mailadress?
- [ ] [implement your own hooks](https://github.com/slack-ruby/slack-ruby-bot#hooks)
- [ ] possibility to archive all messages in free accounts
