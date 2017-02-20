# tntbot

## how should this bot work?

This is a Slack bot which is built a boilerplate from [slack-ruby-bot] (https://github.com/slack-ruby/slack-ruby-bot). The tasks of this bot is to listen to all conversations, and [react] if a link is posted by a user.
If a posted link is [new], it should be added to a [list]. If it has been [already posted], the bot should [notify] that this link was already mentioned.  

## getting started with a Bot
- [x] [create a new bot user in slack](https://github.com/slack-ruby/slack-ruby-bot/blob/master/TUTORIAL.md#create-a-bot-user)
- [x] create the folder structure
- [x] create first bot file

### BOT Todo-List
- [x] active listener
- [x] regex for urls
- [ ] set up a database migrate/rollback/seed/reset

### BOT reactions
- [x] new "you just posted a link!"
- [ ] add to list
- [ ] already posted
- [ ] notify "you already posted that link"

### LIST/ARCHIVE Todo-List
- [ ] user_id
- [ ] post_id
- [ ] url_id
- [ ] channel
- [ ] posted date

## Extenstions:
- [ ] show entry options edit/update/delete - if yes, for who? every user?
- [ ] user = related to mail?username?user_id? - what if someone changes mailadress?
