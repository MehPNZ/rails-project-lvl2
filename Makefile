install:
	bundle install
	yarn install
	bundle exec rubocop
lint:
	bundle exec rubocop

test:
	rake test

.PHONY: test