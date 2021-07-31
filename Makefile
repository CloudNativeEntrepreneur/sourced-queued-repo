DEBUG=sourced,sourced-repo-mongo*

test:
	docker-compose up -d
	sleep 10
	$(MAKE) DEBUG= test-debug
	docker-compose down --remove-orphans

test-debug:
	DEBUG=$(DEBUG) ./node_modules/.bin/mocha test -R spec

.PHONY: test
